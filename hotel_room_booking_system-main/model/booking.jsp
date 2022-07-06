<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
	Book bookingObj = new Book();
	HashMap results = new HashMap();
	String room_facility_id = "";
	Date date = new Date();
	results.put("book_room_id",session.getAttribute("room_id"));
	results.put("book_date",date.toString());
	results.put("book_user_id",session.getAttribute("customer_id"));
	results.put("book_from_date",session.getAttribute("from_date"));
	results.put("book_to_date",session.getAttribute("to_date"));
	results.put("book_no_rooms",session.getAttribute("no_rooms"));
	results.put("book_no_persons",session.getAttribute("no_adults"));
	results.put("book_no_childs",session.getAttribute("no_child"));
	results.put("book_name",session.getAttribute("customer_name"));
	results.put("book_mobile",session.getAttribute("customer_mobile"));
	results.put("book_email",session.getAttribute("customer_email"));
	results.put("book_total_amount",session.getAttribute("login_id"));
	
	out.print(bookingObj.saveBook(results));	
	session.setAttribute("room_id",null);
	response.sendRedirect("../booking-receipt.jsp?msg=You have successfully booked your room !!!!");
%>
