<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Summary</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            max-width: 1200px;
            width: 100%;
            margin: 20px;
        }

        @media (max-width: 768px) {
            .main-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }
        }

        .bill-card {
            background: rgba(30, 41, 59, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            border: 1px solid #334155;
        }

        .bill-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .bill-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(90deg, #22c55e, #86efac);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .bill-subtitle {
            color: #94a3b8;
            font-size: 1.1rem;
        }

        .bill-details {
            margin: 30px 0;
        }

        .bill-item {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #334155;
        }

        .bill-item:last-child {
            border-bottom: none;
        }

        .item-label {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #cbd5e1;
        }

        .item-icon {
            width: 36px;
            height: 36px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #22c55e;
        }

        .item-value {
            font-weight: 500;
            color: #f1f5f9;
        }

        .total-item {
            font-weight: 700;
            font-size: 1.2rem;
            margin-top: 10px;
        }

        .total-item .item-value {
            color: #22c55e;
            font-size: 1.3rem;
        }

        .action-section {
            margin-top: 40px;
            text-align: center;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: #22c55e;
            font-size: 2.5rem;
            border: 2px solid rgba(34, 197, 94, 0.3);
        }

        .btn-home {
            display: inline-block;
            padding: 16px 40px;
            background: linear-gradient(90deg, #22c55e, #16a34a);
            color: #0f172a;
            font-weight: 600;
            font-size: 1.1rem;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 10px 15px -3px rgba(34, 197, 94, 0.3);
        }

        .btn-home:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 20px -3px rgba(34, 197, 94, 0.4);
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

        .order-summary {
            background: rgba(15, 23, 42, 0.5);
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
            border: 1px solid #334155;
        }

        .summary-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #f1f5f9;
            text-align: center;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 0.95rem;
        }

        .summary-label {
            color: #94a3b8;
        }

        .summary-value {
            color: #cbd5e1;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .bill-card {
                padding: 30px 20px;
            }
            
            .bill-title {
                font-size: 1.7rem;
            }
            
            .main-container {
                margin: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="food-image-container">
            <%-- You can populate the src with actual food image --%>
            <img src="" alt="${productName}" class="food-image" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
            <div class="placeholder-icon" style="display: none;">
                <i class="fas fa-utensils"></i>
            </div>
        </div>
        
        <div class="bill-card">
            <div class="bill-header">
                <h1 class="bill-title">Order Confirmed</h1>
                <p class="bill-subtitle">Thank you for your purchase!</p>
            </div>
            
            <div class="bill-details">
                <div class="bill-item">
                    <div class="item-label">
                        <div class="item-icon">
                            <i class="fas fa-pizza-slice"></i>
                        </div>
                        <span>Product</span>
                    </div>
                    <div class="item-value">${productName}</div>
                </div>
                
                <div class="bill-item">
                    <div class="item-label">
                        <div class="item-icon">
                            <i class="fas fa-tag"></i>
                        </div>
                        <span>Price</span>
                    </div>
                    <div class="item-value">₹${productPrice}</div>
                </div>
                
                <div class="bill-item">
                    <div class="item-label">
                        <div class="item-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <span>Delivery Fee</span>
                    </div>
                    <div class="item-value">₹${deliveryFee}</div>
                </div>
                
                <div class="bill-item">
                    <div class="item-label">
                        <div class="item-icon">
                            <i class="fas fa-percent"></i>
                        </div>
                        <span>Tax (5%)</span>
                    </div>
                    <div class="item-value">₹${tax}</div>
                </div>
                
                <div class="bill-item total-item">
                    <div class="item-label">
                        <div class="item-icon">
                            <i class="fas fa-receipt"></i>
                        </div>
                        <span>Total Amount</span>
                    </div>
                    <div class="item-value">₹${total}</div>
                </div>
            </div>
            
            <div class="order-summary">
                <h3 class="summary-title">Order Summary</h3>
                <div class="summary-item">
                    <span class="summary-label">Order ID:</span>
                    <span class="summary-value">#ORD-${productName.hashCode() % 10000}</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Date:</span>
                    <span class="summary-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(new java.util.Date()) %></span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Status:</span>
                    <span class="summary-value" style="color: #22c55e;">Confirmed</span>
                </div>
            </div>
            
            <div class="action-section">
                <div class="success-icon">
                    <i class="fas fa-check"></i>
                </div>
                <a href="/" class="btn-home">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </div>
</body>
</html>