package dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Users;

import java.sql.Connection;

public class UserDao {
	/*connection function*/
	public static Connection connectMe() { 
		Connection conn = null;
		try {
//loading driver and connecting to database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/com.moshfiqrony", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
//returning the connection
		return conn;
	}
	
	/*insert function*/
	
	public static int insertMe(Users obj) {
		int status = 0;
		Connection conn = UserDao.connectMe();
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO `registration`(`fname`, `lname`, `passport`, `phn`, `uname`, `email`, `pass`, `dob`, `power`) VALUES (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, obj.getFname());
			ps.setString(2, obj.getLname());
			ps.setString(3, obj.getPassport());
			ps.setString(4, obj.getPhn());
			ps.setString(5, obj.getUname());
			ps.setString(6, obj.getEmail());
			ps.setString(7, obj.getPass());
			ps.setDate(8, obj.getDob());
			ps.setString(9, "0");
			status = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		
		return status;
	}
//	login authentication
	public static int loginMe(String uname, String pass) {
		int status = 0;
		Connection conn = UserDao.connectMe();
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `registration` WHERE `uname`=? AND `pass`=? AND power = ?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ps.setString(3, "0");
			ResultSet rs = ps.executeQuery();
			if(!rs.next()) {
				status = 0;
			}else {
				status = 1;
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return status;
	}
	
//	login authentication
	public static int loginMeAdmin(String uname, String pass) {
		int status = 0;
		Connection conn = UserDao.connectMe();
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `registration` WHERE `uname`=? AND `pass`=? AND `power` = ?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ps.setString(3, "1");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				status = 1;
			}else {
				status = 0;
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int updateUser(Users obj){  
	    int status=0;  
	    try{  
			Connection con = UserDao.connectMe();  
	        PreparedStatement ps=con.prepareStatement(  
	"update registration set fname=?,lname=?,passport=?,phn=?,email=?,pass=?,dob=?,power=? where uname=?");  
	        ps.setString(1, obj.getFname());
			ps.setString(2, obj.getLname());
			ps.setString(3, obj.getPassport());
			ps.setString(4, obj.getPhn());
			
			ps.setString(5, obj.getEmail());
			ps.setString(6, obj.getPass());
			ps.setDate(7, obj.getDob());
			ps.setString(8, "0");  
			ps.setString(9, obj.getUname());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	
	public static Users getUserRecordById(int id){  
	    Users u=null;  
	    try{  
	    	Connection con = UserDao.connectMe();   
	        PreparedStatement ps=con.prepareStatement("select * from registration where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new Users();  
	            u.setId(rs.getInt("id"));  
	            u.setFname(rs.getString("fname"));  
	            u.setLname(rs.getString("lname"));  
	            u.setPassport(rs.getString("passport"));  
	            u.setPhn(rs.getString("phn"));  
	            u.setUname(rs.getString("uname"));  
	            u.setEmail(rs.getString("email"));  
	            u.setPass(rs.getString("pass"));
	            u.setDob(rs.getDate("dob"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}
	
	public static int deleteUser(Users u){  
	    int status=0;  
	    try{  
	    	Connection con = UserDao.connectMe();  
	        PreparedStatement ps=con.prepareStatement("delete from registration where id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	
	
	
	
	

}
