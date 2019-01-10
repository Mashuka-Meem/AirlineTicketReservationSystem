<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="headeradmin.jsp" %>
<%@ include file="../conn.jsp" %>

<%@ page language="java" import="dao.FlightDao"%>
	
<%
int id = Integer.parseInt(request.getParameter("id")) ;
	int status = FlightDao.delete(id);
	if(status > 0 ) {
		response.sendRedirect("showSchedule.jsp?msg=Schedule Deleted");
	}else {
		response.sendRedirect("scheduleFlight.jsp?msg=Problem To Delete Schedule Try Again");
	}
%>