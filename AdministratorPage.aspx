<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministratorPage.aspx.cs" Inherits="Prototype_University_IS_.AdministratorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator Page - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        body { font-family: 'Roboto', Arial, sans-serif; background-color: #f0f2f5; margin: 0; padding: 0; overflow-x: hidden; }
        .header, .footer { background-color: #2c3e50; color: white; text-align: center; padding: 20px 0; }
        .nav-bar { background-color: #34495e; color: white; padding: 15px 0; display: flex; justify-content: center; }
        .nav-bar a { color: white; padding: 12px 25px; text-decoration: none; font-size: 1.1em; }
        .container { padding: 20px; max-width: 1200px; margin: auto; display: flex; flex-direction: column; gap: 20px; }
        .section { background-color: #fff; border-radius: 15px; padding: 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); }
        .section h2 { border-bottom: 2px solid #1abc9c; padding-bottom: 10px; font-size: 1.8em; color: #1abc9c; }
        .form-group input, .form-group button { width: 100%; padding: 10px; border-radius: 8px; }
        .form-group button { background-color: #1abc9c; color: white; cursor: pointer; }
        .admin-info-right { position: fixed; top: 20px; right: 20px; background-color: #ffffff; padding: 10px; border-radius: 15px; }
        .dark-mode-toggle { position: fixed; bottom: 20px; right: 20px; background-color: #1abc9c; color: white; padding: 10px 15px; border-radius: 50px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="120px" Width="180px" />
            <h1>Howark University - Administrator Portal</h1>
        </div>

        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="HomePage.aspx">Home</a>
            <a href="AdministratorPage.aspx">Administrator Portal</a>
        </div>

        <!-- Container for Main Content -->
        <div class="container">
            <!-- Maintain Students -->
            <div class="section">
                <h2>Maintain Students</h2>
                
                <asp:Button ID="BtnAddStudent" runat="server" OnClick="BtnAddStudent_Click" Text="Add Student" />
                <asp:Button ID="BtnEditStudent" runat="server" OnClick="BtnEditStudent_Click1" Text="Edit Student" />
                <asp:Button ID="BtnDeleteStudent" runat="server" OnClick="BtnDeleteStudent_Click1" Text="Delete Student" />
                <div class="form-group">
                    <label for="txtStudentID">Student ID:</label>
                    <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtFirstName">First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDOB">Date of Birth:</label>
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtContactNumber">Contact Number:</label>
                    <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmailAddress">Email Address:</label>
                    <asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlGender">Gender:</label>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtNationality">Nationality:</label>
                    <asp:TextBox ID="txtNationality" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtRace">Race:</label>
                    <asp:TextBox ID="txtRace" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPassword">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>

            <!-- Manage Courses -->
            <div class="section">
                <h2>Manage Courses</h2>
                <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="form-group" OnClick="BtnAddCourse_Click" />
                <asp:Button ID="btnEditCourse" runat="server" Text="Edit Course" CssClass="form-group" OnClick="BtnEditCourse_Click" />
                <asp:Button ID="btnDeleteCourse" runat="server" Text="Delete Course" CssClass="form-group" OnClick="BtnDeleteCourse_Click" />
                <div class="form-group">
                    <label for="txtCourseID">Course ID:</label>
                    <asp:TextBox ID="txtcourseID" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCourseTitle">Course Title:</label>
                    <asp:TextBox ID="txtCourseTitle" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCourseDescription">Course Description:</label>
                    <asp:TextBox ID ="txtCourseDescription" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCredits">Credits:</label>
                    <asp:TextBox ID="txtCredits" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
    <label for="txtFacultyID">FacultyID:</label>
    <asp:TextBox ID="txtFacultyID" runat="server"></asp:TextBox>
</div>
                
                <div class="form-group">
                    <label for="txtYear">Year:</label>
                    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <!-- Generate Report -->
            <div class="section">
                <h2>Request Report</h2>
                <asp:Button ID="btnGenerateStudentReport" runat="server" Text="Generate Student Report" CssClass="form-group" OnClick="BtnGenerateStudentReport_Click" />
                <asp:Button ID="btnGenerateCourseReport" runat="server" Text="Generate Course Report" CssClass="form-group" OnClick="BtnGenerateCourseReport_Click" />
            </div>
        </div>

        <!-- Display Report for Students and Courses -->
        <asp:Literal ID="litStudentReport" runat="server" />
        <asp:Literal ID="litCourseReport" runat="server" />

        <!-- Right-side Panel with Admin Info -->
        <div class="admin-info-right">
            <div class="profile-header">
                <asp:Image ID="adminProfilePic" runat="server" ImageUrl="~/default-profile.png" CssClass="profile-pic" />
                <p><strong><asp:Label ID="lblAdminName" runat="server" Text="Admin Name" /></strong></p>
            </div>
            <p>Admin ID: <asp:Label ID="lblAdminID" runat="server" Text="45979278" /></p>
            <p>Email: neonkidi296@gmail.com</p>
            <p>Phone: <asp:Label ID="lblAdminPhone" runat="server" Text="0822132330" /></p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="form-group" OnClientClick="logout(); return false;" />
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All Rights Reserved.</p>
        </div>

        <!-- Dark Mode Toggle Button -->
        <button class="dark-mode-toggle"><i class="fas fa-moon"></i></button>
    </form>

    <script type="text/javascript">
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
        }
        function printReport(divID) {
            var content = document.getElementById(divID).innerHTML;
            var myWindow = window.open('', '', 'width=800,height=600');
            myWindow.document.write(content);
            myWindow.document.close();
            myWindow.focus();
            myWindow.print();
            myWindow.close();
        }
    </script>
</body>
</html>