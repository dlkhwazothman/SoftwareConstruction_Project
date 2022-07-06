<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	if(session.getAttribute("login_level") == null || session.getAttribute("login_level") == "") {
		session.setAttribute("room_id",request.getParameter("room_id"));
		response.sendRedirect("customer-login.jsp?msg=Login to book the room and making payment !!!");
	}
	Room roomDetails = new Room();
	int room_id = Integer.parseInt(request.getParameter ("room_id"));
	HashMap Values =  roomDetails.getRoomDetails(room_id);	
%>
<script>
    function openWin(url)
    {
        location.href = url;
    }
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
	  <% } %>
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30">
        <!-- Middle Column -->
        <div class="one_half comments" style="width:68%"> 
          <!-- ################################################################################################ -->
          <h2>Room Title : <%=Values.get("category_name")%></h2>
          <ul class="nospace listing" style="padding:1px 1px; margin:1px 1px">
            <li class="clear" style="padding:1px 1px; margin:1px 1px">
              <div class="imgl borderedbox"><img src="roomImages/<% out.print(Values.get("room_image")); %>" style="height:80px; width:80px;"></div>
				<div style="float:left; float:left;">
				  <p class="nospace btmspace-15">
					  <a href="RoomDetails.jsp?room_id=<%=Values.get("room_id")%>" style="padding-bottom:50px; font-weight:bold; text-decoration:underline"><%=Values.get("category_name")%></a><br> 
					  <span style="color:#4d0b0d; font-weight:bold">Beds : </span><%=Values.get("room_no_of_beds")%><br> 
					  <span style="color:#4d0b0d; font-weight:bold">Max Adults :</span> <%=Values.get("room_max_adult")%><br> 
					  <span style="color:#4d0b0d; font-weight:bold">Max Childs :</span> <%=Values.get("room_max_child")%>
				  </p>
				  </div>
            </li>
          </ul>
          <!-- ################################################################################################ --> 
          <h2 style="margin-top:10px; background-color:#4d0b0d; color:#ffffff; padding:8px; font-weight:bold">BOOK YOUR ROOM (REVIEW YOUR BOOKING DETAILS)</h2>
          <table>
              <tr>
                  <th>From Date</th>
                  <td><%=session.getAttribute("to_date")%></td>
              </tr>
              <tr>
                  <th>To Date</th>
                  <td><%=session.getAttribute("from_date")%></td>
              </tr>
              <tr>
                  <th>No. Of Rooms</th>
                  <td><%=session.getAttribute("no_rooms")%> Rooms</td>
              </tr>
              <tr>
                  <th>No. Of Adults</th>
                  <td><%=session.getAttribute("no_adults")%> Adults</td>
              </tr>
              <tr>
                  <th>No. Of Childs</th>
                  <td><%=session.getAttribute("no_child")%> Childs</td>
              </tr>
              <tr>
                  <th>Name</th>
                  <td><%=session.getAttribute("customer_name")%></td>
              </tr>
              <tr>
                  <th>Mobile</th>
                  <td><%=session.getAttribute("customer_mobile")%></td>
              </tr>
              <tr>
                  <th>Email</th>
                  <td><%=session.getAttribute("customer_email")%></td>
              </tr>
          </table>
			<div style="float:right">
				<input value="Book This Room" type="button" onclick="openWin('payment.jsp')">
			</div>
        </div>
        <!-- / Middle Column --> 
        <!-- / main body -->
       <div style="float: right">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      </div>
      
      <div class="clear"></div>
    </main>
  </div>
</div>
</asp:Content>

