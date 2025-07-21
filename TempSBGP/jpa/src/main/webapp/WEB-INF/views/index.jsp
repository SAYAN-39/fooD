<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp" />

<style>
/* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f7fafc;
            color: #333;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 1rem;
        }

        /* Header */
        header {
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.75rem;
            font-weight: bold;
            color: #2f855a;
        }

        nav a {
            margin-right: 1rem;
            font-weight: 500;
            transition: color 0.2s;
        }

        nav a:hover {
            color: #2f855a;
        }

        .btn-signin {
            padding: 0.5rem 1rem;
            background-color: #2f855a;
            color: #fff;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-signin:hover {
            background-color: #276749;
        }

        .header-flex {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 0;
        }

        /* Hero */
        .hero {
            background: linear-gradient(90deg, #38a169, #48bb78);
            color: #fff;
            text-align: center;
            padding: 3rem 1rem;
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .hero p {
            font-size: 1.125rem;
            margin-bottom: 1.5rem;
        }

        /* Menu */
        .section-title {
            font-size: 1.75rem;
            text-align: center;
            margin-bottom: 1rem;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .food-card {
            background: #fff;
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;
        }

        .food-img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .food-content {
            padding: 0.75rem;
        }

        .food-name {
            font-size: 1.125rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .food-price {
            font-size: 1rem;
            color: #2f855a;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 1.5rem 0;
            color: #666;
            font-size: 0.875rem;
        }
</style>

<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container header-flex">
            <div class="logo">FoodExpress</div>
            <nav>
                <a href="#menu">Menu</a>
                <a href="#contact">Contact</a>
            </nav>
            <button class="btn-signin">Sign In</button>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Delicious Food, Delivered Fast</h1>
            <p>Explore our menu and order your favorites in seconds.</p>
        </div>
    </section>

    <!-- Menu -->
    <section id="menu">
        <div class="container">
            <h2 class="section-title">Our Menu</h2>
            <div class="menu-grid">
                <div class="food-card" id="food">
                    <img src="images/pizza.jpg" alt="Margherita Pizza" class="food-img" />
                    <div class="food-content">
                        <div class="food-name">Margherita Pizza</div>
                        <div class="food-price">₹499</div>
                    </div>
                </div>
                <div class="food-card" id="food">
                    <img src="images/burger.jpg" alt="Cheeseburger" class="food-img" />
                    <div class="food-content">
                        <div class="food-name">Cheeseburger</div>
                        <div class="food-price">₹349</div>
                    </div>
                </div>
                <div class="food-card" id="food">
                    <img src="images/pasta.jpg" alt="Creamy Alfredo Pasta" class="food-img" />
                    <div class="food-content">
                        <div class="food-name">Creamy Alfredo Pasta</div>
                        <div class="food-price">₹399</div>
                    </div>
                </div>
                <div class="food-card" id="food">
                    <img src="images/cake.jpg" alt="Chocolate Cake" class="food-img" />
                    <div class="food-content">
                        <div class="food-name">Chocolate Cake</div>
                        <div class="food-price">₹299</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <p>&copy; Sagnick </p>
    </footer>
    
</body>
</html>