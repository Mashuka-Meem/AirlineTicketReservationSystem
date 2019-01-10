


<%@ page language="java" import="dao.UserDao" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="u" class="bean.Users"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
		UserDao.deleteUser(u);
		response.sendRedirect("userList.jsp");
	%>

</body>
</html>