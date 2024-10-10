<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="Prototype_University_IS_.StudentPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Portal - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }
        .header, .footer {
            background-color: #f0f2f5;
            color: white;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        .header:hover {
            background-color: #34495e;
        }
        .header img {
            height: 120px;
            margin-bottom: 10px;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .nav-bar {
            background-color: #34495e;
            color: white;
            padding: 15px 0;
            display: flex;
            justify-content: center;
            position: sticky;
            top: 0;
            z-index: 2;
        }
        .nav-bar a {
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            display: inline-block;
            font-size: 1.1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 5px;
            margin: 0 10px;
        }
        .nav-bar a:hover {
            background-color: #1abc9c;
            transform: scale(1.05);
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .student-info, .announcements, .tab-container {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .student-info:hover, .announcements:hover, .tab-container:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }
        .student-info h2, .announcements h2, .tab-container h2 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 10px;
            margin-bottom: 10px;
            font-size: 1.8em;
            color: #1abc9c;
        }
        .announcements {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .announcements p {
            margin: 0;
            font-size: 1em;
            color: #34495e;
        }
        .tab-container {
            display: flex;
        }
        .tab-links {
            display: flex;
            flex-direction: column;
            border-right: 2px solid #ddd;
            padding-right: 20px;
        }
        .tab-links button {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1.1em;
            margin-bottom: 10px;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
        }
        .tab-links button:hover {
            background-color: #1abc9c;
            color: #ffffff;
            transform: scale(1.05);
        }
        .tab-content {
            flex: 1;
            display: none;
            padding: 20px;
        }
        .tab-content.active {
            display: block;
        }
        .module-details {
            margin-top: 10px ;
 border-top: 2px solid #1abc9c;
            padding-top: 10px;
        }
        .module-details div {
            margin-bottom: 20px;
        }
        .module-details h4 {
            border-bottom: 2px solid #1abc9c;
            padding-bottom: 5px;
            margin-bottom: 10px;
            font-size: 1.3em;
            color: #1abc9c;
        }
        .module-details p {
            margin: 0;
            font-size: 1em;
            color: #34495e;
        }
        .student-info-right {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .profile-header {
            text-align: center;
        }
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .student-info-right p {
            margin: 5px 0;
            font-size: 1em;
        }
        .student-info-right a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .student-info-right a:hover {
            text-decoration: underline;
        }
        .footer {
            padding: 15px 0;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
        }
        .gradient {
            background-image: linear-gradient(to bottom, #1abc9c, #2ecc71);
            background-size: 100% 200px;
            background-position: 0% 100%;
            animation: gradient 10s ease infinite;
        }
        @keyframes gradient {
            0% {
                background-position: 0% 100%;
            }
            50% {
                background-position: 100% 100%;
            }
            100% {
                background-position: 0% 100%;
            }
        }
    </style>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function openTab(tabName) {
                var i;
                var x = document.getElementsByClassName("tab-content");
                for (i = 0; i < x.length; i++) {
                    x[i].classList.remove("active");
                }
                document.getElementById(tabName).classList.add("active");
            }

            function toggleDetails(detailsId) {
                var element = document.getElementById(detailsId);
                element.classList.toggle("active");
            }

            document.querySelectorAll(".tab-links button").forEach(button => {
                button.addEventListener("click", function () {
                    openTab(this.dataset.tab);
                });
            });

            document.querySelectorAll(".module button").forEach(button => {
                button.addEventListener("click", function () {
                    toggleDetails(this.dataset.details);
                });
            });
        });

        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = "LogInSystemPage.aspx";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header gradient">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="120px" Width="180px" />
            <h1>Howark University - Student Portal</h1>
        </div>
        
        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="HomePage.aspx">Home</a>
            <a href="StudentPage.aspx">Student Portal</a>&nbsp;&nbsp;
        </div>

        <!-- Container for Main Content -->
        <div class="container">
            <!-- Current Modules Bar -->
            <div class="student-info">
                <h2>Current Modules</h2>
                <div class="tab-container">
                    <div class="tab-links">
                        <button type="button" data-tab="module1">Introduction to Programming</button>
                        <button type="button" data-tab="module2">Advanced Mathematics</button>
                        <button type="button" data-tab="module3">Data Structures and Algorithm</button>
                        <button type="button" data-tab="module4">Computer Systems</button>
                        <button type="button" data-tab="module5">Software Engineering</button>
 </div>
                    
                    <!-- Tab Contents -->
                    <div id="module1" class="tab-content">
                        <div class="tab-links">
                            <button type="button" data-details="module1Overview">Module Overview</button>
                            <button type="button" data-details="module1Lecturer"> Lecturer Details</button>
                            <button type="button" data-details="module1Material">Study Material</button>
                            <button type="button" data-details="module1Tests">Tests</button>
                            <button type="button" data-details="module1Assignments">Assignments</button>
                        </div>
                        <div id="module1Overview" class="module-details">
                            <h4>Overview</h4>
                            <p>This module introduces basic programming concepts using Python.</p>
                        </div>
                        <div id="module1Lecturer" class="module-details">
                            <h4>Lecturer Details</h4>
                            <p>Dr. John Smith</p>
                        </div>
                    </div>
                    
                    <div id="module2" class="tab-content">
                        <div class="tab-links">
                            <button type="button" data-details="module2Overview">Module Overview</button>
                            <button type="button" data-details="module2Lecturer">Lecturer Details</button>
                            <button type="button" data-details="module2Material">Study Material</button>
                        </div>
                    </div>

                    <div id="module3" class="tab-content">
                        <div class="tab-links">
                            <button type="button" data-details="module3Overview">Module Overview</button>
                            <button type="button" data-details="module3Lecturer">Lecturer Details</button>
                            <button type="button" data-details="module3Material">Study Material</button>
                        </div>
                    </div>

                    <div id="module4" class="tab-content">
                        <div class="tab-links">
                            <button type="button" data-details="module4Overview">Module Overview</button>
                            <button type="button" data-details="module4Lecturer">Lecturer Details</button>
                            <button type="button" data-details="module4Material">Study Material</button>
                        </div>
                    </div>

                    <div id="module5" class="tab-content">
                        <div class="tab-links">
                            <button type="button" data-details="module5Overview">Module Overview</button>
                            <button type="button" data-details="module5Lecturer">Lecturer Details</button>
                            <button type="button" data-details="module5Material">Study Material</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Announcements Block -->
            <div class="announcements">
                <h2>Announcements</h2>
                <p>Important announcements will be displayed here.</p>
            </div>

            <!-- Right Section for Student Information -->
            <div class="student-info-right">
                <div class="profile-header">
                    <img class="profile-pic" src="student-photo.jpg" alt="Profile Picture" />
                    <p><strong>Student ID:</strong> 45979278</p>
                    <p><strong>Name:</strong> N.K NKIDI</p>
                    <a href="#" onclick="logout()">Logout</a>
                </div>
            </div>
        </div>
        
        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All rights reserved.</p>
        </div>
    </form>
</body>
</html>