package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import bean.Flight;
import bean.Users;

public class FlightDao {
	
	public static Connection connectMe() { 
		Connection conn = null;
		try {
//loading driver and connecting to database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/com.moshfiqrony", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
//returning the connection
		return conn;
	}
	
	public static int insertMe(Flight obj) {
		int status = 0;
		Connection conn = FlightDao.connectMe();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into schedule(planeName, fromLoc, toLoc, depDate, depTime, retDate, retTime, seat) values (?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, obj.getFlightNumber());
			ps.setInt(2, obj.getFrom());
			ps.setInt(3, obj.getTo());
			ps.setDate(4, obj.getDepDate());
			ps.setTime(5, obj.getDepTime());
			ps.setDate(6, obj.getRetDate());
			ps.setTime(7, obj.getRetTime());
			ps.setInt(8, obj.getTotalSeat());
			status = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static Flight getFlightRecordById(int fromLoc, int toLoc, String depDate, String retDate){  
		Flight f=null;  
		
	    try{  
	    	Connection con = FlightDao.connectMe();   
	        PreparedStatement ps=con.prepareStatement("select * from schedule where fromLoc=? AND toLoc=? AND depDate=? AND retDate=?");  
	        ps.setInt(1,fromLoc);  
	        ps.setInt(2,toLoc); 
	        ps.setString(3, depDate);          
	        ps.setString(4, retDate); 
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            f=new Flight();  
	            f.setId(rs.getInt("id"));  
	            f.setFlightNumber(rs.getString("planeName"));  
	            f.setFrom(rs.getInt("fromLoc"));  
	            f.setTo(rs.getInt("toLoc"));  
	            f.setDepDate(rs.getDate("depDate"));  
	            f.setDepTime(rs.getTime("depTime"));  
	            f.setRetDate(rs.getDate("retDate"));  
	            f.setRetTime(rs.getTime("retTime"));
	            f.setTotalSeat(rs.getInt("seat")); 
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return f;  
	}
	
	public static Flight getFlightRecordById1(int fromLoc, int toLoc, String depDate){  
		Flight f=null;  
		
	    try{  
	    	Connection con = FlightDao.connectMe();   
	        PreparedStatement ps=con.prepareStatement("select * from schedule where fromLoc=? AND toLoc=? AND depDate=?");  
	        ps.setInt(1,fromLoc);  
	        ps.setInt(2,toLoc); 
	        ps.setString(3, depDate);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            f=new Flight();  
	            f.setId(rs.getInt("id"));  
	            f.setFlightNumber(rs.getString("planeName"));  
	            f.setFrom(rs.getInt("fromLoc"));  
	            f.setTo(rs.getInt("toLoc"));  
	            f.setDepDate(rs.getDate("depDate"));  
	            f.setDepTime(rs.getTime("depTime"));  
	            f.setRetDate(rs.getDate("retDate"));  
	            f.setRetTime(rs.getTime("retTime"));
	            f.setTotalSeat(rs.getInt("seat")); 
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return f;  
	}
	
	public static int delete(int id){  
	    int status=0;  
	    try{  
	        Connection conn = connectMe();  
	        PreparedStatement ps=conn.prepareStatement("delete from schedule where id=?");  
	        ps.setInt(1,id);  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
}
