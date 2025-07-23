<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.Product" %>
   <jsp:include page="navbar.jsp" />
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizza Order</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: white;
            border: 3px solid #333;
            border-radius: 20px;
            padding: 60px 40px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .order-card {
            background-color: #f9f9f9;
            border: 2px solid #333;
            border-radius: 15px;
            padding: 40px 30px;
            text-align: center;
            margin-bottom: 30px;
        }

        .pizza-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }

        .price {
            font-size: 20px;
            color: #666;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            gap: 20px;
            justify-content: center;
        }

        .btn {
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            border: 2px solid #333;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 100px;
        }

        .btn-checkout {
            background-color: #4CAF50;
            color: white;
        }

        .btn-checkout:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        .btn-cancel {
            background-color: white;
            color: #333;
        }

        .btn-cancel:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
        }

        @media (max-width: 480px) {
            .container {
                padding: 40px 20px;
            }
            
            .order-card {
                padding: 30px 20px;
            }
            
            .button-group {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 150px;
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
    <div class="container">
        <div class="order-card">
            <div class="pizza-name"><%= product.getName() %></div>
            <div class="price">Price: <%= product.getPrice() %></div>
            <div class="button-group">
                <div class="button-group">
    <form method="post" action="/bill">
    
        <input type="hidden" name="productId" value="<%= product.getId() %>">
        <input type="hidden" name="productName" value="<%= product.getName() %>">
        <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
        <button type="submit" class="btn btn-checkout">Checkout</button>
    </form>
    <button class="btn btn-cancel" onclick="cancel()">Cancel</button>
</div>

                
            </div>
        </div>
    </div>
	<% 
	}
	%>   
    
</body>
</html>