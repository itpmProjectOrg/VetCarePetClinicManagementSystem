package com.appointment.modules;

public class AppointmentReport {
	
	private String fromDate;
	private String toDate;
	private String vetName;
	private int totalAppointments;
	private int pendingAppointmentCount;
	private double pendingAppointmentAvg;
	private int completedAppointmentCount;
	private double completedAppointmentAvg;
	private double totalIncome;
	
	public AppointmentReport(String fromDate, String toDate, String vetName, int totalAppointments,
			int pendingAppointmentCount, double pendingAppointmentAvg, int completedAppointmentCount,
			double completedAppointmentAvg, double totalIncome) {
		
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.vetName = vetName;
		this.totalAppointments = totalAppointments;
		this.pendingAppointmentCount = pendingAppointmentCount;
		this.pendingAppointmentAvg = pendingAppointmentAvg;
		this.completedAppointmentCount = completedAppointmentCount;
		this.completedAppointmentAvg = completedAppointmentAvg;
		this.totalIncome = totalIncome;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getVetName() {
		return vetName;
	}

	public void setVetName(String vetName) {
		this.vetName = vetName;
	}

	public int getTotalAppointments() {
		return totalAppointments;
	}

	public void setTotalAppointments(int totalAppointments) {
		this.totalAppointments = totalAppointments;
	}

	public int getPendingAppointmentCount() {
		return pendingAppointmentCount;
	}

	public void setPendingAppointmentCount(int pendingAppointmentCount) {
		this.pendingAppointmentCount = pendingAppointmentCount;
	}

	public double getPendingAppointmentAvg() {
		return pendingAppointmentAvg;
	}

	public void setPendingAppointmentAvg(double pendingAppointmentAvg) {
		this.pendingAppointmentAvg = pendingAppointmentAvg;
	}

	public int getCompletedAppointmentCount() {
		return completedAppointmentCount;
	}

	public void setCompletedAppointmentCount(int completedAppointmentCount) {
		this.completedAppointmentCount = completedAppointmentCount;
	}

	public double getCompletedAppointmentAvg() {
		return completedAppointmentAvg;
	}

	public void setCompletedAppointmentAvg(double completedAppointmentAvg) {
		this.completedAppointmentAvg = completedAppointmentAvg;
	}

	public double getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	
	
	

}
