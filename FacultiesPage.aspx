<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultiesPage.aspx.cs" Inherits="Prototype_University_IS_.FacultiesPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculties - Howark University</title>
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
        .hero {
            background-image: url('images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 80px 20px;
            margin-bottom: 20px;
            box-shadow: inset 0 0 0 2000px rgba(0, 0, 0, 0.4);
        }
        .hero h2 {
            font-size: 3em;
            margin: 0;
        }
        .hero p {
            font-size: 1.5em;
            margin: 10px 0;
        }
        .hero .btn {
            display: inline-block;
            background-color: #1abc9c;
            color: white;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .hero .btn:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }
        .main-content {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .sidebar {
            flex: 1 1 300px;
            padding: 20px;
            position: -webkit-sticky;
            position: sticky;
            top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
        }
        .sidebar h3 {
            margin-top: 0;
            color: #2c3e50;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .sidebar ul li a:hover {
            text-decoration: underline;
            color: #16a085;
        }
        .main-content-content {
            flex: 3 1 0;
        }
        .faculties-section {
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .faculty-card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            flex: 1 1 calc(50% - 20px);
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
        }
        .faculty-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }
        .faculty-card h2 {
            margin-top: 0;
            font-size: 1.8em;
            color: #2c3e50;
        }
        .faculty-card p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        .faculty-card a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .faculty-card a:hover {
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
            <a href="LogInSystemPage.aspx">Log In</a>
        </div>

        <!-- Hero Section -->
        <div class="hero">
            <h2>Explore Our Diverse Faculties</h2>
            <p>Discover the various programs and opportunities that Howark University has to offer.</p>
            <a href="#faculties" class="btn">See Our Faculties</a>
        </div>

        <!-- Main Content Section -->
        <div class="main-content">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#health-sciences">Faculty of Health Sciences</a></li>
                    <li><a href="#engineering">Faculty of Engineering and Agricultural Sciences</a></li>
                    <li><a href="#arts">Faculty of Arts and Humanities</a></li>
                    <li><a href="#business">Faculty of Economics, Management, and Business</a></li>
                </ul>
            </div>
            
            <!-- Main Content -->
            <div class="main-content-content">
                <h1 id="faculties">Our Faculties</h1>
                <div class="faculties-section">
                    <div class="faculty-card" id="health-sciences">
                        <h2>Faculty of Health Sciences</h2>
                        <p>The Faculty of Health Sciences offers programs in various fields related to Health Sciences, including Biology, Medicine, Nursing, and Pathology.</p>
                        <a href="Documents/Health Sciences Prospectus.pdf" target="_blank">Download Brochure</a>
                    </div>
                    <div class="faculty-card" id="engineering">
                        <h2>Faculty of Engineering and Agricultural Sciences</h2>
                        <p>The Faculty of Engineering offers programs across various disciplines, including Civil Engineering, Mechanical Engineering, Electrical Engineering, and Computer Science.</p>
                        <a href="Documents/Brochure.pdf" target="_blank">Download Brochure</a>
                    </div>
                    <div class="faculty-card" id="arts">
                        <h2>Faculty of Arts and Humanities</h2>
                        <p>The Faculty of Arts offers a range of programs, including Literature, History, Philosophy, and Visual Arts.</p>
                        <a href="Documents/Humanities Prospectus.pdf" target="_blank">Download Brochure</a>
                    </div>
                    <div class="faculty-card" id="business">
                        <h2>Faculty of Economics, Management, and Business</h2>
                        <p>The Faculty of Business provides courses in Business Administration, Economics, Marketing, and Finance, being a core component of the Business School of Howark University.</p>
                        <a href="Documents/Brochure2.pdf" target="_blank">Download Brochure</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Howark University. All Rights Reserved.</p>
        </div>
    </form>
</body>
</html>