using DocumentFormat.OpenXml.Bibliography;
using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;



namespace Prototype_University_IS_
{
    public partial class AdministratorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string adminID = GetAdminIDFromSession();
                if (adminID != null)
                {
                    // DisplayAdministratorDetails(adminID);
                }
                else
                {
                    // Redirect to login if no admin session found
                    Response.Redirect("LogInSystemPage.aspx");
                }
            }
        }

        private string GetAdminIDFromSession()
        {
            return Session["AdminID"] as string;
        }



        #region Student Management

       

            private void AddStudentToDatabase(int StudentID, string FirstNames, string LastName, DateTime DateOfBirth, string ContactNumber, string EmailAddress, string Address, string Gender, string Nationality, string Race, string Password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString;

            string query = "INSERT INTO studentTable (StudentID, FirstNames, LastName, DateOfBirth, ContactNumber, EmailAddress, Address, Gender, Nationality, Race, Password) " +
                   "VALUES (@StudentID, @FirstNames, @LastName, @DateOfBirth, @ContactNumber, @EmailAddress, @Address, @Gender, @Nationality, @Race, @Password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("@StudentID", StudentID);
                    command.Parameters.AddWithValue("@FirstNames", FirstNames);
                    command.Parameters.AddWithValue("@LastName", LastName);
                    command.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
                    command.Parameters.AddWithValue("@ContactNumber", ContactNumber);
                    command.Parameters.AddWithValue("@EmailAddress", EmailAddress);
                    command.Parameters.AddWithValue("@Address", Address);
                    command.Parameters.AddWithValue("@Gender", Gender);
                    command.Parameters.AddWithValue("@Nationality", Nationality);
                    command.Parameters.AddWithValue("@Race", Race);
                    command.Parameters.AddWithValue("@Password", Password);

                    
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        private void EditStudentInDatabase(int studentID, string firstNames, string lastName, DateTime dateOfBirth, string contactNumber, string emailAddress, string address, string gender, string nationality, string race, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString; // Update this
            string query = "UPDATE studentTable SET FirstNames=@FirstNames, LastName=@LastName, DateOfBirth=@DateOfBirth, ContactNumber=@ContactNumber, " +
                           "EmailAddress=@EmailAddress, Address=@Address, Gender=@Gender, Nationality=@Nationality, Race=@Race, Password=@Password WHERE StudentID=@StudentID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentID);
                    command.Parameters.AddWithValue("@FirstNames", firstNames);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                    command.Parameters.AddWithValue("@ContactNumber", contactNumber);
                    command.Parameters.AddWithValue("@EmailAddress", emailAddress);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.Parameters.AddWithValue("@Nationality", nationality);
                    command.Parameters.AddWithValue("@Race", race);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void DeleteStudentFromDatabase(int studentID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString; // Update this
            string query = "DELETE FROM studentTable WHERE StudentID=@StudentID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Implement Edit and Delete for Students in a similar fashion

        #endregion

        #region Course Management

        protected void BtnAddCourse_Click(object sender, EventArgs e)
        {
            // Declare variables for course details
            int courseID;
            int credits;
            int facultyID;
            int year;

            // Attempt to parse the input values
            bool isCourseIDValid = int.TryParse(txtcourseID.Text, out courseID);
            bool isCreditsValid = int.TryParse(txtCredits.Text, out credits);
            bool isFacultyIDValid = int.TryParse(txtFacultyID.Text, out facultyID); // Ensure txtFacultyID is a DropDownList
            bool isYearValid = int.TryParse(txtYear.Text, out year);

            // Check if all input values are valid
            if (isCourseIDValid && isCreditsValid && isFacultyIDValid && isYearValid)
            {
                // Call the method to add the course to the database
                AddCourseToDatabase(courseID, txtCourseTitle.Text, txtCourseDescription.Text, credits, facultyID);
            }
            else
            {
                // Handle validation failure (e.g., show an error message to the user)
                // Example: lblErrorMessage.Text = "Please enter valid numeric values.";
            }

        }


        private void AddCourseToDatabase(int courseID, string title, string description, int credits, int facultyID)

        {

            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString;


            using (SqlConnection connection = new SqlConnection(connectionString))

            {

                connection.Open();


                // Check if the facultyID exists

                SqlCommand checkFacultyCmd = new SqlCommand("SELECT COUNT(*) FROM facultyTable WHERE FacultyID = @facultyID", connection);

                checkFacultyCmd.Parameters.AddWithValue("@facultyID", facultyID);


                int count = (int)checkFacultyCmd.ExecuteScalar();


                if (count == 0)

                {

                    // Handle the case where the FacultyID is invalid

                    lblErrorMessage.Text = "The selected Faculty ID does not exist.";

                    return;

                }


                // Check if the courseID already exists

                SqlCommand checkCourseCmd = new SqlCommand("SELECT COUNT(*) FROM course WHERE CourseID = @courseID", connection);

                checkCourseCmd.Parameters.AddWithValue("@courseID", courseID);


                int courseCount = (int)checkCourseCmd.ExecuteScalar();


                if (courseCount > 0)

                {

                    // Handle the case where the CourseID already exists

                    lblErrorMessage.Text = "The Course ID already exists.";

                    return;

                }


                // If the FacultyID and CourseID are valid, proceed with the insertion

                SqlCommand insertCourseCmd = new SqlCommand("INSERT INTO course (CourseID, Title, Description, Credit, FacultyID, Semester, Year) VALUES (@courseID, @title, @description, @credits, @facultyID, @semester, @year)", connection);


                // Add parameters to the insert command

                insertCourseCmd.Parameters.AddWithValue("@courseID", courseID);

                insertCourseCmd.Parameters.AddWithValue("@title", title);

                insertCourseCmd.Parameters.AddWithValue("@description", description);

                insertCourseCmd.Parameters.AddWithValue("@credits", credits);

                insertCourseCmd.Parameters.AddWithValue("@facultyID", facultyID);

                //insertCourseCmd.Parameters.AddWithValue("@semester", semester);

                //insertCourseCmd.Parameters.AddWithValue("@year", year);


                // Execute the insert command

                insertCourseCmd.ExecuteNonQuery();

                connection.Close();

            }

        }

        private void EditCourseInDatabase(int courseID, string title, string description, int credits, int facultyID,  int year)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString; // Update this
            string query = "UPDATE course SET Title=@Title, Description=@Description, Credit=@Credit, FacultyID=@FacultyID, Semester=@Semester, Year=@Year WHERE CourseID=@CourseID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CourseID", courseID);
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@Credit", credits);
                    command.Parameters.AddWithValue("@FacultyID", facultyID);
                    
                    command.Parameters.AddWithValue("@Year", year);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void DeleteCourseFromDatabase(int courseID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString;// Update this
            string query = "DELETE FROM course WHERE CourseID=@CourseID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CourseID", courseID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Implement Edit and Delete for Courses in a similar fashion

        #endregion

        #region Report Generation

        protected void BtnGenerateStudentReport_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString;
            string query = "SELECT FirstNames, LastName, EmailAddress, DateOfBirth, ContactNumber, Address FROM studentTable";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    string htmlTable = "<table border='1'><tr><th>First Names</th><th>Last Name</th><th>Email</th><th>DOB</th><th>Contact Number</th><th>Address</th></tr>";

                    while (reader.Read())
                    {
                        htmlTable += "<tr>";
                        htmlTable += $"<td>{reader["FirstNames"]}</td>";
                        htmlTable += $"<td>{reader["LastName"]}</td>";
                        htmlTable += $"<td>{reader["EmailAddress"]}</td>";
                        htmlTable += $"<td>{((DateTime)reader["DateOfBirth"]).ToShortDateString()}</td>";
                        htmlTable += $"<td>{reader["ContactNumber"]}</td>";
                        htmlTable += $"<td>{reader["Address"]}</td>";
                        htmlTable += "</tr>";
                    }

                    htmlTable += "</table>";
                    litStudentReport.Text = htmlTable; // Display report in the literal control
                }
            }
        }


        protected void BtnGenerateCourseReport_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UniversityManagementISDataBase"].ConnectionString;
            string query = @"
        SELECT c.Title AS CourseName, c.Description, c.Credit, f.FacultyName AS Faculty
        FROM course c
        INNER JOIN facultyTable f ON c.FacultyID = f.FacultyID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    string htmlTable = "<table border='1'><tr><th>Course Name</th><th>Description</th><th>Credits</th><th>Faculty</th></tr>";

                    while (reader.Read())
                    {
                        htmlTable += "<tr>";
                        htmlTable += $"<td>{reader["CourseName"]}</td>";
                        htmlTable += $"<td>{reader["Description"]}</td>";
                        htmlTable += $"<td>{reader["Credit"]}</td>";
                        htmlTable += $"<td>{reader["Faculty"]}</td>";
                        htmlTable += "</tr>";
                    }

                    htmlTable += "</table>";
                    litCourseReport.Text = htmlTable; // Display report in the literal control
                }
            }
        }

        

        

        protected void BtnEditCourse_Click(object sender, EventArgs e)
        {
            // Gather details for the course to edit and call the edit method
            EditCourseInDatabase(
                Convert.ToInt32(txtcourseID.Text),    // Assuming a TextBox for Course ID
                txtCourseTitle.Text,                   // Assuming a TextBox for Course Title
                txtCourseDescription.Text,             // Assuming a TextBox for Course Description
                Convert.ToInt32(txtCredits.Text),      // Assuming a TextBox for Credits
                Convert.ToInt32(txtFacultyID.Text), // Assuming a DropDownList for Faculty
                            // Assuming a DropDownList for Semester
                Convert.ToInt32(txtYear.Text)          // Assuming a TextBox for Year
            );

            // Optionally clear the input fields after editing or redirect to another page
            ClearCourseInputFields();

        }
        private void ClearCourseInputFields()
        {
            txtcourseID.Text = string.Empty;
            txtCourseTitle.Text = string.Empty;
            txtCourseDescription.Text = string.Empty;
            txtCredits.Text = string.Empty;
             // Reset to the first item
            txtYear.Text = string.Empty;
        }

        private void ClearStudentInputFields()
        {
            txtStudentID.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            txtEmailAddress.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlGender.SelectedIndex = 0; // Reset to the first item
            txtNationality.Text = string.Empty;
            txtRace.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

        protected void BtnDeleteCourse_Click(object sender, EventArgs e)
        {
            DeleteCourseFromDatabase(Convert.ToInt32(txtcourseID.Text));

        }

        
        


        protected void BtnEditStudent_Click1(object sender, EventArgs e)
        {
            // Gather details for the student to edit and call the edit method
            EditStudentInDatabase(
                Convert.ToInt32(txtStudentID.Text), // Assuming a TextBox for Student ID
                txtFirstName.Text,                   // Assuming a TextBox for First Name
                txtLastName.Text,                    // Assuming a TextBox for Last Name
                Convert.ToDateTime(txtDOB.Text),     // Assuming a TextBox for Date of Birth
                txtContactNumber.Text,               // Assuming a TextBox for Contact Number
                txtEmailAddress.Text,                 // Assuming a TextBox for Email Address
                txtAddress.Text,                      // Assuming a TextBox for Address
                ddlGender.SelectedValue,              // Assuming a DropDownList for Gender
                txtNationality.Text,                  // Assuming a TextBox for Nationality
                txtRace.Text,                         // Assuming a TextBox for Race
                txtPassword.Text                      // Assuming a TextBox for Password
            );

            // Optionally, you can clear the input fields after editing or redirect to another page
            ClearStudentInputFields();
            // Optionally: Response.Redirect("SomePage.aspx");

        }

        protected void BtnDeleteStudent_Click1(object sender, EventArgs e)
        {
            int studentID = Convert.ToInt32(txtStudentID.Text); // Assuming a TextBox for Student ID
            DeleteStudentFromDatabase(studentID);

            // Optionally clear the input fields or show a message
            ClearStudentInputFields();

        }

        protected void BtnAddStudent_Click(object sender, EventArgs e)
        {
            // Example: Gather student details from the UI

            AddStudentToDatabase(

                Convert.ToInt32(txtStudentID.Text), // Assuming a TextBox for Student ID

                txtFirstName.Text,                  // Assuming a TextBox for First Name

                txtLastName.Text,                   // Assuming a TextBox for Last Name

                Convert.ToDateTime(txtDOB.Text),    // Assuming a TextBox for Date of Birth

                txtContactNumber.Text,              // Assuming a TextBox for Contact Number

                txtEmailAddress.Text,                // Assuming a TextBox for Email Address

                txtAddress.Text,                     // Assuming a TextBox for Address

                ddlGender.SelectedValue,             // Assuming a DropDownList for Gender

                txtNationality.Text,                 // Assuming a TextBox for Nationality

                txtRace.Text,                        // Assuming a TextBox for Race

                txtPassword.Text                     // Assuming a TextBox for Password

            );

        }
    }
}

        #endregion



    

