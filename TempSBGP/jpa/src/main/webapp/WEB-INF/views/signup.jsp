<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
        height: 100vh;
        font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        position: relative;
    }

    /* Animated background elements */
    body::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(34, 197, 94, 0.1) 0%, transparent 70%);
        animation: rotate 20s linear infinite;
        z-index: 0;
    }

    @keyframes rotate {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

    .floating-shapes {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 1;
    }

    .shape {
        position: absolute;
        border-radius: 50%;
        background: rgba(34, 197, 94, 0.05);
        animation: float 15s infinite linear;
    }

    .shape:nth-child(1) {
        width: 120px;
        height: 120px;
        top: 15%;
        left: 8%;
        animation-duration: 22s;
    }

    .shape:nth-child(2) {
        width: 100px;
        height: 100px;
        top: 65%;
        left: 85%;
        animation-duration: 28s;
        animation-direction: reverse;
    }

    .shape:nth-child(3) {
        width: 70px;
        height: 70px;
        top: 35%;
        left: 85%;
        animation-duration: 20s;
    }

    .shape:nth-child(4) {
        width: 90px;
        height: 90px;
        top: 80%;
        left: 15%;
        animation-duration: 25s;
    }

    @keyframes float {
        0% { transform: translate(0, 0) rotate(0deg); }
        25% { transform: translate(25px, 25px) rotate(90deg); }
        50% { transform: translate(0, 50px) rotate(180deg); }
        75% { transform: translate(-25px, 25px) rotate(270deg); }
        100% { transform: translate(0, 0) rotate(360deg); }
    }

    .signup-container {
        position: relative;
        z-index: 10;
        width: 100%;
        max-width: 500px;
        margin: 20px;
    }

    .card {
        background: rgba(30, 41, 59, 0.8);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 40px 35px;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        border: 1px solid #334155;
        transform: translateY(20px);
        opacity: 0;
        animation: slideUp 0.8s forwards 0.3s;
    }

    @keyframes slideUp {
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .card-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .card-title {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 10px;
        background: linear-gradient(90deg, #22c55e, #86efac);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .card-subtitle {
        color: #94a3b8;
        font-size: 1rem;
    }

    .form-group {
        margin-bottom: 25px;
        position: relative;
    }

    .form-label {
        color: #cbd5e1;
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
    }

    .input-group {
        position: relative;
    }

    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #64748b;
    }

    .form-control {
        background: rgba(15, 23, 42, 0.5);
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 15px 15px 15px 45px;
        color: #f1f5f9;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #22c55e;
        box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.2);
        background: rgba(15, 23, 42, 0.7);
    }

    .form-control::placeholder {
        color: #64748b;
    }

    .btn-signup {
        background: linear-gradient(90deg, #22c55e, #16a34a);
        border: none;
        border-radius: 12px;
        padding: 15px;
        font-size: 1.1rem;
        font-weight: 600;
        color: #0f172a;
        width: 100%;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 10px 15px -3px rgba(34, 197, 94, 0.3);
        position: relative;
        overflow: hidden;
    }

    .btn-signup:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 20px -3px rgba(34, 197, 94, 0.4);
    }

    .btn-signup:active {
        transform: translateY(-1px);
    }

    .btn-signup::after {
        content: '';
        position: absolute;
        top: -50%;
        left: -60%;
        width: 20px;
        height: 200%;
        background: rgba(255, 255, 255, 0.3);
        transform: rotate(30deg);
        transition: all 0.6s;
    }

    .btn-signup:hover::after {
        left: 120%;
    }

    .login-link {
        text-align: center;
        margin-top: 25px;
        color: #94a3b8;
    }

    .login-link a {
        color: #22c55e;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.3s ease;
        position: relative;
    }

    .login-link a::after {
        content: '';
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 0;
        height: 1px;
        background: #22c55e;
        transition: width 0.3s ease;
    }

    .login-link a:hover::after {
        width: 100%;
    }

    .message {
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 20px;
        text-align: center;
        animation: fadeIn 0.5s ease;
    }

    .message.success {
        background: rgba(34, 197, 94, 0.1);
        border: 1px solid rgba(34, 197, 94, 0.3);
        color: #86efac;
    }

    .message.error {
        background: rgba(239, 68, 68, 0.1);
        border: 1px solid rgba(239, 68, 68, 0.3);
        color: #fecaca;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 576px) {
        .card {
            padding: 30px 20px;
        }
        
        .card-title {
            font-size: 1.7rem;
        }
    }
</style>
</head>
<body>
    <!-- Animated background shapes -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="signup-container">
        <div class="card">
            <div class="card-header">
                <h1 class="card-title">Create Account</h1>
                <p class="card-subtitle">Join us and start your journey today</p>
            </div>
            
            <form action="regproc" method="post">
                <div class="form-group">
                    <label for="name" class="form-label">Full Name</label>
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-user"></i>
                        </span>
                        <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-envelope"></i>
                        </span>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phone" class="form-label">Phone Number</label>
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-phone"></i>
                        </span>
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter your phone number" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Create a password" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-signup">
                        <i class="fas fa-user-plus"></i> Sign Up
                    </button>
                </div>
                
                <div class="login-link">
                    <small>Already have an account? <a href="log">Login here</a></small>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const formGroups = document.querySelectorAll('.form-group');
            formGroups.forEach((group, index) => {
                group.style.opacity = '0';
                group.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    group.style.transition = 'all 0.5s ease';
                    group.style.opacity = '1';
                    group.style.transform = 'translateY(0)';
                }, 400 + (index * 100));
            });
        });
    </script>
</body>
</html>