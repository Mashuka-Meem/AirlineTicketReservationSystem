<% if(session.getAttribute("admin") != null )
{  
  session.invalidate();
  response.sendRedirect("../Login/login.jsp?msg=You Are Logged Out");
}

%>