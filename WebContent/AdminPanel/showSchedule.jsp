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
<title>Schedule List</title>
	<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../css/form.css" type="text/css">
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
	}
	table td a{
		color: white;
	}
</style>
</head>
<body>

</body>
<center>
		<h1>Schedule List</h1>
		<table>
			<tr>
				<td>
					<label>Flight Number</label>
				</td>
				<td>
					<label>Departure Location</label>
				</td>
				<td>
					<label>Destination Location</label>
				</td>
				<td>
					<label>Departure Date</label>
				</td>
				<td>
					<label>Departure Time</label>
				</td>

				<td>
					<label>Return Date</label>
				</td>
				<td>
					<label>Return Time</label>
				</td>
				<td>
					<label>Seat</label>
				</td>
				<td>
					<label>Action</label>
				</td>
			</tr>
			<sql:query dataSource = "${snapshot}" var = "result">
			         SELECT `schedule`.`id`,`schedule`.`seat`,`schedule`.`fromLoc`, `schedule`.`toLoc`,`schedule`.`planeName`, concat(`location`.`Name`, '') as `l`, `schedule`.`depDate` , concat(`retlocation`.`Name`, '') AS `r`, `schedule`.`retDate`, `schedule`.`retTime`, `schedule`.`depTime` FROM `schedule` INNER JOIN `location` ON `schedule`.`fromLoc` = `location`.`id` INNER JOIN `retlocation` ON `schedule`.`toLoc` = `retlocation`.`id`;
			      </sql:query>
			      <c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.planeName}"/></td>
	               <td><c:out value = "${row.l}"/></td>
	               <td><c:out value = "${row.r}"/></td>
	               <td><c:out value = "${row.depDate}"/></td>
	               <td><c:out value = "${row.depTime}"/></td>
	               <td><c:out value = "${row.retDate}"/></td>
	               <td><c:out value = "${row.retTime}"/></td>
	               <td><c:out value = "${row.seat}"/></td>
	               <td><a href="deleteSchedule.jsp?id=<c:out value = "${row.id}"/>">Delete</a></td>
	            </tr>
	         </c:forEach>
		</table>
	</center>


<body></html>