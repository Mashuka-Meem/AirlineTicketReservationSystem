package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Users;
import dao.UserDao;

@WebServlet("/RegistrationUser")
public class RegistrationUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		Users obj = new Users();
		obj.setFname(request.getParameter("fname"));
		obj.setLname(request.getParameter("lname"));
		obj.setPassport(request.getParameter("passport"));
		obj.setEmail(request.getParameter("email"));
		obj.setUname(request.getParameter("Uname"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = null;
		try {
			dt = formatter.parse(request.getParameter("dob"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		obj.setDob(dt);
		obj.setPhn(request.getParameter("PhnNmbr"));
		obj.setPass(request.getParameter("pass"));
		
		int status = UserDao.insertMe(obj);
		if(status > 0 ) {
			response.sendRedirect("Login/login.jsp?msg=Registration Successfull.Login Now");
		}else {
			response.sendRedirect("Login/registration.jsp?msg=Registration Unsuccessfull");
		}
		writer.close();
		
	}

}
