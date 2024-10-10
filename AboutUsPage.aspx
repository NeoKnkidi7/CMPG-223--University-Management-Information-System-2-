<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="Prototype_University_IS_.AboutUsPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Howark University</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style type="text/css">
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            scroll-behavior: smooth;
            transition: background-color 0.3s ease;
            overflow-x: hidden;
        }
        .dark-mode {
            background-color: #2c3e50;
            color: #ecf0f1;
        }
        .header, .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 40px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease;
        }
        .dark-mode .header, .dark-mode .footer {
            background-color: #34495e;
        }
        .header img {
            height: 120px;
            margin-bottom: 20px;
            transition: transform 0.3s ease, filter 0.3s ease;
        }
        .header img:hover {
            transform: scale(1.1);
            filter: brightness(1.2);
        }
        .header h1 {
            font-size: 3.5em;
            letter-spacing: 1px;
            margin: 0;
            animation: fadeIn 2s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .dark-mode-toggle {
            position: absolute;
            top: 10px;
            right: 20px;
            background-color: #1abc9c;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .dark-mode .dark-mode-toggle {
            background-color: #e74c3c;
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
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .nav-bar a:hover {
            background-color: #1abc9c;
            transform: scale(1.05);
        }
        .main-content {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .section {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            animation: fadeInUp 1s ease-out;
        }
        .section:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }
        .dark-mode .section {
            background-color: #34495e;
            color: white;
        }
        .ai-assistant {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 70px;
            height: 70px;
            background-color: #1abc9c;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .ai-assistant img {
            width: 100%;
            height: auto;
            border-radius: 50%;
        }
        .sustainability {
            background-color: #27ae60;
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 20px;
        }
        .sustainability img {
            width: 80px;
            margin: 10px;
            transition: transform 0.3s ease;
        }
        .sustainability img:hover {
            transform: scale(1.2);
        }
        .footer p {
            margin: 0;
            font-size: 0.9em;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-bar a {
                display: block;
                margin: 10px 0;
            }
            .header img {
                height: 100px;
            }
            .header h1 {
                font-size: 2.5em;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Dark Mode Toggle -->
        <button class="dark-mode-toggle" type="button" onclick="toggleDarkMode()">Switch Mode</button>

        <!-- Header Section -->
        <div class="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="135px" Width="256px" />
            <h1>About Howark University</h1>
        </div>

        <!-- Navigation Bar -->
        <div class="nav-bar">
            <a href="DefualtPage.aspx">Home</a>
            <a href="AboutUsPage.aspx">About Us</a>
            <a href="WhatToStudyPage.aspx">What to Study</a>
            <a href="FacultiesPage.aspx">Faculties</a>
            <a href="LogInSystemPage.aspx">Log In</a>
        </div>

        <!-- Main Content Section -->
        <div class="main-content">
            <!-- History Section -->
            <div class="section">
                <h2>Our History</h2>
                <p>Founded in 1985, Howark University has been a leader in providing high-quality education and fostering academic excellence. Our institution began as a small liberal arts college and has since grown into a prestigious university with a diverse range of programs and a global reputation for research and innovation.</p>
            </div>

            <!-- Mission and Values Section -->
            <div class="section">
                <h2>Mission and Values</h2>
                <p>Our mission is to provide an outstanding education that prepares students for successful careers and leadership roles in a rapidly changing world. We are committed to excellence in teaching, research, and community service. Our core values include integrity, diversity, and a commitment to lifelong learning.</p>
            </div>

            <!-- Leadership Section -->
            <div class="section">
                <h2>University Leadership</h2>
                <p>Our university is led by a team of distinguished academics and administrators dedicated to advancing our mission and achieving our goals. The leadership team includes:</p>
                <ul>
                    <li><strong>Dr. Jane Smith</strong> - President</li>
                    <li><strong>Dr. John Doe</strong> - Provost</li>
                    <li><strong>Dr. Emily Davis</strong> - Vice President for Research</li>
                    <li><strong>Dr. Michael Brown</strong> - Dean of Admissions</li>
                </ul>
            </div>

            <!-- Campus Facilities Section -->
            <div class="section">
                <h2>Campus Facilities</h2>
                <p>Our campus features state-of-the-art facilities that support academic and extracurricular activities. Highlights include:</p>
                <ul>
                    <li><strong>Modern Classrooms</strong> - Equipped with the latest technology for interactive learning.</li>
                    <li><strong>Research Labs</strong> - Advanced laboratories for scientific research and innovation.</li>
                    <li><strong>Library</strong> - A comprehensive library with extensive collections and study spaces.</li>
                    <li><strong>Sports Complex</strong> - Facilities for a wide range of sports and recreational activities.</li>
                </ul>
                <div class="image-gallery">
                    <img src="Properties/Paxful-1716x858.jpg" alt="Campus Image 1" />
                    <img src="Properties/campus-or-city-university-blog-post-featured-image.jpg" alt="Campus Image 2" />
                </div>
            </div>

            <!-- Notable Achievements Section -->
            <div class="section">
                <h2>Notable Achievements</h2>
                <ul>
                    <li>Ranked among the top 5 universities in South Africa for research output.</li>
                    <li>Over 20,000 alumni holding leadership roles in various sectors worldwide.</li>
                    <li>World-class partnerships with leading universities and research institutions globally.</li>
                </ul>
            </div>

            <!-- Sustainability Section -->
            <div class="sustainability">
                <h2>Our Sustainability Initiatives</h2>
                <p>At Howark University, we are committed to environmental sustainability. We aim to reduce our carbon footprint, implement green energy solutions, and promote sustainability education among our students and staff.</p>
                <img src="Properties/sustainability-icon-1.png" alt="Sustainability Icon 1" />
                <img src="Properties/sustainability-icon-2.png" alt="Sustainability Icon 2" />
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>© 2024 Howark University. All Rights Reserved.</p>
        </div>

        <!-- AI Assistant (ChatGPT) -->
        <div class="ai-assistant" title="AI Assistant">
            <img src="Properties/assistant-icon.png" alt="AI Assistant Icon" />
        </div>
    </form>

    <script type="text/javascript">
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
        }
    </script>
</body>
</html>