<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Author authorDetails = new Author();
	String authorLabel = "Save";
	int author_id = Integer.parseInt(request.getParameter ("author_id"));
	if(author_id != 0) {
		authorLabel = "Update";
	}
	HashMap Values =  authorDetails.getAuthorDetails(author_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Author Entry Form</h2>
        <form action="model/author.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="author_name" id="author_name" value="<% out.print(Values.get("author_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Phone<span>*</span></label>
            <input type="text" name="author_contact" id="author_contact" value="<% out.print(Values.get("author_contact")); %>" size="22" style="width:300px;" required>
          </div>
		  <div id="author_status_row">
            <label for="email">Email Address<span>*</span></label>
			<input type="text" name="author_email" id="author_email" value="<% out.print(Values.get("author_email")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="author_description" required><% out.print(Values.get("author_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(authorLabel); %> Author">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="author_id" value="<% out.print(Values.get("author_id")); %>"/>
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
