using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype_University_IS_
{
    public partial class VerifyOTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            string enteredOTP = txtOTP.Text.Trim();
            string sessionOTP = Session["OTP"] as string;
            string username = Session["Username"] as string;

            if (enteredOTP == sessionOTP)
            {
                // OTP is correct, show a page to allow user to reset password
                Response.Redirect("ResetPassword.aspx");
            }
            else
            {
                lblOTPErrorMessage.Text = "Invalid OTP. Please try again.";
            }
        }
    }
}