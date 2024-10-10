<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefualtPage.aspx.cs" Inherits="Prototype_University_IS_.DefualtPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Howark University</title>

    <!-- Font Awesome for Icons -->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <!-- Google Fonts -->

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@600&display=swap" rel="stylesheet">

    <style type="text/css">

        /* Reset and Base Styles */

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

        }

        body {

            font-family: 'Roboto', Arial, sans-serif;

            background-color: #f0f2f5;

            overflow-x: hidden;

            scroll-behavior: smooth;

        }

        a {

            text-decoration: none;

            color: inherit;

        }


        /* Header Section */

        .header {

            background: linear-gradient(135deg, #2c3e50, #34495e);

            color: white;

            text-align: center;

            padding: 40px 20px;

            position: relative;

            overflow: hidden;

        }

        .header::before {

            content: '';

            position: absolute;

            top: -50%;

            left: -50%;

            width: 200%;

            height: 200%;

            background: rgba(255, 255, 255, 0.1);

            transform: rotate(45deg);

            animation: rotateBackground 10s linear infinite;

        }

        .header img {

            height: 150px;

            margin-bottom: 20px;

            transition: transform 0.3s ease;

        }

        .header img:hover {

            transform: scale(1.1) rotate(5deg);

        }

        .header h1 {

            font-size: 3.5em;

            margin-bottom: 10px;

            font-family: 'Montserrat', sans-serif;

            animation: fadeInDown 1s ease-out;

        }

        .header p {

            font-size: 1.2em;

            animation: fadeInUp 1s ease-out;

        }


        /* Navigation Bar */

        .nav-bar {

            background-color: #34495e;

            color: white;

            padding: 15px 0;

            text-align: center;

            position: sticky;

            top: 0;

            z-index: 1000;

            box-shadow: 0 2px 5px rgba(0,0,0,0.1);

        }

        .nav-bar a {

            color: white;

            text-decoration: none;

            padding: 12px 25px;

            display: inline-block;

            font-size: 1.1em;

            transition: background-color 0.3s ease, transform 0.3s ease;

            border-radius: 30px;

            margin: 0 10px;

            position: relative;

        }

        .nav-bar a:hover {

            background-color: #1abc9c;

            transform: scale(1.05);

            box-shadow: 0 4px 15px rgba(26, 188, 156, 0.4);

        }

        .nav-bar a::after {

            content: attr(title);

            position: absolute;

            bottom: -35px;

            left: 50%;

            transform: translateX(-50%);

            background-color: #333;

            color: white;

            padding: 5px 10px;

            border-radius: 3px;

            font-size: 0.8em;

            white-space: nowrap;

            opacity: 0;

            transition: opacity 0.3s ease;

            pointer-events: none;

            z-index: 1;

        }

        .nav-bar a:hover::after {

            opacity: 1;

        }


        /* Hero and Graduation Carousel Sections */

        .carousel-container {

            max-width: 1000px;

            margin: 0 auto;

            position: relative;

            overflow: hidden;

            border-radius: 15px;

        }

        .carousel {

            display: flex;

            transition: transform 0.5s ease-in-out;

            width: 100%; /* Single image width */

        }

        .carousel img {

            width: 100%;

            flex-shrink: 0;

            border-radius: 15px;

        }

        .carousel-buttons {

            position: absolute;

            top: 50%;

            width: 100%;

            display: flex;

            justify-content: space-between;

            transform: translateY(-50%);

        }

        .carousel-buttons button {

            background: rgba(0,0,0,0.5);

            border: none;

            color: white;

            padding: 10px;

            border-radius: 50%;

            cursor: pointer;

            transition: background 0.3s ease;

            outline: none;

        }

        .carousel-buttons button:hover {

            background: rgba(26, 188, 156, 0.8);

        }

        .carousel-buttons i {

            pointer-events: none;

        }


        /* Hero Section */

        .hero {

            position: relative;

            color: white;

            text-align: center;

            padding: 60px 20px;

            background-color: #2c3e50;

        }

        .hero h2 {

            font-size: 2.5em;

            margin: 20px 0;

            font-family: 'Montserrat', sans-serif;

            animation: fadeInUp 1.5s ease-out;

        }

        .hero p {

            font-size: 1.2em;

            margin-bottom: 30px;

            animation: fadeInUp 2s ease-out;

        }

        .hero .btn {

            display: inline-block;

            background-color: #1abc9c;

            color: white;

            padding: 15px 30px;

            border-radius: 50px;

            text-decoration: none;

            font-weight: bold;

            transition: background-color 0.3s ease, transform 0.3s ease;

            position: relative;

            animation: fadeInUp 2.5s ease-out;

        }

        .hero .btn:hover {

            background-color: #16a085;

            transform: scale(1.05);

            box-shadow: 0 4px 15px rgba(22, 160, 133, 0.4);

        }

        .hero .btn::after {

            content: attr(title);

            position: absolute;

            bottom: -35px;

            left: 50%;

            transform: translateX(-50%);

            background-color: #333;

            color: white;

            padding: 5px 10px;

            border-radius: 3px;

            font-size: 0.8em;

            white-space: nowrap;

            opacity: 0;

            transition: opacity 0.3s ease;

            pointer-events: none;

            z-index: 1;

        }

        .hero .btn:hover::after {

            opacity: 1;

        }


        /* Main Content Section */

        .main-content {

            display: flex;

            flex-wrap: wrap;

            padding: 40px 20px;

            max-width: 1200px;

            margin: auto;

        }

        /* Sidebar */

        .sidebar {

            flex: 1 1 250px;

            padding: 20px;

            position: -webkit-sticky;

            position: sticky;

            top: 20px;

            background-color: #ffffff;

            border-radius: 15px;

            box-shadow: 0  4px 15px rgba(0, 0, 0, 0.1);

            margin-right: 20px;

            transition: transform 0.3s ease;

        }

        .sidebar:hover {

            transform: translateY(-10px);

            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);

        }

        .sidebar h3 {

            margin-bottom: 20px;

            color: #2c3e50;

            font-family: 'Montserrat', sans-serif;

        }

        .sidebar ul {

            list-style: none;

        }

        .sidebar ul li {

            margin: 15px 0;

        }

        .sidebar ul li a {

            color: #1abc9c;

            text-decoration: none;

            font-weight: bold;

            transition: color 0.3s ease;

            position: relative;

            padding-left: 25px;

            display: flex;

            align-items: center;

        }

        .sidebar ul li a::before {

            content: "\f0c1"; /* Font Awesome Icon */

            font-family: 'Font Awesome 6 Free';

            font-weight: 900;

            position: absolute;

            left: 0;

            top: 50%;

            transform: translateY(-50%);

            color: #1abc9c;

            transition: color 0.3s ease;

            margin-right: 10px;

        }

        .sidebar ul li a:hover {

            color: #16a085;

        }

        .sidebar ul li a:hover::before {

            color: #16a085;

        }

        .sidebar ul li a::after {

            content: attr(title);

            position: absolute;

            right: -140px;

            top: 50%;

            transform: translateY(-50%);

            background-color: #333;

            color: white;

            padding: 5px 10px;

            border-radius: 3px;

            font-size: 0.8em;

            white-space: nowrap;

            opacity: 0;

            transition: opacity 0.3s ease;

            pointer-events: none;

            z-index: 1;

        }

        .sidebar ul li a:hover::after {

            opacity: 1;

        }


        /* Main Content Blocks */

        .main-content-content {

            flex: 3 1 0;

        }

        .announcements, .contact-info, .graduation-section {

            background-color: #ffffff;

            border: 1px solid #ddd;

            border-radius: 15px;

            padding: 30px;

            margin-bottom: 30px;

            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);

            transition: box-shadow 0.3s ease, transform 0.3s ease;

        }

        .announcements:hover, .contact-info:hover, .graduation-section:hover {

            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);

            transform: translateY(-5px);

        }

        .announcements h2, .contact-info h2, .graduation-section h2 {

            margin-bottom: 20px;

            color: #2c3e50;

            font-family: 'Montserrat', sans-serif;

        }

        .announcements p, .contact-info p {

            font-size: 1.1em;

            line-height: 1.6;

        }

        .announcements i, .contact-info i {

            color: #1abc9c;

            margin-right: 10px;

        }


        /* Graduation Section */

        .graduation-section {

            position: relative;

        }

        /* Graduation Carousel uses the same classes as Hero Carousel */

        .graduation-section .carousel-container {

            max-width: 1000px;

            margin: 20px auto;

        }

        .graduation-section p {

            margin-top: 20px;

            font-size: 1.1em;

            line-height: 1.6;

            text-align: center;

        }


        /* Hackathon Section */

        .hackathon-section {

            position: relative;

            background-color: #3498db;

            color: white;

            padding: 60px 20px;

            text-align: center;

        }

        .hackathon-section h2 {

            font-size: 2.5em;

            margin: 20px 0;

            font-family: 'Montserrat', sans-serif;

            animation: fadeInUp 1.5s ease-out;

        }

        .hackathon-section p {

            font-size: 1.2em;

            margin-bottom: 30px;

            animation: fadeInUp 2s ease-out;

        }

        .hackathon-section .carousel -container {

            max-width: 1000px;

            margin: 20px auto;

        }

        .hackathon-section .carousel {

            display: flex;

            transition: transform 0.5s ease-in-out;

            width: 100%; /* Single image width */

        }

        .hackathon-section .carousel img {

            width: 100%;

            flex-shrink: 0;

            border-radius: 15px;

        }

        .hackathon-section .carousel-buttons {

            position: absolute;

            top: 50%;

            width: 100%;

            display: flex;

            justify-content: space-between;

            transform: translateY(-50%);

        }

        .hackathon-section .carousel-buttons button {

            background: rgba(0,0,0,0.5);

            border: none;

            color: white;

            padding: 10px;

            border-radius: 50%;

            cursor: pointer;

            transition: background 0.3s ease;

            outline: none;

        }

        .hackathon-section .carousel-buttons button:hover {

            background: rgba(26, 188, 156, 0.8);

        }


        /* Science Fair Section */

        .science-fair-section {

            position: relative;

            background-color: #f1c40f;

            color: white;

            padding: 60px 20px;

            text-align: center;

        }

        .science-fair-section h2 {

            font-size: 2.5em;

            margin: 20px 0;

            font-family: 'Montserrat', sans-serif;

            animation: fadeInUp 1.5s ease-out;

        }

        .science-fair-section p {

            font-size: 1.2em;

            margin-bottom: 30px;

            animation: fadeInUp 2s ease-out;

        }

        .science-fair-section .carousel-container {

            max-width: 1000px;

            margin: 20px auto;

        }

        .science-fair-section .carousel {

            display: flex;

            transition: transform 0.5s ease-in-out;

            width: 100%; /* Single image width */

        }

        .science-fair-section .carousel img {

            width: 100%;

            flex-shrink: 0;

            border-radius: 15px;

        }

        .science-fair-section .carousel-buttons {

            position: absolute;

            top: 50%;

            width: 100%;

            display: flex;

            justify-content: space-between;

            transform: translateY(-50%);

        }

        .science-fair-section .carousel-buttons button {

            background: rgba(0,0,0,0.5);

            border: none;

            color: white;

            padding: 10px;

            border-radius: 50%;

            cursor: pointer;

            transition: background 0.3s ease;

            outline: none;

        }

        .science-fair-section .carousel-buttons button:hover {

            background: rgba(26, 188, 156, 0.8);

        }


        /* Footer Section */

        .footer {

            background-color: #2c3e50;

            color: white;

            text-align: center;

            padding: 20px 0;

            position: relative;

            z-index: 100;

        }

        .footer p {

            margin: 0;

            font-size: 1em;

        }


        /* Responsive Design */

        @media (max-width: 768px) {

            .main-content {

                flex-direction: column;

            }

            .sidebar {

                margin-right: 0;

                margin-bottom: 20px;

            }

            .nav-bar a {

                padding: 10px 15px;

                margin: 5px;

                font-size: 1em;

            }

            .header h1 {

                font-size: 2.5em;

            }

            .header img {

                height: 100px;

            }

            .hero h2 {

                font-size: 2em;

            }

            .hero p {

                font-size: 1em;

            }

            .announcements, .contact-info, .graduation-section {

                padding: 20px;

            }

        }


        /* Animations */

        @keyframes rotateBackground {

            from { transform: rotate(0deg); }

            to { transform: rotate(360deg); }

        }

        @keyframes fadeInDown {

            from { opacity: 0; transform: translateY(-20px); }

            to { opacity: 1; transform: translateY(0); }

        }

        @keyframes fadeInUp {

            from { opacity: 0; transform: translateY(20px); }

            to { opacity: 1; transform: translateY(0); }

        }

    </style>

