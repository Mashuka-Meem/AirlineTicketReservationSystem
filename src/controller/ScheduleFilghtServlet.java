package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flight;
import dao.FlightDao;

/**
 * Servlet implementation class ScheduleFilght
 */
@WebServlet("/ScheduleFilght")
public class ScheduleFilghtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		
		
		Flight f = new Flight();
		
		f.setFlightNumber(request.getParameter("planeName"));
		f.setFrom(Integer.parseInt(request.getParameter("fromLoc")));
		f.setTo(Integer.parseInt(request.getParameter("toLoc")));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");	
		
		Date dtD = null;
		Date dtR = null;
		Date t1 = null;
		Date t2 = null;
		
		try {
			dtD = formatter.parse(request.getParameter("depart_date"));
			dtR = formatter.parse(request.getParameter("return_date"));
			t1 = formatter2.parse(request.getParameter("depart_time"));
			t2 = formatter2.parse(request.getParameter("return_time"));
		} catch (ParseException e) {
			writer.println(e.toString());
		}
		
		Time depT = new Time(t1.getTime());
		Time retTime = new Time(t2.getTime());
		
		f.setDepDate(dtD);
		f.setRetDate(dtR);
		f.setDepTime(depT);
		f.setRetTime(retTime);
		f.setTotalSeat(Integer.parseInt(request.getParameter("seat")));
		

		int status = FlightDao.insertMe(f);
		
		if(status > 0 ) {
			response.sendRedirect("AdminPanel/showSchedule.jsp?msg=Schedule Inserted");
		}else {
			response.sendRedirect("AdminPanel/scheduleFlight.jsp?msg=Problem To Setup Schedule Try Again");
		}
		writer.close();
	}

}
