package bean;

import java.sql.Time;
import java.util.Date;

public class Flight {
	private int id;
	private String flightNumber;
	private int from;
	private int to;
	private Date depDate;
	private Time depTime;
	private Date retDate;
	private Time retTime;
	private int totalSeat;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	public java.sql.Date getDepDate() {
		java.sql.Date sqlDate = new java.sql.Date(depDate.getTime());
		return sqlDate;
	}
	public void setDepDate(Date depDate) {
		this.depDate = depDate;
	}
	public Time getDepTime() {
		return depTime;
	}
	public void setDepTime(Time depTime) {
		this.depTime = depTime;
	}
	public java.sql.Date getRetDate() {
		java.sql.Date sqlDate1 = new java.sql.Date(retDate.getTime());
		return sqlDate1;
	}
	public void setRetDate(Date retDate) {
		this.retDate = retDate;
	}
	public Time getRetTime() {
		return retTime;
	}
	public void setRetTime(Time retTime) {
		this.retTime = retTime;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}
}
