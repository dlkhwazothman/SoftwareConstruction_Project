<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Facility facilityDetails = new Facility();
	String facilityLabel = "Save";
	int facility_id = Integer.parseInt(request.getParameter ("facility_id"));
	if(facility_id != 0) {
		facilityLabel = "Update";
	}
	HashMap Values =  facilityDetails.getFacilityDetails(facility_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Facility Entry Form</h2>
        <form action="model/facility.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="facility_name" id="facility_name" value="<% out.print(Values.get("facility_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="facility_description" required><% out.print(Values.get("facility_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(facilityLabel); %> Facility">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="facility_id" value="<% out.print(Values.get("facility_id")); %>"/>
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