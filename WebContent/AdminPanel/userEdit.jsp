<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dao.UserDao,bean.Users"%>
    <%@ include file="headeradmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Information</title>
<link rel="stylesheet" type="text/css" href="../css/style1.css">
<style>
</style>
</head>
<body style="background-color: #34495e">

	<%
		String id = request.getParameter("id");
		Users u = UserDao.getUserRecordById(Integer.parseInt(id));
	%>
	
<div  class = "mainForm">
	<div class = "regHeader">
		<center><h1 style="color: white">Edit User Info Form</h1></center>
	</div>
	<div class = "regForm">
		<center>
		<h1 style="color: white;">User Name Cannot Be Changed</h1>
		<form action = "../EditUserServlet" method = "post">
		<table>
			<tr>
				<th>User Name</th>
				<td><input type = "text" name = "Uname" value="<%=u.getUname()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>First Name</th>
				<td><input type = "text" name = "fname" value="<%=u.getFname()%>"  required = ""></td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td><input type = "text" name = "lname" value="<%=u.getLname()%>"  required = ""></td>
			</tr>
			<tr>
				<th>Passport Number</th>
				<td><input type = "text" name = "passport" value="<%=u.getPassport()%>"  required = ""></td>
			</tr>
			<tr>
				<th>Date of Birth</th>
				<td><input type = "date" name = "dob" value="<%=u.getDob()%>"  required = ""></td>
			</tr>
			<tr>
				<th>Phone Number</th>
				<td><input type = "number" name = "PhnNmbr" value="<%=u.getPhn()%>" required = ""></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type = "email" name = "email" value="<%=u.getEmail()%>"  required = ""></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type = "password" name = "pass" value="<%=u.getPass()%>" required = ""></td>
			</tr>	
		</table>
		<input type = "submit" name = "submit" value = "Submit"> 
		</form>
		</center>
	</div>
</div>


</script>
</body>
</html>