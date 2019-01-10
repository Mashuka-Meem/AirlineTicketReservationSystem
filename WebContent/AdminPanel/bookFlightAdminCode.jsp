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


</body>
</html>


<?php 
session_start();
include '../header/headerAdmin.php';
include '../connection.php';
$planeName = $_POST["planeName"];
$fromLoc = $_POST["fromLoc"];
$toLoc = $_POST["toLoc"];
$depDate = str_replace('/', '-', $_POST["depart_date"]);
$depTime = str_replace('/', '-', $_POST["depart_time"]);
$totalSeat;
$scid;
$seatamnt = $_POST["seatamnt"];
$seatamntA = $_POST["seatamntA"];
$totalAmnt = $seatamnt + $seatamntA;
if(isset($_POST["return_date"]) && isset($_POST["return_time"])){
	$retDate = str_replace('/', '-', $_POST["return_date"]);
	$retTime = str_replace('/', '-', $_POST["return_time"]);
	$sql="SELECT * FROM `sas`.`schedule` WHERE `depDate` = '$depDate' AND `retDate` = '$retDate' AND `fromLoc` = '$fromLoc' AND `toLoc` = '$toLoc' AND `seat` >= '$totalAmnt' ORDER BY `id`";
                    $result=  mysqli_query($conn, $sql);
                    if(mysqli_num_rows($result)>0){
                        while ($row=mysqli_fetch_assoc($result)){
                        	$totalSeat = $row['seat'];
                        	$scid = $row['id'];
                            echo $totalSeat;
                        }
                    }else{
                    	$location = "Location: ../adminpage.php?msg=No Seat Available";
                        header($location);
                    }
}
else if(!isset($_POST["return_date"]) && !isset($_POST["return_time"])){
	$sql="SELECT * FROM `sas`.`schedule` WHERE `depDate` = '$depDate' AND `fromLoc` = '$fromLoc' AND `toLoc` = '$toLoc' AND `seat` >= '$totalAmnt'  ORDER BY `id`";
                    $result=  mysqli_query($conn, $sql);
                    if(mysqli_num_rows($result)>0){
                        while ($row=mysqli_fetch_assoc($result)){
                        	$totalSeat = $row['seat'];
                        	$scid = $row['id'];
                        }
                    }else{
                    	$location = "Location: ../adminpage.php?msg=No Seat Available";
                        header($location);
                    }
}else{
    $location = "Location: ../adminpage.php?msg=Error";
                        header($location);
}

$fname = $_POST["first_name"];
$lname = $_POST["last_name"];
$email = $_POST["email"];
$number = $_POST["number"];
$adminname = $_SESSION['adminname']; 

$pnr = $scid.$_POST["planeName"].$totalSeat.strrev($seatamnt).$seatamnt.strrev($totalSeat);

$amount = ($seatamnt*2000)+($seatamntA*1000);
$sql = "INSERT INTO `flight` (`flightNumber`, `fname`, `lname`, `phone`, `email`, `dest`, `depart`, `depDate`, `depTime`, `retTime`, `retDate`, `amount`, `pnr`, `accept`, `user`) VALUES ('$planeName', '$fname', '$lname', '$number', '$email', '$toLoc', '$fromLoc', '$depDate', '$depTime', '$retTime', '$retDate', '$amount', '$pnr', '1', '$adminname');";
$qry = mysqli_query($conn, $sql);
if ($qry) {
}else{
    echo "<h1>Error In Database Try Again</h1>";
    die();
}

if($totalSeat>=$seatamnt){
    $remseat  = $totalSeat - $seatamnt;
    $sql="UPDATE `schedule` SET `seat` = '$remseat' WHERE `schedule`.`id` = '$scid';";
                    $result=  mysqli_query($conn, $sql);
                    if($result){
                        $location = "Location: ../bookFlightAdmin.php?confirm=Ticket Is Waiting For Confirmation&pnr=".$pnr;
                       header($location);
                    }else{
                        echo mysql_error();
                    }
}

?>
