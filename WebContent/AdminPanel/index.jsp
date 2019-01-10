<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<%@ include file="headeradmin.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="./css/headercss.css">
	<link rel="stylesheet" type="text/css" href="scss/letter.css">
  <style type="text/css">
    .mar{
      margin-top: 50px;

    }
    .wlcmAdmin{
    	color: white;
    	font-size: 30px;
    	text-align: center;
    	text-shadow: 0 0 8px black;
    }
    .datemar{
    	margin-top: -25px;
    }
    .wlcmdate{
    	color: white;
    	font-size: 20px;
    	text-align: center;
    	text-shadow: 0 0 8px black;
    }
    .wlcmtime{
    	color: white;
    	font-size: 15px;
    	text-align: center;
    	text-shadow: 0 0 8px black;
    }
        .nnn {
    display: block;
    color: #34495e;
    text-align: center;
    padding: 5px 5px;
    text-decoration: none;
    background-color: #F9F9FA;
    border: 1px solid;
    border-radius: 10px;

  </style>
</head>
<body style="background-color: #34495e;">
<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
  String date = sdf.format(new Date());
  String time = sdf2.format(new Date());
%>
<!-- welcome admin and show date time -->
<center><table>
	<tr>
		<td>
			<h3 class="wlcmAdmin">Hello Welcome to your <%= session.getAttribute("admin") %> panel</h3><br>
      <p class="wlcmdate datemar">Today is <%=date%> </p><br>
      <p class="wlcmtime datemar">Server Time <%=time%> </p><br>
		</td>
	</tr>
</table>
<table>
  <tr>
    <td><h2 style="color: Red">Notifications</h2></td>
  </tr>
<!-- Notification Here -->

  <tr>
    <td>
      <h1 style="color: white"> Tickets Are Waiting For Confirmation</h1>
    </td>
    <td>
      <a class="nnn" href="confirmationAdmin.php">Confirm Now</a>
    </td>
  </tr>


  <?php }?>

  </table></center>
</body>
</html>