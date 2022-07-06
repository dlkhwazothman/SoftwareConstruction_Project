<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Book bookDetails = new Book();
	ArrayList allBook;
	String level = session.getAttribute("login_level").toString();
	String empId = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) {
		allBook = bookDetails.getAllBook("0");
	} else {
		allBook = bookDetails.getAllBook(session.getAttribute("customer_id").toString());
	}
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Booking Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Name</th>
			  <th>Mobile</th>
              <th>Email</th>
              <th>Booking Date and Time</th>
			  <th>From Date</th>
			  <th>To Date</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allBook.size();i++) 
			{ 
				HashMap BookDetails = new HashMap();
				BookDetails = (HashMap)allBook.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(BookDetails.get("book_name")); %></td>
				  <td><% out.print(BookDetails.get("book_mobile")); %></td>
				  <td><% out.print(BookDetails.get("book_email")); %></td>
				  <td><% out.print(BookDetails.get("book_date")); %></td>
				  <td><% out.print(BookDetails.get("book_from_date")); %></td>
				  <td><% out.print(BookDetails.get("book_to_date")); %></td>
				</tr>
			<%
			}
			if(allBook.size() == 0) 
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
