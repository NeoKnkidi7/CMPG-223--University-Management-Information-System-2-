<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WhatToStudyPage.aspx.cs" Inherits="Prototype_University_IS_.WhatToStudyPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>What to Study - Howark University</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">

    <link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style type="text/css">

        body {

            font-family: 'Roboto', Arial, sans-serif;

            background-color: #f0f2f5;

            margin: 0;

            padding: 0;

            overflow-x: hidden;

            scroll-behavior: smooth;

        }

        .header {

            background-color: #2c3e50;

            color: white;

            text-align: center;

            padding: 30px 0;

            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);

        }

        .header h1 {

            margin: 0;

            font-size: 3.5em;

            letter-spacing: 1px;

        }

        .nav-bar {

            background-color: #34495e;

            color: white;

            padding: 15px 0;

            text-align: center;

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

        .main-content {

            display: flex;

            flex-wrap: wrap;

            padding: 20px;

            max-width: 1200px;

            margin: auto;

        }

        .programs-section, .courses-section {

            flex: 1 1 100%;

            margin-bottom: 20px;

        }

        .program-card, .course-card {

            background-color: #ffffff;

            border: 1px solid #e0e0e0;

            border-radius: 15px;

            padding: 20px;

            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);

            margin-bottom: 20px;

            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;

        }

        .program-card:hover, .course-card:hover {

            transform: translateY(-8px);

            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);

            background-color: #f9f9f9;

        }

        .program-card h2, .course-card h2 {

            margin-top: 0;

            font-size: 1.8em;

            color: #2c3e50;

        }

        .program-card p, .course-card p {

            font-size: 1.1em;

            line-height: 1.6;

        }

        .program-card a, .course-card a {

            color: #1abc9c;

            text-decoration: none;

            font-weight: bold;

        }

        .program-card a:hover, .course-card a:hover {

            text-decoration: underline;

            color: #16a085;

        }

        .footer {

            background-color: #2c3e50;

            color: white;

            text-align: center;

            padding: 15px 0;

            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);

        }

        .social-links {

            margin-top: 20px;

        }

        .social-links a {

            margin: 0 10px;

            font-size: 1.5em;

            color: white;

            transition: color 0.3s ease;

        }

        .social-links a:hover {

            color: #1abc9c;

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- Header Section -->

        <div class="header">

            <h1>Howark University</h1>

        </div>


        <!-- Navigation Bar -->

        <div class="nav-bar">

            <a href="DefualtPage.aspx">Home</a>

            <a href="AboutUsPage.aspx">About Us</a>

            <a href="WhatToStudyPage.aspx">What to Study</a>

            <a href="FacultiesPage.aspx">Faculties</a>

            <a href="Contact.aspx">Contact</a>

        </div>


        <!-- Main Content Section -->

        <div class="main-content">

            <h1>What to Study</h1>


            <!-- Programs Section -->

            <div class="programs-section">

                <h2>Academic Programs</h2>

                <div class="program-card">

                    <h2>Undergraduate Programs</h2>

                    <p>Our undergraduate programs offer a broad foundation in various fields of study.</p>

                    <a href="UndergraduatePrograms.aspx">Explore Undergraduate Programs</a>

                </div>

                <div class="program-card">

                    <h2>Postgraduate Programs</h2>

                    <p>Our postgraduate programs provide advanced study and research opportunities.</p>

                    <a href="PostgraduatePrograms.aspx">Explore Postgraduate Programs</a>

                </div>

                <div class="program-card">

                    <h2>Online Programs</h2>

                    <p>Flexible online programs for working professionals and remote learners.</p>

                    <a href="OnlinePrograms.aspx">Explore Online Programs</a>

                </div>

            </div>


            <!-- Courses Section -->

            <div class="courses-section">

                <h2>Courses</h2>

                <div class="course-card">

                    <h2>Course Catalog</h2>

                    <p>Browse our comprehensive catalog of courses available this semester.</p>

                    <a href="CourseCatalog.aspx">View Course Catalog</a>

                </div>

                <div class="course-card">

                    <h2>Upcoming Courses</h2>

                    <p>Find information about new and upcoming courses offered by our university.</p>

                    <a href="UpcomingCourses.aspx">View Upcoming Courses</a>

                </div>

            </div>

        </div>


        <!-- Footer Section -->

        <div class="footer">

            <p>&copy; 2024 Howark University. All Rights Reserved.</p>

            <div class="social-links">

                <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>

                <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>

                <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>

                <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>

            </div>

        </div>

    </form>

</body>

</html>