<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to Hotel Booking System</h2>
		  
		  <!-- Dashboard For User Section -->
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="about-us.jsp">About Us</a></li>
			<li><a href="search.jsp">Book Room</a></li>	
			<li><a href="customer.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Account</a></li>
			<li><a href="report-booking.jsp">My Bookings</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>	
			<li><a href="room.jsp?room_id=0">Add Room</a></li>
            <li><a href="facility.jsp?facility_id=0">Add Facility</a></li>
            <li><a href="category.jsp?category_id=0">Add Room Type</a></li>
			<li><a href="customer.jsp?customer_id=0">Add Customer</a></li>
			<li><a href="employee.jsp?employee_id=0">Add User</a></li>
			<li><a href="report-room.jsp">Rooms Reports</a></li>
            <li><a href="report-facility.jsp">Facility Report</a></li>
            <li><a href="report-category.jsp">Room Type Report</a></li>
			<li><a href="report-customer.jsp">Customer Report</a></li>
			<li><a href="report-employee.jsp">Users Reports</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		</div>
		<div style="float: left">
			<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
			<div><img src="images/save_2.jpg" style="width: 250px"></div>
		</div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
