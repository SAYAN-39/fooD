<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .bill-container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .item {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            font-size: 16px;
        }

        .total {
            font-weight: bold;
            font-size: 18px;
            border-top: 1px solid #ccc;
            margin-top: 20px;
            padding-top: 10px;
        }

        .btn-home {
            display: block;
            margin: 30px auto 0;
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .btn-home:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="bill-container">
        <h2>Billing Summary</h2>
        <div class="item"><span>Product:</span><span>${productName}</span></div>
        <div class="item"><span>Price:</span><span>₹${productPrice}</span></div>
        <div class="item"><span>Delivery Fee:</span><span>₹${deliveryFee}</span></div>
        <div class="item"><span>Tax (5%):</span><span>₹${tax}</span></div>
        <div class="item total"><span>Total:</span><span>₹${total}</span></div>

        <a href="/" class="btn-home">Back to Home</a>
    </div>
</body>
</html>
