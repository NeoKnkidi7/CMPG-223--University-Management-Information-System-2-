using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype_University_IS_
{
    public partial class StudentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming session variables are set during login
                if (Session["StudentID"] != null )
                {
                    //lblStudentNumber.Text = Session["StudentID"].ToString();
                    //lblName.Text = Session["Name"].ToString();
                    //lblSurname.Text = Session["Surname"].ToString();
                }
                else
                {
                    // Handle case where session variables are not set (e.g., redirect to login)
                    Response.Redirect("LogInSystemPage.aspx");
                }
            }


            if (!IsPostBack)
            {
                string ID = GetIDFromSession();
                if (ID != null)
                {
                    DisplayDetails(ID);
                }
                else
                {
                    // Handle case where no valid admin ID is found (e.g., redirect to login page)
                    Response.Redirect("LogInSystemPage.aspx");
                }
            }
        }


        private string GetIDFromSession()
        {
            return Session["StudentID"] as string;
        }


        private void DisplayDetails(string adminID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["University Information System DataBase"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                // Handle missing connection string
                //labelName.Text = "Error: Connection string is missing.";
                //labelSurname.Text = "";
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Surname FROM AdminTable WHERE administratorID = @AdministratorID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@AdministratorID", adminID);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        string name = reader["Name"].ToString();
                        string surname = reader["Surname"].ToString();

                        // Set the text of the labels
                        //lblName.Text = " " + name;
                        //lblSurname.Text = " " + surname;
                    }
                    else
                    {
                        // Handle case where no data is returned
                        //lblInvalidLoginDetailsErrorMessage.Text = "Student not found.";
                        //labelSurname.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it and show an error message)
                    //labelName.Text = "Error retrieving administrator details.";
                    //labelSurname.Text = "";
                    // Log the exception
                    // Console.WriteLine(ex.Message); // Example logging
                }
            }
        }
    }
}