<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            min-height: 100vh;
            background: #f8f9fa;
            overflow: hidden;
        }

        .container {
            min-height: 100vh;
            display: flex;
            position: relative;
        }

        /* Left side content */
        .left-content {
            flex: 1;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            background: linear-gradient(135deg, rgba(103, 58, 183, 0.05) 0%, rgba(103, 58, 183, 0.1) 100%);
            color: #2d3436;
        }

        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3');
            background-size: cover;
            background-position: center;
            opacity: 0.8;
            z-index: -1;
        }

        .project-info {
            max-width: 600px;
            margin-left: 6rem;
            position: relative;
            background: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 1.5rem;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(103, 58, 183, 0.15);
        }

        .vertical-line {
            position: absolute;
            left: -2rem;
            top: 0;
            bottom: 0;
            width: 4px;
            background: #673ab7;
            border-radius: 2px;
            box-shadow: 0 0 15px rgba(103, 58, 183, 0.3);
        }

        .project-info h2 {
            font-size: 2.5rem;
            color: #2d3436;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .project-info p {
            font-size: 1.1rem;
            color: #636e72;
            line-height: 1.7;
            margin-bottom: 1rem;
        }

        /* Right side - Login section */
        .right-content {
            width: 500px;
            background: white;
            padding: 4rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            box-shadow: 0 4px 20px rgba(103, 58, 183, 0.1);
            margin-right: 3rem;
            border-radius: 20px;
            margin: 2rem;
        }

        .header-section {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-container {
            display: inline-block;
            padding: 1rem;
            background: rgba(103, 58, 183, 0.1);
            border-radius: 50%;
            margin-bottom: 1rem;
        }

        .logo-container i {
            font-size: 2.5rem;
            color: #673ab7;
        }

        .header-section h1 {
            font-size: 1.875rem;
            font-weight: bold;
            color: #2d3436;
            margin-bottom: 0.5rem;
        }

        .header-section p {
            color: #636e72;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #2d3436;
            margin-bottom: 0.5rem;
        }

        .input-container {
            position: relative;
        }

        .input-container i {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #b2bec3;
        }

        .input-container input {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem;
            border: 1.5px solid #dfe6e9;
            border-radius: 0.75rem;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .input-container input:focus {
            outline: none;
            border-color: #673ab7;
            box-shadow: 0 0 0 3px rgba(103, 58, 183, 0.2);
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 1.5rem;
        }

        .forgot-password a {
            font-size: 0.875rem;
            color: #673ab7;
            text-decoration: none;
            transition: color 0.2s;
        }

        .forgot-password a:hover {
            color: #5e35b1;
            text-decoration: underline;
        }

        .login-button {
            width: 100%;
            padding: 0.875rem;
            background: linear-gradient(135deg, #673ab7 0%, #5e35b1 100%);
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-button:hover {
            background: linear-gradient(135deg, #5e35b1 0%, #512da8 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(103, 58, 183, 0.3);
        }

        .footer-text {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: #636e72;
        }

        .footer-text a {
            color: #673ab7;
            text-decoration: none;
            font-weight: 500;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 1024px) {
            .container {
                flex-direction: column;
            }
            
            .right-content {
                width: calc(100% - 4rem);
                margin: 2rem auto;
            }
            
            .left-content {
                padding: 4rem 2rem;
            }
            
            .project-info {
                margin: 0 auto;
                text-align: center;
            }
            
            .vertical-line {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left side content -->
        <div class="left-content">
            <div class="background-image"></div>
            <div class="project-info">
                <div class="vertical-line"></div>
                <h2>Welcome to Student Activities Management System</h2>
                <p>Discover and manage your extra-curricular journey with our comprehensive activity management system. Track your achievements, join exciting events, and build a well-rounded academic profile.</p>
            </div>
        </div>

        <!-- Right side - Login section -->
        <div class="right-content">
            <div class="header-section">
                <div class="logo-container">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <h1>Student Portal</h1>
                <p>Extra-Curricular Activity Management</p>
            </div>

            <h4 style="color: #e74c3c; text-align: center; margin-bottom: 1rem;">${msg}</h4>

            <form action="checkadminlogin" method="post">
                <div class="form-group">
                    <label for="auname">Username</label>
                    <div class="input-container">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" name="auname" placeholder="Enter your username" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-container">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="apwd" placeholder="Enter your password" required>
                    </div>
                </div>

                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>

                <button type="submit" class="login-button">Login</button>
            </form>

            <p class="footer-text">
                Need help? Contact <a href="#">support</a>
            </p>
        </div>
    </div>
</body>
</html>