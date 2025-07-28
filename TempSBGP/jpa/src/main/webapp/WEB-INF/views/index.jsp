<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.Product" %>
<%
    String data = (String) session.getAttribute("udata");
    if (data == null) {
        response.sendRedirect("/reg");  
        return; 
     }
%>
<jsp:include page="navbar.jsp" />
<style>
/* Base Reset & Typography */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
    background-color: #0f172a;
    color: #e2e8f0;
    line-height: 1.6;
}

a {
    text-decoration: none;
    color: inherit;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
}


/* Hero Section */
.hero {
    position: relative;
    overflow: hidden;
    padding: 0;
    min-height: 500px;
    display: flex;
    align-items: center;
}

.hero-image-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
}

.hero-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.7;
}

.hero-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, rgba(15, 23, 42, 0.9) 0%, rgba(15, 23, 42, 0.6) 50%, rgba(15, 23, 42, 0.9) 100%);
}

.hero-content {
    position: relative;
    z-index: 1;
    max-width: 650px;
    padding: 4rem 0;
}

.hero h1 {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 1.5rem;
    background: linear-gradient(90deg, #f1f5f9, #cbd5e1);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    line-height: 1.2;
}

.hero p {
    font-size: 1.25rem;
    color: #cbd5e1;
    margin-bottom: 2rem;
    max-width: 600px;
}

.hero-btn {
    display: inline-block;
    padding: 0.8rem 2rem;
    background: linear-gradient(90deg, #22c55e, #16a34a);
    color: #0f172a;
    font-weight: 600;
    border-radius: 0.5rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
}

.hero-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
}

/* Menu Section */
#menu {
    padding: 4rem 0;
}

.section-title {
    font-size: 2.25rem;
    text-align: center;
    margin-bottom: 3rem;
    position: relative;
    display: inline-block;
    left: 50%;
    transform: translateX(-50%);
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #22c55e, #16a34a);
    border-radius: 2px;
}

.menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 2rem;
}

.food-card {
    background: #1e293b;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease;
    border: 1px solid #334155;
    position: relative;
}

.food-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.4);
    border-color: #22c55e;
}

.food-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-bottom: 1px solid #334155;
}

.food-content {
    padding: 1.5rem;
}

.food-name {
    font-size: 1.25rem;
    font-weight: 600;
    margin-bottom: 0.75rem;
    color: #f1f5f9;
}

.food-price {
    font-size: 1.25rem;
    font-weight: 700;
    color: #22c55e;
}

/* Footer */
footer {
    background-color: #0f172a;
    border-top: 1px solid #1e293b;
    text-align: center;
    padding: 2rem 0;
    color: #64748b;
    font-size: 0.875rem;
}

/* Responsive */
@media (max-width: 768px) {
    .hero h1 {
        font-size: 2.25rem;
    }
    
    .hero p {
        font-size: 1rem;
    }
    
    .header-flex {
        flex-direction: column;
        gap: 1rem;
    }
    
    nav {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .hero-content {
        padding: 2rem 0;
        text-align: center;
        margin: 0 auto;
    }
    
    .hero-content p {
        margin-left: auto;
        margin-right: auto;
    }
}
</style>

<html>
<head>
    <title>Welcome Page</title>
</head>
<body>

    <!-- Hero Section with Image -->
    <section class="hero">
        <div class="hero-image-container">
            <img src="${pageContext.request.contextPath}/images/heroimage.jpg" alt="Delicious Food" class="hero-image">
            <div class="hero-overlay"></div>
        </div>
        <div class="container">
            <div class="hero-content">
                <h1>Delicious Food, Delivered Fast</h1>
                <p>Explore our curated menu and order your favorites in seconds. Fresh ingredients, crafted with passion.</p>
                <a href="#menu" class="hero-btn">Order Now</a>
            </div>
        </div>
    </section>

    <!-- Menu -->
    <section id="menu">
        <div class="container">
            <h2 class="section-title">Our Menu</h2>
            <div class="menu-grid">
                <%
                   List<Product> product = (List<Product>) request.getAttribute("data");
                   if (product != null && !product.isEmpty()) {
                    for (Product prod : product) {
                  %>
                  <a href="/desc/<%= prod.getId() %>" style="text-decoration: none; color: inherit;">
                    <div class="food-card" id="food" data-id="<%= prod.getId() %>">
                        <img src="uploads/<%= prod.getImage() %>" alt="<%= prod.getName() %>" class="food-image">
                        <div class="food-content">
                            <div class="food-name"><%= prod.getName() %></div>
                            <div class="food-price">₹<%= prod.getPrice() %></div>
                        </div>
                    </div>
                </a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="container">
            <p>&copy; 2025 Foodexpress. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>