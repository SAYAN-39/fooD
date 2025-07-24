<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String str = (String) session.getAttribute("udata"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
    <style>
        body {
            background-color: #0f172a;
            padding-top: 56px;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        
        .navbar {
            background-color: rgba(15, 23, 42, 0.95) !important;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid #1e293b;
            padding: 0.5rem 1rem;
        }
        
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        
        .navbar-brand img {
            border-radius: 4px;
        }
        
        /* Consistent nav link styling */
        .nav-link {
            color: #94a3b8 !important;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0 0.25rem;
            padding: 0.5rem 0.75rem !important;
            border-radius: 0.5rem;
            position: relative;
        }
        
        .nav-link:hover {
            color: #e2e8f0 !important;
            background-color: rgba(51, 65, 85, 0.5);
        }
        
        /* Remove the underline effect for consistency */
        .nav-link::after {
            display: none;
        }
        
        /* Dropdown styling */
        .dropdown-menu {
            background-color: #1e293b;
            border: 1px solid #334155;
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.3);
            margin-top: 0.25rem;
        }
        
        .dropdown-item {
            color: #cbd5e1;
            transition: all 0.2s ease;
            padding: 0.5rem 1rem;
        }
        
        .dropdown-item:hover {
            background-color: #334155;
            color: #e2e8f0;
        }
        
        /* Search form styling */
        .search-form {
            display: flex;
            align-items: center;
            margin-right: 1rem;
        }
        
        .form-control {
            background-color: #1e293b !important;
            border: 1px solid #334155 !important;
            color: #e2e8f0 !important;
            border-radius: 0.5rem 0 0 0.5rem !important;
            height: 38px;
        }
        
        .form-control:focus {
            border-color: #22c55e !important;
            box-shadow: 0 0 0 0.2rem rgba(34, 197, 94, 0.25) !important;
            background-color: #1e293b !important;
            color: #e2e8f0 !important;
        }
        
        .form-control::placeholder {
            color: #64748b;
        }
        
        .search-btn {
            border: 1px solid #334155 !important;
            border-radius: 0 0.5rem 0.5rem 0 !important;
            background-color: #1e293b;
            color: #94a3b8;
            padding: 0.375rem 0.75rem;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border-left: none !important;
        }
        
        .search-btn:hover {
            background-color: #22c55e !important;
            border-color: #22c55e !important;
            color: #0f172a !important;
        }
        
        /* User info styling */
        .user-info {
            display: flex;
            align-items: center;
            color: #94a3b8;
            font-weight: 500;
            padding: 0.5rem 0.75rem;
            margin: 0 0.25rem;
        }
        
        /* Action button styling (Login, Signup, Logout) */
        .action-btn {
            background: linear-gradient(90deg, #22c55e, #16a34a) !important;
            color: #0f172a !important;
            border: none !important;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 0 0.25rem;
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(34, 197, 94, 0.3);
            color: #0f172a !important;
        }
        
        /* Responsive adjustments */
        @media (max-width: 991px) {
            .search-form {
                margin: 0.5rem 0;
            }
            
            .user-info {
                margin: 0.5rem 0;
            }
            
            .nav-link {
                margin: 0.25rem 0;
            }
        }
        
        /* Ensure consistent spacing */
        .navbar-nav .nav-item {
            display: flex;
            align-items: center;
        }
        
        .navbar-collapse {
            align-items: center;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">  
    <a class="navbar-brand" href="#">
        <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="50" alt="Logo">
    </a>  
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav mr-auto">  
            <li class="nav-item">  
                <a class="nav-link" href="/">Home</a>  
            </li> 
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/mens">Gents</a>
                    <a class="dropdown-item" href="/womens">Ladies</a>
                    <a class="dropdown-item" href="catview?type=kids">HandBags</a>
                </div>
            </li>
        </ul>
        
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">  
                <form class="search-form my-2 my-lg-0">
                    <input class="form-control" type="search" placeholder="Search..." aria-label="Search">
                    <button class="search-btn" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </form>
            </li>
            
            <%
            if (str != null) {
            %>
                <li class="nav-item">  
                    <span class="user-info">Hello: <%= str %></span>
                </li>
                <li class="nav-item">  
                    <a class="nav-link action-btn" href="logout">Logout</a>  
                </li>
            <%
            } else {
            %>
                <li class="nav-item">  
                    <a class="nav-link action-btn" href="reg">Sign Up</a>  
                </li>
                <li class="nav-item">  
                    <a class="nav-link action-btn" href="log">Login</a>  
                </li> 
            <%
            }
            %>
        </ul>
    </div>
</nav>  

<!-- Main content would go here -->
<div class="container-fluid" style="margin-top: 20px;">
    <!-- Your page content -->
</div>

</body>
</html>