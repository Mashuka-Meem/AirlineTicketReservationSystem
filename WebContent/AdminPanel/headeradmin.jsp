<%
if(session.getAttribute("admin")==null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "../Login/login.jsp?msg=Login First.");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/headercss.css">
</head>
<body>
<ul class="menu cf">
  <li><a href="index.jsp">Home</a></li>
  <li>
    <a href="">Flights</a>
    <ul class="submenu">
      <li><a href="flightAdmin.jsp">Search Flights</a></li>
      <li><a href="scheduleFlight.jsp">Schedule Flights</a></li>
      <li><a href="showSchedule.jsp">Show Schedule</a></li>
    </ul>     
  </li>
  <li><a href="airlines.jsp">Airlines</a></li>
  <li><a href="userList.jsp">Users</a></li>
  <li>
    <a href="confirmationAdmin.php">Confirmation</a>    
  </li>
  <li><a href="logout.jsp">Sign Out <%=session.getAttribute("admin") %></a></li>
</ul>
<%
if(request.getParameter("msg") != null){
	%>
	<center><h1 style="color: white;"><%= request.getParameter("msg") %></h1></center>
<%
}
%>

</body>
</html>