<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInSystemPage.aspx.cs" Inherits="Prototype_University_IS_.LogInSystemPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Howark University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        /* Body Styles */
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            transition: background 0.3s ease;
        }

        body.dark-mode {
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: #ecf0f1;
        }

        /* Glassmorphism Container */
        .container {
            max-width: 450px;
            width: 100%;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            position: relative;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .dark-mode .container {
            background: rgba(0, 0, 0, 0.3);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.6);
        }

        /* Container Hover Effects */
        .container:hover {
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            transform: scale(1.03);
        }

        /* Header Styling */
        .header h1 {
            color: #1abc9c;
            font-size: 2.4em;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        .dark-mode .header h1 {
            color: #e74c3c;
        }

        /* Form Fields */
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            font-size: 1.1em;
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: #2c3e50;
        }

        .dark-mode .form-group label {
            color: #ecf0f1;
        }

        /* Input and Select Styling */
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            margin-top: 5px;
            background: rgba(255, 255, 255, 0.2);
            color: #2c3e50;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            outline: none;
        }

        .dark-mode .form-group input, .dark-mode .form-group select {
            background: rgba(0, 0, 0, 0.5);
            color: #ecf0f1;
            border: 1px solid #444;
        }

        /* Submit Button */
        .form-group input[type="submit"] {
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: 600;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color: #16a085;
            transform: scale(1.05);
        }

        /* Password Toggle Eye */
        .show-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #1abc9c;
            font-size: 1.2em;
            transition: color 0.3s ease;
        }

        .show-password:hover {
            color: #16a085;
        }

        .dark-mode .show-password {
            color: #ecf0f1;
        }

        /* Social Media Login Buttons */
        .social-login {
            margin: 15px 0;
            text-align: center;
        }

        .social-login i {
            font-size: 2em;
            margin: 0 15px;
            cursor: pointer;
            color: #2c3e50;
        }

        .social-login i:hover {
            color: #1abc9c;
        }

        .dark-mode .social-login i {
            color: #ecf0f1;
        }

        /* Loading Spinner */
        .spinner {
            display: inline-block;
            border: 3px solid rgba(0, 0, 0, 0.1);
            border-radius: 50%;
            border-top: 3px solid #1abc9c;
            width: 30px;
            height: 30px;
            animation: spin 1s linear infinite;
            display: none;
        }

        .dark-mode .spinner {
            border-top-color: #e74c3c;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Dark/Light Mode Toggle */
        .mode-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #1abc9c;
            color: white;
            border-radius: 50px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .mode-toggle:hover {
            background: #16a085;
        }

        .dark-mode .mode-toggle {
            background: #e74c3c;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #2c3e50;
            font-size: 0.9em;
        }

        .footer a {
            color: #1abc9c;
            text-decoration: none;
        }

        .footer a:hover {
            color: #16a085;
        }

        .dark-mode .footer a {
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <!-- Dark Mode Toggle Button -->
    <div class="mode-toggle" onclick="toggleMode()">Toggle Dark Mode</div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Login to Howark University</h1>
            </div>

            <!-- Username Input Field -->
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" aria-required="true" />
            </div>

            <!-- Password Input Field with Show/Hide Feature -->
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" aria-required="true" />
                <i id="togglePassword" class="fas fa-eye show-password" onclick="togglePasswordVisibility()" aria-label="Show or hide password"></i>
            </div>

            <!-- User Type Dropdown -->
            <div class="form-group">
                <label for="ddlUserType">I am a</label>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" aria-required="true">
                    <asp:ListItem Value="Student">Student</asp:ListItem>
                    <asp:ListItem Value="Lecturer">Lecturer</asp:ListItem>
                    <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                    <asp:ListItem Value="Alumni">Alumni</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
            </div>

            <!-- Social Media Login Options -->
            <div class="social-login">
                <i class="fab fa-google"></i>
                <i class="fab fa-facebook"></i>
                <i class="fab fa-twitter"></i>
            </div>

            <!-- Loading Spinner -->
            <div id="loadingSpinner" class="spinner"></div>

            <!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Howark University | 
        <asp:HyperLink ID="forgotPasswordLink" runat="server" NavigateUrl="~/ForgotPassword.aspx">
            Forgot Password?
        </asp:HyperLink>
    </p>
</div>
    </form>

    <script type="text/javascript">
        // Toggle Password Visibility
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("txtPassword");
            const passwordToggle = document.getElementById("togglePassword");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                passwordToggle.classList.remove("fa-eye");
                passwordToggle.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                passwordToggle.classList.remove("fa-eye-slash");
                passwordToggle.classList.add("fa-eye");
            }
        }

        // Dark Mode Toggle Function
        function toggleMode() {
            document.body.classList.toggle("dark-mode");

            // Save the user's preference to localStorage
            if (document.body.classList.contains("dark-mode")) {
                localStorage.setItem("theme", "dark");
            } else {
                localStorage.setItem("theme", "light");
            }
        }

        // Check localStorage for user's theme preference
        window.onload = function () {
            const savedTheme = localStorage.getItem("theme");
            if (savedTheme === "dark") {
                document.body.classList.add("dark-mode");
            }
        };
    </script>
</body>
</html>