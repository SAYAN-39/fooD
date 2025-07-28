<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- FIX: Corrected to match CSS (sidebar, not navigation) -->
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
	            <a href="orderdash">
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
                    <i class="fa fa-search"></i>
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
                <div class="icon-box"><i class="fa fa-users"></i></div>
            </div>
            <div class="card">
                <div>
                    <div class="numbers">0</div>
                    <div class="card-name">Sales</div>
                </div>
                <div class="icon-box"><i class="fa fa-shopping-cart"></i></div>
            </div>
        </div>

        <div class="details-section">
            <div class="recent-orders">
                <div class="card-header">
                    <h2>Add New Food Item</h2>
                    <!-- EL Expression for server message -->
                    <h4 style="color: green;">${msg}</h4>
                </div>

                <!-- ✅ FIXED FORM TAG: Corrected enctype attribute -->
                <form action="additem" method="post" enctype="multipart/form-data">

                    <label for="prodname">Food Name</label>
                    <input type="text" name="prodname" id="prodname" placeholder="Food name.."><br><br>

                    <label for="price">Price</label>
                    <input type="text" name="price" id="price" placeholder="Price.."><br><br>

                    <input type="submit" value="Submit">
                    <input type="reset" value="Clear">
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
