<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Room roomDetails = new Room();
	String employeeID = "0";
	ArrayList allRoom = roomDetails.getAllRoom();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Room Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
			  <th>Image</th>
              <th>Name</th>
			  <th>Type</th>
              <th>No of Beds</th>
              <th>Adults Allowed</th>
			  <th>Child Allowed</th>
			  <th>Fare</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allRoom.size();i++) 
			{ 
				HashMap RoomDetails = new HashMap();
				RoomDetails = (HashMap)allRoom.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(RoomDetails.get("room_name")); %></td>
				  <td><img src="roomImages/<% out.print(RoomDetails.get("room_image")); %>" style="height:80px; width:80px;"></td>
				  <td><% out.print(RoomDetails.get("category_name")); %></td>
				  <td><% out.print(RoomDetails.get("room_no_of_beds")); %></td>
				  <td><% out.print(RoomDetails.get("room_max_adult")); %></td>
				  <td><% out.print(RoomDetails.get("room_max_child")); %></td>
				  <td><% out.print(RoomDetails.get("room_fare")); %></td>
				  <td> 
					<a href="room.jsp?room_id=<% out.print(RoomDetails.get("room_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allRoom.size() == 0) 
			{
			%>
				<tr>
					<td colspan="5">No Records Found !!!</td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
