<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<script>
  jQuery(function() {
    jQuery( "#from_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+0",
       dateFormat: 'd MM,yy'
    });
    jQuery( "#to_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+0",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Search Your Room</h2>
        <form action="list-room.jsp" method="post">
		  <div id="empl_id">
            <label for="email">From Date<span>*</span></label>
            <input type="text" name="from_date" id="from_date" size="22" style="width:300px;" required>
          </div>
          <div id="empl_id">
            <label for="email">To Date<span>*</span></label>
            <input type="text" name="to_date" id="to_date" size="22" style="width:300px;" required>
          </div>
          <div id="empl_id">
            <label for="email">Number of Rooms<span>*</span></label>
            <select style="height: 40px; width:200px" name="no_rooms" required>
				<option value="">No. of Rooms</option>
				<% for(int i=1; i<=10; i++) { %>
				<option value="<%=i%>"><%=i%> Room</option>
				<% } %>
            </select>
          </div>
          <div id="empl_id">
            <label for="email">No of Adult<span>*</span></label>
            <select style="height: 40px; width:200px" name="no_adults" required>
				<option value="">No. of Adults</option>
				<% for(int i=1; i<=10; i++) { %>
				<option value="<%=i%>"><%=i%> Adult</option>
				<% } %>
            </select>
          </div>
          <div id="empl_id">
            <label for="email">No of Childs<span>*</span></label>
            <select style="height: 40px; width:200px" name="no_child" required>
				<option value="">No. of Childs</option>
				<% for(int i=1; i<=10; i++) { %>
				<option value="<%=i%>"><%=i%> Child</option>
				<% } %>
            </select>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Search Room">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="search_hotel" />
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
