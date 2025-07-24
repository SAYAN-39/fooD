<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.Product" %>
   <jsp:include page="navbar.jsp" />
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: #e2e8f0;
            min-height: 100vh;
            padding: 20px;
        }

        .main-container {
            max-width: 1200px;
            margin: 40px auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
        }

        @media (max-width: 768px) {
            .main-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }
        }

        .food-image-container {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            height: 500px;
            background: linear-gradient(45deg, #334155, #1e293b);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .food-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .food-image-container:hover .food-image {
            transform: scale(1.05);
        }

        .placeholder-icon {
            font-size: 80px;
            color: #334155;
        }

        .details-container {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.3);
            border: 1px solid #334155;
        }

        .food-title {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #f1f5f9, #cbd5e1);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .price-tag {
            display: inline-block;
            font-size: 2.2rem;
            font-weight: 700;
            color: #22c55e;
            margin: 25px 0;
            padding: 15px 25px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 15px;
            border: 1px solid rgba(34, 197, 94, 0.3);
        }

        .description {
            font-size: 1.1rem;
            line-height: 1.7;
            color: #94a3b8;
            margin-bottom: 35px;
        }

        .action-buttons {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }

        @media (max-width: 480px) {
            .action-buttons {
                flex-direction: column;
            }
        }

        .btn {
            flex: 1;
            padding: 18px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-order {
            background: linear-gradient(90deg, #22c55e, #16a34a);
            color: #0f172a;
            box-shadow: 0 10px 15px -3px rgba(34, 197, 94, 0.3);
        }

        .btn-order:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 20px -3px rgba(34, 197, 94, 0.4);
        }

        .btn-cancel {
            background: rgba(255, 255, 255, 0.08);
            color: #cbd5e1;
            border: 1px solid #334155;
        }

        .btn-cancel:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-5px);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin: 30px 0;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #22c55e;
        }

        .feature-text {
            font-size: 0.95rem;
            color: #94a3b8;
        }

        .rating {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
        }

        .stars {
            color: #fbbf24;
        }

        .rating-text {
            color: #94a3b8;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .details-container {
                padding: 30px 20px;
            }
            
            .food-title {
                font-size: 2rem;
            }
            
            .price-tag {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <%
        Product product=(Product)request.getAttribute("data");
        if(product!=null)
        {
    %>
    <div class="main-container">
        <div class="food-image-container">
            <%-- You can replace the placeholder with actual image src --%>
            <img src="" alt="<%= product.getName() %>" class="food-image" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
            <div class="placeholder-icon" style="display: none;">
                <i class="fas fa-utensils"></i>
            </div>
        </div>
        
        <div class="details-container">
            <h1 class="food-title"><%= product.getName() %></h1>
            
            <div class="rating">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <span class="rating-text">4.7 (128 reviews)</span>
            </div>
            
            <div class="price-tag">₹ <%= product.getPrice() %></div>
            
            <p class="description">
                Indulge in this delicious creation made with premium ingredients. 
                Perfectly crafted to deliver an exceptional culinary experience 
                that will satisfy your cravings.
            </p>
            
            <div class="features">
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-fire"></i>
                    </div>
                    <div class="feature-text">Freshly Prepared</div>
                </div>
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <div class="feature-text">Organic Ingredients</div>
                </div>
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="feature-text">Fast Delivery</div>
                </div>
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="feature-text">Chef Recommended</div>
                </div>
            </div>
            
            <div class="action-buttons">
                <form method="post" action="/bill" style="flex: 1;">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="hidden" name="productName" value="<%= product.getName() %>">
                    <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
                    <button type="submit" class="btn btn-order">
                        <i class="fas fa-shopping-bag"></i> Order Now
                    </button>
                </form>
                <button class="btn btn-cancel" onclick="cancelOrder()">
                    <i class="fas fa-times"></i> Cancel
                </button>
            </div>
        </div>
    </div>
    <% 
    }
    %>   
    
    <script>
        function cancelOrder() {
            window.location.href = '/';
        }
    </script>
</body>
</html>