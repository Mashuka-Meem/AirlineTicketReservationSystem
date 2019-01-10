<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="../conn.jsp" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="headeradmin.jsp" %>

<%@page import="dao.FlightDao,bean.Flight"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight</title>
		<link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" href="../css/form.css" type="text/css">
<style type="text/css">
  label { width: 200px; float: left; margin: 0 20px 0 0; }
span { display: block; margin: 0 0 3px; font-size: 1.2em; font-weight: bold; }
input { width: 200px; border: 1px solid #000; padding: 5px; }
</style>
</head>
<body>



<% 
	String fromLoc = request.getParameter("fromLoc");
	String toLoc = request.getParameter("toLoc");
	String depDate = request.getParameter("depDate");
	String retDate = request.getParameter("retDate");		
	
	Flight f = FlightDao.getFlightRecordById(Integer.parseInt(fromLoc), Integer.parseInt(toLoc), depDate, retDate);		
%>	

<!-- Two Way Info -->

	<center>
<div style="margin-top: 25px;">

	
<center><h4>Your Round Trip Flight's Total </h4> <h1><td><%=f.getTotalSeat()%></td></h1> <h4> Seat Is Available</h4></center>
<center><h2>You Requested A Flight Of Following Information</h2></center>
<form action="bookFlightAdminCode.jsp" method="POST">
	<center><table>
		<tr>
			<td>Flight Number</td>
			<td><input type="text" name="planeName" value="<%=f.getFlightNumber()%>" readonly=""></td>
			
		</tr>
		<tr>
			<td>Departure Date</td>
			<td><input type="date" name="depart_date" value="<%=f.getDepDate()%>" readonly=""></td>
		</tr>
		<tr>
			<td>Departure Time</td>
			<td><input type="Time" name="depart_time" value="<%=f.getDepTime()%>" readonly=""></td>
		</tr>
		<tr>
			<td>Return Date</td>
			<td><input type="Date" name="return_date" value="<%=f.getRetDate()%>" readonly=""></td>
		</tr>
		<tr>
			<td>Return Time</td>
			<td><input type="Time" name="return_time" value="<%=f.getRetTime()%>" readonly=""></td>
		</tr>
		
		<tr>
			<td>Departure Location</td>
			<td><input type="text" name="fromLoc" value="<%=f.getFrom()%>" readonly=""></td>			
            <sql:query dataSource = "${snapshot}" var = "result">
            SELECT `location`.`name` as `l`, `location`.`id` as `i` FROM `com.moshfiqrony`.`schedule` INNER JOIN `location` ON `schedule`.fromLoc = `location`.`id` WHERE `depDate` = 'depDate' AND `fromLoc` = 'fromLoc' AND `toLoc` = 'toLoc';				
			</sql:query>
			<c:forEach var = "row" items = "${result.rows}">					         
			<td><select readonly name="fromLoc"><option value="<c:out value ="${row.i}"/>"><c:out value ="${row.l}"/></option></select></td>
			</c:forEach> 
		</tr>
		<tr>
			<td>Destination Location</td>
			<td><input type="text" name="toLoc" value="<%=f.getTo()%>" readonly=""></td>	
            <sql:query dataSource = "${snapshot}" var = "result">
            SELECT `retlocation`.`name` as `r`, `retlocation`.`id` as `ir` FROM `com.moshfiqrony`.`schedule` INNER JOIN `retlocation` ON `schedule`.toLoc = `retlocation`.`id` WHERE `retDate` = 'retDate' AND `fromLoc` = 'fromLoc' AND `toLoc` = 'toLoc';				
			</sql:query>
			<c:forEach var = "row" items = "${result.rows}">			         
			<td><select readonly name="toLoc"><option value="<c:out value ="${row.ir}"/>"><c:out value ="${row.r}"/></option></select></td>
			</c:forEach> 
		</tr>

	</table></center> 
</div>
</center>

<div class="body-content">
  <div class="module">
      <div class="alert alert-error"></div>
      <label>
        <span>First Name </span>
          <input type="text" placeholder="First Name" name="first_name" required  />
      </label>
      <label>
        <span>Last Name </span>
        <input type="text" placeholder="Last Name" name="last_name" required />
      </label>
      <span>Email </span>
        <input type="email" placeholder="Email" name="email" required />
      <span>Phone Number </span>
        <input type="number" placeholder="Phone Number" name="number" required /></br></br>
        <span>Amount Of Seat</span>
        <input type="text" id="seatamntA" placeholder="Seat Amount Child" name="seatamnt" required/>
        <input type="text" id="seatamnt" placeholder="Seat Amount Adult" name="seatamntA" required/></br></br>

      <input type="submit" id="book" value="Book" name="book" class="btn btn-block btn-primary" /></br>
      <span id="inf">Give Valid Input</span></br>
    </form></br></br>
  </div>
</div>

</body>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	  $(document).ready(function() {
  $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
  });

$(document).ready(function () {
	$("#inf").hide();
    $("#seatamnt").keyup(function(){
            if($(this).val() == 0 || $(this).val() < 0){
            	$("#book").hide();
            	$("#inf").show();

            } else{
            	$("#book").show();
            	$("#inf").hide();
            }
        });
});

$(document).ready(function () {
	$("#inf").hide();
    $("#seatamntA").keyup(function(){
            if($(this).val() < 0){
            	$("#book").hide();
            	$("#inf").show();

            } else{
            	$("#book").show();
            	$("#inf").hide();
            }
        });
});
</script>


</html>