package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter write = response.getWriter();
		response.setContentType("text/html");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("password");
		String power = request.getParameter("Make");
		int status = 0;
		if(power.compareTo("b")==0) {
			write.println(status);
			status = UserDao.loginMe(uname, pass);
			write.println(status);
			if(status == 0) {
				response.sendRedirect("Login/login.jsp");
			}else if(status == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("user", uname);
				response.sendRedirect("UserPanel/index.jsp");
			}
		}else if(power.compareTo("a")==0) {
			write.println(status);
			status = UserDao.loginMeAdmin(uname, pass);
			write.println(status);
			if(status == 0) {
				response.sendRedirect("Login/login.jsp");
			}else if(status == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", uname);
				response.sendRedirect("AdminPanel/index.jsp");
			}
		}
	}

}
