<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Room roomDetails = new Room();
	ArrayList allRoom = roomDetails.getAllRoom();
	session.setAttribute("from_date",request.getParameter("from_date"));
	session.setAttribute("to_date",request.getParameter("to_date"));
	session.setAttribute("no_rooms",request.getParameter("no_rooms"));
	session.setAttribute("no_adults",request.getParameter("no_adults"));
	session.setAttribute("no_child",request.getParameter("no_child"));
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
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30">
        <!-- Middle Column -->
        <div class="one_half" style="width:68%"> 
          <!-- ################################################################################################ -->
          <h2>All Avilable Rooms</h2>
          <ul class="nospace listing" style="padding:1px 1px; margin:1px 1px">
          <% for(int i=0;i<allRoom.size();i++) 
			{ 
				HashMap RoomDetails = new HashMap();
				RoomDetails = (HashMap)allRoom.get(i);
		  %>
            <li class="clear" style="padding:1px 1px; margin:10px 1px">
              <div class="borderedbox" style="margin-right:20px; float:left"><a href="RoomDetails.jsp?room_id=<%=RoomDetails.get("room_id")%>"><img src="roomImages/<% out.print(RoomDetails.get("room_image")); %>" style="height:80px; width:80px;"></a></div>
              <div style="float:left; float:left; border-right: 1px solid; width:200px; height:100px; margin-right:120px;">
              <p class="nospace btmspace-15">
				  <a href="RoomDetails.jsp?room_id=<%=RoomDetails.get("room_id")%>" style="padding-bottom:50px; font-weight:bold; text-decoration:underline"><%=RoomDetails.get("category_name")%></a><br> 
				  <span style="color:#4d0b0d; font-weight:bold">Beds : </span><%=RoomDetails.get("room_no_of_beds")%><br> 
				  <span style="color:#4d0b0d; font-weight:bold">Max Adults :</span> <%=RoomDetails.get("room_max_adult")%><br> 
				  <span style="color:#4d0b0d; font-weight:bold">Max Childs :</span> <%=RoomDetails.get("room_max_child")%><br>
				  <span style="color:#4d0b0d; font-weight:bold">Room Fare :</span> <%=RoomDetails.get("room_fare")%>.00/-
              </p>
              </div>
              <div style="">&nbsp;</div>
              <div>
				  <input type="button" value="Book Room" onclick="openWin('RoomDetails.jsp?room_id=<%=RoomDetails.get("room_id")%>')">
              </div>
            </li>
           <%
              }
           %>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Middle Column --> 
         <div style="float: right">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      </div>
      <!-- / main body -->
      
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>


