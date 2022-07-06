<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<style>
table {
	margin-bottom:0px;
}
#comments input, #comments textarea {
	padding:5px;
}
.my_button {
	cursor: pointer;
    display: inline-block;
    margin: 0;
    padding: 4px 5px;
    width: auto;
	background-color: #043d9b;
    color: #ffffff;
    font-weight: bold;
}
.email {
	font-weight:bold;
}
</style>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Booking Receipt</h2>
        <form action="model/booking.jsp" method="post">
		 <table>
              <tr>
                  <th>From Date</th>
                  <td><%=session.getAttribute("to_date")%></td>
              </tr>
              <tr>
                  <th>To Date</th>
                  <td><%=session.getAttribute("from_date")%></td>
              </tr>
              <tr>
                  <th>No. Of Rooms</th>
                  <td><%=session.getAttribute("no_rooms")%> Rooms</td>
              </tr>
              <tr>
                  <th>No. Of Adults</th>
                  <td><%=session.getAttribute("no_adults")%> Adults</td>
              </tr>
              <tr>
                  <th>No. Of Childs</th>
                  <td><%=session.getAttribute("no_child")%> Childs</td>
              </tr>
              <tr>
                  <th>Name</th>
                  <td><%=session.getAttribute("customer_name")%></td>
              </tr>
              <tr>
                  <th>Mobile</th>
                  <td><%=session.getAttribute("customer_mobile")%></td>
              </tr>
              <tr>
                  <th>Email</th>
                  <td><%=session.getAttribute("customer_email")%></td>
              </tr>
              <tr>
				<td colspan="2" style="background-color:#ffffff; text-align:center">
					 <input name="print" type="button" value="Print Ticket" onclick="window.print()" style="width:200px; background-color: #4d0b0d; color: #ffffff; font-weight:bold">
				</td>
              </tr>
          </table>
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
<!-- Add More HTML Block -->
<div id = "add_more_fields" style="display:none">
	<table>
		<tr style="background-color:#ffffff">
			<td><input type="text" name="passengar_name" required></td>
			<td><input type="text" name="passengar_gender" required></td>
			<td><input type="text" name="passengar_age"></td>
			<td style="width:100px; text-align:center; vertical-align:middle; font-weight:bold; font-size:11px;"><a href="#" class="remove_field">Remove</a></td>
		</tr>
	</table>
</div>
<%@ include file="includes/footer.jsp" %>
