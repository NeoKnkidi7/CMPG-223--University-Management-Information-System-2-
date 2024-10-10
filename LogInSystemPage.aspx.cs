using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Prototype_University_IS_
{
    public partial class LogInSystemPage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlDataSource dataSource = new SqlDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            try
            {
                // Check the selected value of the DropDownList
                if (ddlUserType.SelectedValue == "Administrator")
                {
                    ddlUserType.Focus();

                    // Retrieve the entered username and password
                    string username = txtUsername.Text; // Assuming you have a TextBox for username
                    string password = txtPassword.Text; // Assuming you have a TextBox for password


                    using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True")) // Use your connection string
                    {
                        connection.Open();

                        // Define the query to check the username and password in the Administrator table
                        string query = "SELECT * FROM AdminTable2 WHERE administratorID = @Username AND Password = @Password";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Add parameters to avoid SQL injection
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Password", password);

                            // Execute the query and get the count
                            object result = command.ExecuteScalar();

                            // Check if the result is not null and parse it
                            if (result != null && int.TryParse(result.ToString(), out int count))
                            {
                                if (count > 0)
                                {
                                    Session["AdminID"] = username;
                                    // Credentials are valid, redirect to the Administrator Page
                                    Response.Redirect("AdministratorPage.aspx");
                                }
                                else
                                {
                                    // Invalid login details
                                    //lblInvalidLoginDetailsErrorMessage.Text = "Invalid username or password."; // Assuming you have a Label for error messages
                                }
                            }
                            else
                            {
                                // Handle unexpected null result
                                //lblInvalidLoginDetailsErrorMessage.Text = "An unexpected error occurred. Please try again.";
                            }
                        }
                    }
                }
                else if (ddlUserType.SelectedValue == "Student")
                {
                    ddlUserType.Focus();

                    // Retrieve the entered username and password
                    string username = txtUsername.Text; // Assuming you have a TextBox for username
                    string password = txtPassword.Text; // Assuming you have a TextBox for password


                    using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True")) // Use your connection string
                    {
                        connection.Open();

                        // Define the query to check the username and password in the Administrator table
                        string query = "SELECT * FROM AdminTable2 WHERE administratorID = @Username AND Password = @Password";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Add parameters to avoid SQL injection
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Password", password);

                            // Execute the query and get the count
                            object result = command.ExecuteScalar();

                            // Check if the result is not null and parse it
                            if (result != null && int.TryParse(result.ToString(), out int count))
                            {
                                if (count > 0)
                                {
                                    Session["StudentID"] = username;
                                    // Credentials are valid, redirect to the Administrator Page
                                    Response.Redirect("StudentPage.aspx");
                                }
                                else
                                {
                                    // Invalid login details
                                    //lblInvalidLoginDetailsErrorMessage.Text = "Invalid username or password."; // Assuming you have a Label for error messages
                                }
                            }
                            else
                            {
                                // Handle unexpected null result
                                //lblInvalidLoginDetailsErrorMessage.Text = "An unexpected error occurred. Please try again.";
                            }
                        }
                    }
                    

                }
                else if (ddlUserType.SelectedValue == "Applicant")
                {
                    if (!IsPostBack)
                    {
                        ddlUserType.Focus();

                        // Retrieve the entered username and password
                        string username = txtUsername.Text; // Assuming you have a TextBox for username
                        string password = txtPassword.Text; // Assuming you have a TextBox for password


                        using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True")) // Use your connection string
                        {
                            connection.Open();

                            // Define the query to check the username and password in the Administrator table
                            string query = "SELECT * FROM AdminTable2 WHERE administratorID = @Username AND Password = @Password";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                // Add parameters to avoid SQL injection
                                command.Parameters.AddWithValue("@Username", username);
                                command.Parameters.AddWithValue("@Password", password);

                                // Execute the query and get the count
                                object result = command.ExecuteScalar();

                                // Check if the result is not null and parse it
                                if (result != null && int.TryParse(result.ToString(), out int count))
                                {
                                    if (count > 0)
                                    {
                                        Session["AdminID"] = username;
                                        // Credentials are valid, redirect to the Administrator Page
                                        Response.Redirect("ApplicantPage.aspx");
                                    }
                                    else
                                    {
                                        // Invalid login details
                                        //lblInvalidLoginDetailsErrorMessage.Text = "Invalid username or password."; // Assuming you have a Label for error messages
                                    }
                                }
                                else
                                {
                                    // Handle unexpected null result
                                    //lblInvalidLoginDetailsErrorMessage.Text = "An unexpected error occurred. Please try again.";
                                }
                            }
                        }
                        Response.Redirect("ApplicantPage.aspx");
                    }


                }
                else if (ddlUserType.SelectedValue == "Lecturer")
                {
                    ddlUserType.Focus();

                    // Retrieve the entered username and password
                    string username = txtUsername.Text; // Assuming you have a TextBox for username
                    string password = txtPassword.Text; // Assuming you have a TextBox for password


                    using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\45979\\OneDrive\\Documents\\New folder\\Prototype(University IS)\\App_Data\\University Information System DataBase.mdf\";Integrated Security=True")) // Use your connection string
                    {
                        connection.Open();

                        // Define the query to check the username and password in the Administrator table
                        string query = "SELECT * FROM AdminTable2 WHERE administratorID = @Username AND Password = @Password";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Add parameters to avoid SQL injection
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Password", password);

                            // Execute the query and get the count
                            object result = command.ExecuteScalar();

                            // Check if the result is not null and parse it
                            if (result != null && int.TryParse(result.ToString(), out int count))
                            {
                                if (count > 0)
                                {
                                    Session["AdminID"] = username;
                                    // Credentials are valid, redirect to the Administrator Page
                                    Response.Redirect("LecturerPage.aspx");
                                }
                                else
                                {
                                    // Invalid login details
                                    //lblInvalidLoginDetailsErrorMessage.Text = "Invalid username or password."; // Assuming you have a Label for error messages
                                }
                            }
                            else
                            {
                                // Handle unexpected null result
                                //lblInvalidLoginDetailsErrorMessage.Text = "An unexpected error occurred. Please try again.";
                            }
                        }
                    }
                    Response.Redirect("LecturerPage.aspx");

                }
                else
                {
                    // Handle other user types or show an error message if needed
                    //lblMessage.Text = "Please select a valid user type.";
                    //lblMessage.CssClass = "error-message";
                }










                
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during the login process
                //lblMessage.Text = $"An error occurred: {ex.Message}";
                //lblMessage.CssClass = "error-message";
            }
        }
    }
}