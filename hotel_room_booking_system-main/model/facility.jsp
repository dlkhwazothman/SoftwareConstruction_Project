<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Facility facilityObj = new Facility();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("facility_id",request.getParameter("facility_id"));
		results.put("facility_name",request.getParameter("facility_name"));
		results.put("facility_description",request.getParameter("facility_description"));

		if((request.getParameter("facility_id")).equals(""))
		{
			out.println(facilityObj.saveFacility(results));
			response.sendRedirect("../report-facility.jsp?emp_id="+emp_id+"&msg=Facility Saved Successfully");
		}
		else
		{
			results.put("facility_id",request.getParameter("facility_id"));
			out.println(facilityObj.updateFacility(results));
			response.sendRedirect("../report-facility.jsp?emp_id=0&msg=Facility Updated Successfully");
		}
	}
%>
