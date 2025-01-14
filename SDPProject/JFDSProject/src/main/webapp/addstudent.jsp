<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
     
.form-container {
    max-width: 800px;
    margin: 2rem auto 2rem 35%; /* Increased left margin */
    padding: 2.5rem;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
    backdrop-filter: blur(4px);
    border: 1px solid rgba(255, 255, 255, 0.18);
    position: relative;
    z-index: 1;
}



        .page-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                linear-gradient(120deg, rgba(26, 54, 93, 0.05) 0%, rgba(44, 82, 130, 0.05) 100%),
                url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&q=80&w=2070') center/cover no-repeat;
            filter: blur(0px);
            z-index: -1;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-header h2 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(150deg, #1a365d, #2c5282);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-header p {
            color: #64748b;
            font-size: 1.1rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c5282;
            font-weight: 500;
            font-size: 1rem;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .form-input:focus {
            outline: none;
            border-color: #2c5282;
            box-shadow: 0 0 0 3px rgba(44, 82, 130, 0.1);
        }

        select.form-input {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%232c5282' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 1em;
            padding-right: 2.5rem;
        }

        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-reset {
            background: #fff;
            color: #2c5282;
            border: 1px solid #2c5282;
        }

        .btn-reset:hover {
            background: #f8fafc;
            transform: translateY(-2px);
        }

        .btn-submit {
            background: linear-gradient(150deg, #1a365d, #2c5282);
            color: white;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(44, 82, 130, 0.2);
        }

        .success-message {
            text-align: center;
            color: #059669;
            background: #ecfdf5;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 1rem;
                padding: 1.5rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .form-header h2 {
                font-size: 2rem;
            }

            .button-group {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
    <%@ include file="adminnavbar.jsp" %>
    
    <div class="page-background"></div>

    <div class="form-container">
        <div class="form-header">
            <h2>Student Registration</h2>
            <p>Enter student details to create a new account</p>
        </div>

        <c:if test="${not empty message}">
            <div class="success-message">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>

        <form method="post" action="insertstudent">
            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label" for="sid">
                        <i class="fas fa-id-card"></i> Student ID
                    </label>
                    <input type="number" id="sid" name="sid" class="form-input" required 
                           placeholder="Enter student ID">
                </div>

                <div class="form-group">
                    <label class="form-label" for="sgender">
                        <i class="fas fa-venus-mars"></i> Gender
                    </label>
                    <select name="sgender" id="sgender" class="form-input" required>
                        <option value="">Select Gender</option>
                        <option value="MALE">Male</option>
                        <option value="FEMALE">Female</option>
                        <option value="OTHERS">Others</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label" for="sfname">
                        <i class="fas fa-user"></i> First Name
                    </label>
                    <input type="text" id="sfname" name="sfname" class="form-input" required 
                           placeholder="Enter first name">
                </div>

                <div class="form-group">
                    <label class="form-label" for="slname">
                        <i class="fas fa-user"></i> Last Name
                    </label>
                    <input type="text" id="slname" name="slname" class="form-input" required 
                           placeholder="Enter last name">
                </div>

                <div class="form-group">
                    <label class="form-label" for="semail">
                        <i class="fas fa-envelope"></i> Email Address
                    </label>
                    <input type="email" id="semail" name="semail" class="form-input" required 
                           placeholder="Enter email address">
                </div>

                <div class="form-group">
                    <label class="form-label" for="scontact">
                        <i class="fas fa-phone"></i> Contact Number
                    </label>
                    <input type="text" id="scontact" name="scontact" class="form-input" required 
                           placeholder="Enter contact number">
                </div>

                <div class="form-group">
                    <label class="form-label" for="sdob">
                        <i class="fas fa-calendar"></i> Date of Birth
                    </label>
                    <input type="date" id="sdob" name="sdob" class="form-input" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="spwd">
                        <i class="fas fa-lock"></i> Password
                    </label>
                    <input type="password" id="spwd" name="spwd" class="form-input" required 
                           placeholder="Enter password">
                </div>
            </div>

            <div class="button-group">
                <button type="reset" class="btn btn-reset">
                    <i class="fas fa-undo"></i> Reset Form
                </button>
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-user-plus"></i> Register Student
                </button>
            </div>
        </form>
    </div>
</body>
</html>