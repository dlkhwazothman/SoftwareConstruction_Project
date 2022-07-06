<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Facility facilityDetails = new Facility();
	ArrayList allFacility = facilityDetails.getAllFacility();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Facility Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Facility Name</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allFacility.size();i++) 
			{ 
				HashMap FacilityDetails = new HashMap();
				FacilityDetails = (HashMap)allFacility.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(FacilityDetails.get("facility_name")); %></td>
				  <td><% out.print(FacilityDetails.get("facility_description")); %></td>
				  <td> 
					<a href="facility.jsp?facility_id=<% out.print(FacilityDetails.get("facility_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allFacility.size() == 0) 
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
