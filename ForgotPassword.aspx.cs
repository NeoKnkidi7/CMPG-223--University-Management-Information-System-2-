using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;*/

namespace Prototype_University_IS_
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent the page from resubmitting the form on refresh
            if (IsPostBack)
                return;
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            string adminID = txtUsername.Text.Trim();
            string method = ddlMethod.SelectedValue; // Email or Phone

            // Retrieve user contact info based on adminID and method
            string contactInfo = GetUserContactInfo(adminID, method);

            if (!string.IsNullOrEmpty(contactInfo))
            {
                // Generate OTP and send it via the chosen method
                string otp = GenerateOTP();
                bool otpSent = SendOTP(contactInfo, otp, method);

                if (otpSent)
                {
                    // Hash the OTP and store it securely in the session
                    Session["OTP"] = HashOTP(otp);
                    Session["Username"] = adminID;
                    Session["OTPExpiry"] = DateTime.Now.AddMinutes(5); // OTP valid for 5 minutes
                    Response.Redirect("VerifyOTP.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Failed to send OTP. Please try again.";
                }
            }
            else
            {
                lblErrorMessage.Text = "Admin ID not found or invalid method.";
            }
        }

        // Method to retrieve phone number or email based on user selection
        private string GetUserContactInfo(string adminID, string method)
        {
            string contactInfo = null;
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            string query = method == "Email"
                ? "SELECT EmailAddress FROM AdminTable2 WHERE administratorID = @AdminID"
                : "SELECT PhoneNumber FROM AdminTable2 WHERE administratorID = @AdminID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AdminID", adminID);
                    conn.Open();
                    contactInfo = cmd.ExecuteScalar() as string;
                }
            }

            return contactInfo;
        }

        // OTP generation
        private string GenerateOTP()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        // Method to send OTP via email or phone
        private bool SendOTP(string contactInfo, string otp, string method)
        {
            try
            {
                if (method == "Email")
                {
                    // Send OTP via email with HTML template
                    MailMessage mail = new MailMessage("your_email@example.com", contactInfo);
                    mail.Subject = "Your OTP Code";
                    mail.Body = $"<h2>Your OTP code is:</h2><strong>{otp}</strong><br /><p>This code will expire in 5 minutes.</p>";
                    mail.IsBodyHtml = true;

                    SmtpClient smtpClient = new SmtpClient("smtp.example.com");
                    smtpClient.Port = 587;
                    smtpClient.Credentials = new System.Net.NetworkCredential("your_email@example.com", "your_password");
                    smtpClient.EnableSsl = true;
                    smtpClient.Send(mail);
                }
                else if (method == "Phone")
                {
                    // Send OTP via SMS using Twilio
                    string accountSid = "your_twilio_account_sid";
                    string authToken = "your_twilio_auth_token";
                    string fromPhoneNumber = "your_twilio_phone_number";

                    /*TwilioClient.Init(accountSid, authToken);

                    var message = MessageResource.Create(
                        body: $"Your OTP code is: {otp}. It will expire in 5 minutes.",
                        from: new PhoneNumber(fromPhoneNumber),
                        to: new PhoneNumber(contactInfo)
                    );*/
                }

                return true;
            }
            catch (Exception ex)
            {
                // Log the exception for debugging purposes
                lblErrorMessage.Text = "An error occurred while sending the OTP. Please try again.";
                // Optional: Log the exception ex (you can use any logging mechanism)
                return false;
            }
        }

        // Hashing the OTP for secure storage
        private string HashOTP(string otp)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(otp));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}