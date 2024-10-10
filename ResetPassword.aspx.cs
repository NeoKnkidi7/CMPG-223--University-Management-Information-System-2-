using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype_University_IS_
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword == confirmPassword)
            {
                string username = Session["Username"] as string;

                if (UpdatePassword(username, newPassword))
                {
                    lblResetPasswordMessage.Text = "Password has been reset successfully. You can now log in.";
                    // Optionally redirect to the login page
                    Response.Redirect("LogInSystemPage.aspx");
                }
                else
                {
                    lblResetPasswordMessage.Text = "Failed to reset the password. Please try again.";
                }
            }
            else
            {
                lblResetPasswordMessage.Text = "Passwords do not match.";
            }
        }

        private bool UpdatePassword(string username, string newPassword)
        {
            string connectionString = "your_connection_string_here";
            string query = "UPDATE Users SET Password = @Password WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", newPassword); // Ensure password is hashed in a real application

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
        }
    }
}