</head>

<body>

    <form id="form1" run at="server">

        <!-- Header Section -->

        <div class="header">

            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Navy White University Elegant Logo.png" Height="150px" Width="256px" />

            <h1>Welcome to Howark University</h1>

            <p>Harnessing Hope’s Horizons</p>

        </div>


        <!-- Navigation Bar -->

        <div class="nav-bar">

            <a href="DefaultPage.aspx" title="Go to Home"><i class="fas fa-home"></i> Home</a>

            <a href="AboutUsPage.aspx" title="Learn About Us"><i class="fas fa-info-circle"></i> About Us</a>

            <a href="WhatToStudyPage.aspx" title="Explore What to Study"><i class="fas fa-book-open"></i> What to Study</a>

            <a href="FacultiesPage.aspx" title="Discover Our Faculties"><i class="fas fa-university"></i> Faculties</a>

            <a href="LogInSystemPage.aspx" title="Log In"><i class="fas fa-sign-in-alt"></i> Log In</a>

        </div>


        <!-- Hero Section with Single Image Carousel -->

        <div class="hero">

            <div class="carousel-container">

                <div class="carousel" id="slides">

                    <img src='<%= ResolveUrl("~/Properties/Campuslife.jpg") %>' alt="Campus Life">

                    <img src='<%= ResolveUrl("~/Properties/Modern Facilities.jpg") %>' alt="Modern Facilities">

                    <img src='<%= ResolveUrl("~/Properties/Diverse Community.jpg") %>' alt="Diverse Community">

                </div>

                <div class="carousel-buttons">

                    <button type="button" id="prevBtn" aria-label="Previous Slide"><i class="fas fa-chevron-left"></i></button>

                    <button type="button" id="nextBtn" aria-label="Next Slide"><i class="fas fa-chevron-right"></i></button>

                </div>

            </div>

            <h2>Discover Howark University</h2>

            <p>Explore our programs and opportunities to shape your future.</p>

            <a href="#contact" class="btn" title="Contact Us">Contact Us</a>

        </div>


        <!-- Main Content Section -->

        <div class="main-content">

            <!-- Sidebar -->

            <div class="sidebar">

                <h3>Quick Links</h3>

                <ul>

                    <li><a href="#contact" title="Get in Touch with Us"><i class="fas fa-envelope"></i> Contact Us</a></li>

                    <li><a href="#announcements" title="Read Latest Announcements"><i class="fas fa-bullhorn"></i> Announcements</a></li>

                    <li><a href="LogInSystemPage.aspx" title="Access Your Account"><i class="fas fa-user-circle"></i> Log In</a></li>

                </ul>

            </div>

            

            <!-- Main Content -->

            <div class="main-content-content">

                <!-- Announcements Section -->

                <div id="announcements" class="announcements">

                    <h2>Latest Announcements</h2>

                    <p><i class="fas fa-calendar-alt"></i> Spring Semester registration opens on March 1st.</p>

                    <p><i class="fas fa-graduation-cap"></i> Graduation ceremony scheduled for June 15th.</p>

                    <p><i class="fas fa-newspaper"></i> New research center inaugurated in the Faculty of Engineering.</p>

                    <!-- Dynamic content can be loaded here using server-side code or JavaScript -->

                </div>


                <!-- Graduation Section -->

                <div class="graduation-section">

                    <h2>Graduation Highlights</h2>

                    <div class="carousel-container">

                        <div class="carousel" id="graduationSlides">

                            <img src='<%= ResolveUrl("~/Properties/GraduationPicture1.jpg") %>' alt="Graduation Ceremony">

                            <img src='<%= ResolveUrl("~/Properties/HappyGrads_LR2.jpg") %>' alt="Happy Graduates">

                            <img src='<%= ResolveUrl("~/Properties/201609_SBSGraduation2.jpg") %>' alt="Graduation Day">

                        </div>

                        <div class="carousel-buttons">

                            <button type="button" id="gradPrevBtn" aria-label="Previous Graduation Slide"><i class="fas fa-chevron-left"></i></button>

                            <button type="button" id="gradNextBtn" aria-label="Next Graduation Slide"><i class="fas fa-chevron-right"></i></button>

                        </div>

                    </div>

                    <p>Join us in celebrating the achievements of our graduates. Enjoy the highlights from our recent ceremonies.</p>

                </div>


                <!-- Hackathon Section -->

                <div class="hackathon-section">

                    <h2>Hackathon Highlights</h2>

                    <div class="carousel-container">

                        <div class="carousel" id="hackathonSlides">

                            <img src='<%= ResolveUrl("~/Properties/programming-hackathon-1.jpg") %>' alt="Hackathon Event">

                            <img src='<%= ResolveUrl("~/Properties/Grayscale Circuit Board Twitter Post.png") %>' alt="Hackathon Team">

                            <img src='<%= ResolveUrl("~/Properties/hackhathon2.jpg") %>' alt="Hackathon Winner">

                        </div>

                        <div class="carousel-buttons">

                            <button type="button" id="hackathonPrevBtn" aria-label="Previous Hackathon Slide"><i class="fas fa-chevron-left"></i></button>

                            <button type="button" id="hackathonNextBtn" aria-label="Next Hackathon Slide"><i class="fas fa-chevron-right"></i></button>

                        </div>

                    </div>

                    <p>Join us for our annual hackathon, where students and professionals come together to innovate and create.</p>

                </div>


                <!-- Science Fair Section -->

                <div class="science-fair-section">

                    <h2>Science Fair Highlights</h2>

                    <div class="carousel-container">

                        <div class="carousel" id="scienceFairSlides">

                            <img src='<%= ResolveUrl("~/Properties/sciencefair.jpg") %>' alt="Science Fair Event">

                            <img src='<%= ResolveUrl("~/Properties/Black Illustration Science Fair Research Poster(1).png") %>' alt="Science Fair Project">

                            <img src='<%= ResolveUrl("~/Properties/scienceFairAWards.jpg") %>' alt="Science Fair Winner">

                        </div>

                        <div class="carousel-buttons">

                            <button type="button" id="scienceFairPrevBtn" aria-label="Previous Science Fair Slide"><i class="fas fa-chevron-left"></i></button>

                            <button type="button" id="scienceFairNextBtn" aria-label="Next Science Fair Slide"><i class="fas fa-chevron-right"></i></button>

                        </div>

                    </div>

                    <p>Explore the latest scientific discoveries and innovations at our annual science fair.</p>

                </div>


                <!-- Contact Info Section -->

                <div id="contact" class="contact-info">

                    <h2>Contact Us</h2>

                    <p><i class="fas fa-map-marker-alt"></i> 123 University Ave, City, Country</p>

                    <p><i class="fas fa-envelope"></i> Email: <a href="mailto:info@howark.edu" title="Email Us">info@howark.edu</a></p>

                    <p><i class="fas fa-phone"></i> Phone: (123) 456-7890</p>

                    <p><i class="fas fa-clock"></i> Office Hours: Mon-Fri, 9 AM - 5 PM</p>

                </div>

            </div>

        </div>




        <!-- Footer Section -->

        <div class="footer">
            <h2>Stay Connected</h2>

    <p>Follow us on social media to stay up-to-date with the latest news and updates from Howark University.</p>

    <div class="social-media-icons">

        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>

        <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>

        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>

        <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>

        <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>

    </div>


            <p>&copy; 2024 Howark University. All Rights Reserved.</p>

        </div>


        <!-- JavaScript for Carousels -->

        <script>

            // Function to initialize a carousel

            function initializeCarousel(slidesId, prevBtnId, nextBtnId, intervalTime) {

                const slides = document.getElementById(slidesId);

                const prevBtn = document.getElementById(prevBtnId);

                const nextBtn = document.getElementById(nextBtnId);

                const totalSlides = slides.children.length;

                let currentIndex = 0;


                function updateSlidePosition() {

                    slides.style.transform = 'translateX(' + (-currentIndex * 100) + '%)';

                }


                prevBtn.addEventListener('click', () => {

                    currentIndex = (currentIndex === 0) ? totalSlides - 1 : currentIndex - 1;

                    updateSlidePosition();

                });


                nextBtn.addEventListener('click', () => {

                    currentIndex = (currentIndex === totalSlides - 1) ? 0 : currentIndex + 1;

                    updateSlidePosition();

                });


                // Auto-slide functionality

                setInterval(() => {

                    currentIndex = (currentIndex === totalSlides - 1) ? 0 : currentIndex + 1;

                    updateSlidePosition();

                }, intervalTime); // Change slide based on intervalTime

            }


            // Initialize Hero Carousel

            initializeCarousel('slides', 'prevBtn', 'nextBtn', 5000); // 5 seconds


            // Initialize Graduation Carousel

            initializeCarousel('graduationSlides', 'gradPrevBtn', 'gradNextBtn', 7000); // 7 seconds


            // Initialize Hackathon Carousel

            initializeCarousel('hackathonSlides', 'hackathonPrevBtn', 'hackathonNextBtn', 6000); // 6 seconds


            // Initialize Science Fair Carousel

            initializeCarousel('scienceFairSlides', 'scienceFairPrevBtn', 'scienceFairNextBtn', 8000); // 8 seconds

        </script>

    </form>

</body>

</html>