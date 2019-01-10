<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="headeradmin.jsp" %>
<%@ include file="../conn.jsp" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
	<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="..css/form.css" type="text/css">
<style type="text/css">
	table{
		border: 1px solid white;
	}
	tr{
		border: 1px solid white;
	}
	td{
		border: 1px solid white;
		padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 15px;
        padding-right: 15px;
        color: white;
	}
	table td a{
		color: white;
	}
	label,h1{
		color: white;
	}
</style>
</head>
<body style="background-color: #34495e;">
<center>
		<h1>User List</h1>
		<table>
			<tr>
				<td>
					<label>First Name</label>
				</td>
				<td>
					<label>Last Name</label>
				</td>
				<td>
					<label>Passport No.</label>
				</td>
				<td>
					<label>Phone</label>
				</td>
				<td>
					<label>User Name</label>
				</td>
				<td>
					<label>Email</label>
				</td>
				<td>
					<label>Date Of Birth</label>
				</td>
				<td>
					<label>Pass</label>
				</td>
				<td>
					<label>Action</label>
				</td>
				<sql:query dataSource = "${snapshot}" var = "result">
			         SELECT * from registration WHERE power = '0';
			      </sql:query>
			      <c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.fname}"/></td>
	               <td><c:out value = "${row.lname}"/></td>
	               <td><c:out value = "${row.passport}"/></td>
	               <td><c:out value = "${row.phn}"/></td>
	               <td><c:out value = "${row.uname}"/></td>
	               <td><c:out value = "${row.email}"/></td>
	               <td><c:out value = "${row.dob}"/></td>
	               <td><c:out value = "${row.pass}"/></td>
	               <td><a href="userEdit.jsp?id=<c:out value = "${row.id}"/>">Edit/</a>
	               		<a href="userDelete.jsp?id=<c:out value = "${row.id}"/>"> Delete</a></td>
	            </tr>
	         </c:forEach>
		</table>
	</center>
</body>
</html>