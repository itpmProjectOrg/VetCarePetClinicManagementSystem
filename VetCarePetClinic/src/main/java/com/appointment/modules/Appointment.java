package com.appointment.modules;

public class Appointment {
	private int appID;
	private int ownerID;
	private String ownerName;
	private String vetSurgeon;
	private String aDate;
	private String aTime;
	private double payment;
	private String status;
	private int aNo;
	
	public Appointment(int appID, int ownerID, String ownerName, String vetSurgeon, String aDate, String aTime, double payment,String status,int aNo) {
		
		this.appID = appID;
		this.ownerID = ownerID;
		this.ownerName = ownerName;
		this.vetSurgeon = vetSurgeon;
		this.aDate = aDate;
		this.aTime = aTime;
		this.payment = payment;
		this.status = status;
		this.aNo = aNo;
	}
	
	public Appointment(int appID, int ownerID, String vetSurgeon, String aDate, String aTime, double payment,String status,int aNo) {
		
		this.appID = appID;
		this.ownerID = ownerID;
		this.vetSurgeon = vetSurgeon;
		this.aDate = aDate;
		this.aTime = aTime;
		this.payment = payment;
		this.status = status;
		this.aNo = aNo;
	}
	
	public int getAppID() {
		return appID;
	}

	public void setAppID(int appID) {
		this.appID = appID;
	}

	public int getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}
	
	public String getOwnerName() {
		return ownerName;
	} 
	
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getVetSurgeon() {
		return vetSurgeon;
	}

	public void setVetSurgeon(String vetSurgeon) {
		this.vetSurgeon = vetSurgeon;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getaTime() {
		return aTime;
	}

	public void setaTime(String aTime) {
		this.aTime = aTime;
	}

	public double getPayment() {
		return payment;
	}

	public void setPayment(double payment) {
		this.payment = payment;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getaNo() {
		return aNo;
	}
	
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

}
