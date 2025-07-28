<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.Order" %> <%-- Changed to import the Order model --%>
<%
    // Security check to ensure only logged-in admins can access this page
    String data = (String) session.getAttribute("udata");
    String userrolecheck = (String) session.getAttribute("role");

    if (data == null) {
        response.sendRedirect("/reg");
        return;
    } else if (!"admin".equals(userrolecheck)) {
        response.sendRedirect("logout");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Orders</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
</head>
<body>
<div class="container">
    <div class="sidebar">
        <ul>
            <li>
                <a href="#">
                    <span class="icon"><i class="fa fa-user-plus" aria-hidden="true"></i></span>
                    <span class="title"><h2>Admin Dashboard</h2></span>
                </a>
            </li>
            <li>
                <a href="dash">
                    <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                    <span class="title">Home</span>
                </a>
            </li>
            <li>
                <a href="addform">
                    <span class="icon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                    <span class="title">Add Fooditem</span>
                </a>
            </li>
            <li>
                <a href="userDash">
                    <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <span class="title">View User</span>
                </a>
            </li>
            <li>
                <a href="app"> <%-- This link likely points to this page --%>
                    <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                    <span class="title">View Order</span>
                </a>
            </li>
            <li>
                <a href="logout">
                    <span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                    <span class="title">Log out</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <div class="topbar">
            <div class="toggle-button"></div>
            <div class="search-bar">
                <label>
                    <input type="text" placeholder="Search Here">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </label>
            </div>
            <div class="user">
                <img src="./img/dashboard logo.png" style="height:80px;" alt="Logo">
            </div>
        </div>

        <div class="card-container">
            <div class="card">
                <div>
                    <div class="numbers">0</div>
                    <div class="card-name">Active Users</div>
                </div>
                <div class="icon-box">
                    <i class="fa fa-users" aria-hidden="true"></i>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="numbers">0</div>
                    <div class="card-name">Sales</div>
                </div>
                <div class="icon-box">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </div>
            </div>
        </div>

        <div class="details-section">
            <div class="recent-orders">
                <div class="card-header">
                    <h2>Recent Orders</h2>
                    <a href="#" class="btn">View All</a>
                </div>
                <table border="1">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Order ID</th>
                        <th>Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        // Retrieve the list of orders from the request attribute
                        List<Order> orders = (List<Order>) request.getAttribute("data");
                        if (orders != null && !orders.isEmpty()) {
                            for (Order order : orders) {
                    %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getName() %></td>
                        <td><%= order.getEmail() %></td>
                        <td><%= order.getPhone_Number() %></td>
                        <td><%= order.getOrderID() %></td>
                        <td><%= String.format("%.2f", order.getPrice()) %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <%-- Changed colspan to 6 to match the new number of columns --%>
                        <td colspan="6" style="text-align:center;">No Orders Found!</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>