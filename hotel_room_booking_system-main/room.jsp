<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Room roomDetails = new Room();
	String roomLabel = "Save";
	int room_id = Integer.parseInt(request.getParameter ("room_id"));
	if(room_id != 0) {
		roomLabel = "Update";
	}
	HashMap Values =  roomDetails.getRoomDetails(room_id);	
%>
<script>
function validImage() {
	var val = $("#room_image").val();
	var id = $("#room_id").val();
	if(id == '' || val != '')
	{
		if(val == '') {
			alert('Choose the Room Image');
			return false;
		}
		if (!val.match(/(?:gif|jpg|png|bmp)$/)) {
			// inputted file path is not an image of one of the above types
			alert("inputted file path is not an image!");
			return false;
		}
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Room Entry Form</h2>
        <form action="UploadRoom" method="post" method="post" enctype="multipart/form-data" onsubmit="return validImage()">
		  <div id="room_status_row" class="half_width">
            <label for="email">Room Name<span>*</span></label>
			<input type="text" name="room_name" id="room_name" value="<% out.print(Values.get("room_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Room Fare<span>*</span></label>
            <input type="text" name="room_fare" id="room_fare" value="<% out.print(Values.get("room_fare")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Select Room Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "room_category_id" id = "room_category_id" required>
            	<% out.print(roomDetails.getCategoryOption((Integer) Values.get("room_category_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Number of Beds<span>*</span></label>
            <input type="text" name="room_no_of_beds" id="room_no_of_beds" value="<% out.print(Values.get("room_no_of_beds")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Max No. of Adults<span>*</span></label>
            <input type="text" name="room_max_adult" id="room_max_adult" value="<% out.print(Values.get("room_max_adult")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Max No. of Childs<span>*</span></label>
            <input type="text" name="room_max_child" id="room_max_child" value="<% out.print(Values.get("room_max_child")); %>" size="22" style="width:300px;" required>
          </div>
		  <div style="margin0-top:10px;" class="half_width">
            <label for="email">Select Room Facility<span>*</span></label>
			<div style="height:120px; width:300px; overflow:scroll; margin-top:5px;">
				<% out.print(roomDetails.getFacilityOption(Values.get("room_facility_id").toString())); %>
			</div>
          </div>
		  <div class="half_width">
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="room_description" required><% out.print(Values.get("room_description")); %></textarea>
          </div>
          <div class="half_width">
            <label for="email">Room Image<span>*</span></label>
            <input type="file" name="room_image" id="room_image" style="width:300px">
          </div>
          <% if(!Values.get("room_image").equals("")) { %>
          <div class="half_width">
			<img src="roomImages/<% out.print(Values.get("room_image")); %>" style="height:100px; width:100px;">
          </div>
          <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(roomLabel); %> Room">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("room_image")); %>" />
		  <input type="hidden" name="room_id" value="<% out.print(Values.get("room_id")); %>"/>
        </form>
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
