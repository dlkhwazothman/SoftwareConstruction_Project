<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Category categoryDetails = new Category();
	ArrayList allCategory = categoryDetails.getAllCategory();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Category Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Category Name</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCategory.size();i++) 
			{ 
				HashMap CategoryDetails = new HashMap();
				CategoryDetails = (HashMap)allCategory.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(CategoryDetails.get("category_name")); %></td>
				  <td><% out.print(CategoryDetails.get("category_description")); %></td>
				  <td> 
					<a href="category.jsp?category_id=<% out.print(CategoryDetails.get("category_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allCategory.size() == 0) 
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
