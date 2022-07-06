<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Category categoryObj = new Category();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("category_id",request.getParameter("category_id"));
		results.put("category_name",request.getParameter("category_name"));
		results.put("category_description",request.getParameter("category_description"));

		if((request.getParameter("category_id")).equals(""))
		{
			out.println(categoryObj.saveCategory(results));
			response.sendRedirect("../report-category.jsp?emp_id="+emp_id+"&msg=Category Saved Successfully");
		}
		else
		{
			results.put("category_id",request.getParameter("category_id"));
			out.println(categoryObj.updateCategory(results));
			response.sendRedirect("../report-category.jsp?emp_id=0&msg=Category Updated Successfully");
		}
	}
%>
