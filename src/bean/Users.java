package bean;

import java.util.Date;

public class Users {
	private int id;
	
	private String fname;
	private String lname;
	private String uname;
	private String passport;
	private Date dob;
	private String phn;
	private String email;
	private String pass;

	
//	all getter setter methods
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String l) {
		this.passport = l;
	}
	public java.sql.Date getDob() {
		java.sql.Date sqlDate = new java.sql.Date(dob.getTime());
		return sqlDate;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getPhn() {
		return phn;
	}
	public void setPhn(String phn) {
		this.phn = phn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
