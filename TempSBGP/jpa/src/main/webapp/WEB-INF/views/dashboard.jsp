<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
</head>
<body>

<div class="container">
    <%-- FIX: changed class to "sidebar" for consistency with CSS --%>
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
                <a href="trainer">
                    <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <span class="title">View User</span>
                </a>
            </li>
            <li>
                <a href="app">
                    <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                    <span class="title">View Order</span>
                </a>
            </li>
            <li>
                <a href="app">
                    <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                    <span class="title">View Feedback</span>
                </a>
            </li>
            <li>
                <a href="./Login.jsp">
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
                <label for="html">
                    <input type="text" placeholder="Search Here">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </label>
            </div>
            <div class="user">
                <img src="./img/dashboard logo.png" style="height:80px;">
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
                    <h2>Product Details</h2>
                    <a href="memvalid" class="btn">View All</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ProdId</th>
                            <th>ProdName</th>
                            <th>Price</th>
                            <th colspan="2">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Product> product = (List<Product>) request.getAttribute("data");
                            if (product != null && !product.isEmpty()) {
                                for (Product prod : product) {
                        %>
                        <tr>
                            <td><%= prod.getId() %></td>
                            <td><%= prod.getName() %></td>
                            <td><%= prod.getPrice() %></td>
                            <td><a href="/viewrecord/<%= prod.getId() %>">Edit</a></td>
                            <td><a href="/delete/<%= prod.getId() %>" onclick="return confirm('Are you sure?')">Delete</a></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" style="text-align:center;">Record Not Found!</td>
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