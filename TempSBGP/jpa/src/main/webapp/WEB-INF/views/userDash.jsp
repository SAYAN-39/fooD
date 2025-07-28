<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.User" %>
<%
	String data = (String) session.getAttribute("udata");
	String userrolecheck = (String) session.getAttribute("role");

	if (data == null) {
		response.sendRedirect("/reg");  
	    return; 
	} else if (!"admin".equals(userrolecheck)) { // ✅ safer way
		response.sendRedirect("logout");  
		return; 
	}
%>
<!DOCTYPE html>
<html lang0="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
</head>
<body>
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
		            <a href="app">
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
                <a href="orderDash">
                    <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                    <span class="title">View Order</span>
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
				<table border="1">
				    <thead>
				        <tr>
							<th>ID</th>
				            <th>Name</th>
				            <th>Email (UserId)</th>
				            <th>Phone</th>
				            <th>Password</th>
				            <th>Role</th>
				        </tr>
				    </thead>
				    <tbody>
				        <%
				            List<User> users = (List<User>) request.getAttribute("data");
				            if (users != null && !users.isEmpty()) {
				                for (User user : users) {
				        %>
				        <tr>
							<td><%= user.getId() %></td>
				            <td><%= user.getName() %></td>
				            <td><%= user.getEmail() %></td>
				            <td><%= user.getPhno() %></td>
				            <td><%= user.getPassword() %></td>
				            <td><%= user.getRole() %></td>
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