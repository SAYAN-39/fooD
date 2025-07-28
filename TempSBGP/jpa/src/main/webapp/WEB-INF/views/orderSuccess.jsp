<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% 
	String email = (String) session.getAttribute("udata"); 
	String name = (String) session.getAttribute("name"); 
	String ph_number = (String) session.getAttribute("contact"); 
%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
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

        .success-container {
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        .success-card {
            background: rgba(30, 41, 59, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 60px 40px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            border: 1px solid #334155;
            position: relative;
            overflow: hidden;
        }

        .success-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #22c55e, #86efac);
        }

        .success-icon {
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            position: relative;
            animation: successPulse 2s ease-in-out infinite;
        }

        .success-icon i {
            font-size: 60px;
            color: #0f172a;
        }

        .success-icon::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: rgba(34, 197, 94, 0.3);
            animation: ripple 2s ease-out infinite;
        }

        @keyframes successPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes ripple {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            100% {
                transform: scale(1.4);
                opacity: 0;
            }
        }

        .success-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            background: linear-gradient(90deg, #22c55e, #86efac);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .success-subtitle {
            color: #94a3b8;
            font-size: 1.2rem;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .payment-details {
            background: rgba(15, 23, 42, 0.5);
            border-radius: 15px;
            padding: 30px;
            margin: 30px 0;
            border: 1px solid #334155;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #334155;
        }

        .detail-item:last-child {
            border-bottom: none;
        }

        .detail-label {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #cbd5e1;
            font-weight: 500;
        }

        .detail-icon {
            width: 36px;
            height: 36px;
            background: rgba(34, 197, 94, 0.1);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #22c55e;
        }

        .detail-value {
            font-weight: 600;
            color: #f1f5f9;
            font-family: 'Courier New', monospace;
            background: rgba(34, 197, 94, 0.1);
            padding: 8px 16px;
            border-radius: 8px;
            border: 1px solid rgba(34, 197, 94, 0.2);
        }

        .customer-info {
            text-align: left;
            margin: 30px 0;
        }

        .info-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #f1f5f9;
            text-align: center;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            font-size: 0.95rem;
        }

        .info-label {
            color: #94a3b8;
        }

        .info-value {
            color: #cbd5e1;
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 40px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 16px 32px;
            font-weight: 600;
            font-size: 1.1rem;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            min-width: 180px;
            justify-content: center;
        }

        .btn-primary {
            background: linear-gradient(90deg, #22c55e, #16a34a);
            color: #0f172a;
            box-shadow: 0 10px 15px -3px rgba(34, 197, 94, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 20px -3px rgba(34, 197, 94, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(90deg, #64748b, #475569);
            color: #f1f5f9;
            box-shadow: 0 10px 15px -3px rgba(100, 116, 139, 0.3);
        }

        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 20px -3px rgba(100, 116, 139, 0.4);
        }

        .decorative-elements {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
        }

        .floating-icon {
            position: absolute;
            color: rgba(34, 197, 94, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-icon:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
        .floating-icon:nth-child(2) { top: 60%; right: 15%; animation-delay: 2s; }
        .floating-icon:nth-child(3) { bottom: 20%; left: 20%; animation-delay: 4s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(34, 197, 94, 0.1);
            color: #22c55e;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 20px;
            border: 1px solid rgba(34, 197, 94, 0.2);
        }

        .status-indicator {
            width: 8px;
            height: 8px;
            background: #22c55e;
            border-radius: 50%;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        @media (max-width: 768px) {
            .success-card {
                padding: 40px 20px;
                margin: 10px;
            }
            
            .success-title {
                font-size: 2rem;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 300px;
            }
            
            .detail-item {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-card">
            <div class="decorative-elements">
                <i class="fas fa-check floating-icon" style="font-size: 40px;"></i>
                <i class="fas fa-star floating-icon" style="font-size: 30px;"></i>
                <i class="fas fa-heart floating-icon" style="font-size: 35px;"></i>
            </div>
            
            <div class="status-badge">
                <div class="status-indicator"></div>
                Payment Confirmed
            </div>
            
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            
            <h1 class="success-title">Order Successful!</h1>
            <p class="success-subtitle">
                Thank you for your order! Your payment has been processed successfully 
                and your delicious meal is being prepared.
            </p>
            
            <div class="payment-details">
                <div class="detail-item">
                    <div class="detail-label">
                        <div class="detail-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <span>Payment ID</span>
                    </div>
                    <div class="detail-value">${paymentId}</div>
                </div>
                
                <div class="detail-item">
                    <div class="detail-label">
                        <div class="detail-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <span>Order Time</span>
                    </div>
                    <div class="detail-value">
                        <script>document.write(new Date().toLocaleString());</script>
                    </div>
                </div>
                
                <div class="detail-item">
                    <div class="detail-label">
                        <div class="detail-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <span>Estimated Delivery</span>
                    </div>
                    <div class="detail-value">30-45 minutes</div>
                </div>
            </div>
            
            <div class="payment-details customer-info">
                <h3 class="info-title">Order Details</h3>
                <div class="info-item">
                    <span class="info-label">Customer Name:</span>
                    <span class="info-value"><%= name != null ? name : "N/A" %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <span class="info-value"><%= email != null ? email : "N/A" %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Contact:</span>
                    <span class="info-value"><%= ph_number != null ? ph_number : "N/A" %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Status:</span>
                    <span class="info-value" style="color: #22c55e;">
                        <i class="fas fa-check-circle"></i> Confirmed
                    </span>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="/" class="btn btn-primary">
                    <i class="fas fa-home"></i>
                    Back to Home
                </a>
                <a href="/track-order" class="btn btn-secondary">
                    <i class="fas fa-map-marker-alt"></i>
                    Track Order
                </a>
            </div>
        </div>
    </div>
</body>
</html>	