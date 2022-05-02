package com.appointment.modules;

import com.utilities.*;
import java.util.*;
import java.sql.*;
import java.text.DecimalFormat;
import java.time.LocalTime;

public class AppointmentDBUtil {
	private static Connection con;
	
	//get vetSurgeon names for the selection
	public static ArrayList<String> getVetSurgeonNames(){
		ArrayList<String> appointVetSurgeons = new ArrayList<String>();
		String query = " select name from veterinarian ";
		
		try {
			con = DBConnect.getDBConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				
				String vetName = rs.getString(1);
				appointVetSurgeons.add(vetName);
			}
			
			st.close();
			con.close();

		} catch (Exception e) {	
			e.printStackTrace();
			System.out.println("Error while get Vet Surgeons' names for the selection");
		}
		
		return appointVetSurgeons;
	}
	
	//generate appointment no for specific doctor for specific date
	public static int getAppointmentNo(String vetName, String aDate) {
		int aNo = 0;
		String query = "select max(appointmentNo) from appointment where veterinarian = ? and aDate = ?";
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, vetName);
			ps.setString(2, aDate);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				aNo = rs.getInt(1);
				//System.out.println(aNo);
			}
			
			if(aNo == 0) {
				aNo = 1;
			}
			else {
				if(aNo < 50) {
					aNo += 1;
				}
				else {
					aNo = 0;
				}
			}
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while get Appointment No");
		}
		
		return aNo;
	}
	
	//add new appointment
	public static boolean insertAppointment(int ownerID,String vetName,String aDate,String aTime,double aPayment,String aStatus, int aNo) {
		boolean isInsert = false;
		String query = "insert into appointment values(?,?,?,?,?,?,?,?)";
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, ownerID);
			ps.setString(3, aDate);
			ps.setString(4, aTime);
			ps.setDouble(5, aPayment);
			ps.setString(6, aStatus);
			ps.setInt(7,aNo);
			ps.setString(8, vetName);
			
			int noRows = ps.executeUpdate();
			
			if(noRows > 0)
				isInsert = true;
			
			ps.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("Error while inserting");
		}
		
		return isInsert;
	}

	//search with appointment no
	public static ArrayList<Appointment> searchAppointmentWithNo(String aDate, String vetName, int aNo){
		
		ArrayList<Appointment> al = new ArrayList<Appointment>();
		String query = "select a.id, a.ownerID, p.name, a.aDate, a.aTime,a.payment,a.paymentStatus,a.appointmentNo,a.veterinarian"
				+ " from appointment a ,petOwner p"
				+ " where a.ownerID = p. ownerID and a.aDate = ? and a.veterinarian = ? and a.appointmentNo = ?";
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, aDate);
			ps.setString(2, vetName);
			ps.setInt(3, aNo);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				int oID = rs.getInt(2);
				String oName = rs.getString(3);
				String date = rs.getString(4);
				String time = rs.getString(5);
				double payment = rs.getDouble(6);
				String status = rs.getString(7);
				int apNo = rs.getInt(8);
				String vet = rs.getString(9);
				
				Appointment apObj = new Appointment(id,oID,oName,vet,date,time,payment,status,apNo);
				al.add(apObj);
				
			}
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while searching appointment details with appointment No");
		}
		return al;
	}
	
	//search without appointment no
	public static ArrayList<Appointment> searchAppointmentWithoutNo(String aDate, String vetName){
		
		ArrayList<Appointment> al = new ArrayList<Appointment>();
		String query = "select a.id, a.ownerID, p.name, a.aDate, a.aTime,a.payment,a.paymentStatus,a.appointmentNo,a.veterinarian"
				+ " from appointment a ,petOwner p"
				+ " where a.ownerID = p. ownerID and a.aDate = ? and a.veterinarian = ?";
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, aDate);
			ps.setString(2, vetName);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				int oID = rs.getInt(2);
				String oName = rs.getString(3);
				String date = rs.getString(4);
				String time = rs.getString(5);
				double payment = rs.getDouble(6);
				String status = rs.getString(7);
				int apNo = rs.getInt(8);
				String vet = rs.getString(9);
				
				Appointment apObj = new Appointment(id,oID,oName,vet,date,time,payment,status,apNo);
				al.add(apObj);
				
			}
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while searching appointment details without appointment No");
		}
		return al;
	}
	
	//delete appointment with specific appointment id
	public static boolean deleteAppointment(int appointID) {
		
		boolean isDeleted = false;
		String query = "delete from appointment where id = ?";
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, appointID);
			int noRows = ps.executeUpdate();
			
			if(noRows > 0) {
				isDeleted = true;
			}
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while delete appointment details");
		}
		
		return isDeleted;
	}
	
	//get appointment details for update
	public static Appointment getAppointmentDetails(int id) {
		
		String query = "select * from appointment where id = ?";
		Appointment appObj = null;
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {	
				int aid = rs.getInt(1);
				int oID = rs.getInt(2);
				String date = rs.getString(3);
				String time = rs.getString(4);
				double payment = rs.getDouble(5);
				String status = rs.getString(6);
				int apNo = rs.getInt(7);
				String vet = rs.getString(8);
				
				appObj = new Appointment(aid,oID,vet,date,time,payment,status,apNo);	
			}
			ps.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while getting appointment details for update");
		}
		
		return appObj;
		
	}
	
	//get payment status array list
	public static ArrayList<String> getStatus(){
		
		ArrayList<String> al = new ArrayList<String>();
		al.add("pending");
		al.add("completed");
		
		return al;
	}
	
	//update appointment
	public static boolean updateAppointment(double payment,String status,int appID) {
		
		boolean isUpdate = false;
		String query = "update appointment set payment = ? , paymentStatus = ? where id = ?";
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setDouble(1, payment);
			ps.setString(2, status);
			ps.setInt(3, appID);
			
			int noRows = ps.executeUpdate();
			if(noRows > 0) {
				isUpdate = true;
			}
			
			ps.close();
			con.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while updating appointment");
		}
		
		return isUpdate;
	}
	
	//check appointment time is valid for specific day for specific doctor
	public static boolean isAppointmentTimeValid(String vetName, String date, String time) {

		String query = "select startTime, endTime from availability where veterinarian = ? and availableDate = ?";
		
		LocalTime sTime = null;
		LocalTime eTime = null;
		LocalTime aTime = LocalTime.parse(time);
		boolean isValid = false;
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, vetName);
			ps.setString(2,date);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String startTime = rs.getString(1);
				String endTime = rs.getString(2);
				sTime = LocalTime.parse(startTime);
				eTime = LocalTime.parse(endTime);
				
				//compare appointment time is in between stime and endtime
				if(aTime.isAfter(sTime) && aTime.isBefore(eTime)) {
					isValid = true;
					break;
				}
			}
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error while validating appointment time");
		}
		
		return isValid;
	}
	
	//check appointment with same pet owner,doctor, date and time
	public static boolean isAppointmentValid(int ownerID, String vetName, String date, String time ) {
		boolean isValid = false;
		String query = "select * from appointment where ownerID = ? and veterinarian = ? and aDate = ? and aTime = ?";
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, ownerID);
			ps.setString(2, vetName);
			ps.setString(3, date);
			ps.setString(4, time);
			
			ResultSet rs = ps.executeQuery();
			if(!rs.next()) {
				isValid = true;
			}
			
			ps.close();
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("Error while validation of appointment");
		}
		return isValid;
		
	}
	
	//generate appointment summary report
	public static AppointmentReport generateAppointSummaryReport(String fromDate,String toDate, String vetName) {
		AppointmentReport aReport = null;
		List<Appointment> appointList = new ArrayList<>();
		String query = "select * from appointment where veterinarian = ? and aDate between ? and ? ";
		int totalAppointCount = 0;
		int pendingCount = 0;
		int completedCount = 0;
		double pendingAvg = 0.0;
		double completedAvg = 0.0;
		double totalIncome = 0.0;
		
		try {
			con = DBConnect.getDBConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, vetName);
			ps.setString(2, fromDate);
			ps.setString(3, toDate);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int aid = rs.getInt(1);
				int oID = rs.getInt(2);
				String date = rs.getString(3);
				String time = rs.getString(4);
				double payment = rs.getDouble(5);
				String status = rs.getString(6);
				int apNo = rs.getInt(7);
				String vet = rs.getString(8);
				
				Appointment apointObj = new Appointment(aid,oID,vet,date,time,payment,status,apNo);
				appointList.add(apointObj);
			}
			ps.close();
			con.close();
			
			if(appointList.isEmpty()) {
				return null;
			}
			
			//calculations for the report
			totalAppointCount = appointList.size();
			pendingCount = calPendingAppointCount(appointList);
			pendingAvg = calPendingAppointAvg(appointList);
			completedCount = calCompletedAppointCount(appointList);
			completedAvg = calCompletedAppointAvg(appointList);
			totalIncome = calCompletedAppointTotalIncome(appointList);
			
			//create appointment report
			aReport = new AppointmentReport(fromDate, toDate, vetName, totalAppointCount, pendingCount, pendingAvg, completedCount, completedAvg, totalIncome);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error while generating summary report");
		}
		
		return aReport;
	}
	
	//get payment status pending appointment count
	public static int calPendingAppointCount(List<Appointment> appointList) {
		int pendingCount = 0;
		
		if(appointList.isEmpty()) {
			return pendingCount;
		}
		
		for( Appointment a : appointList) {
			if(a.getStatus().equals("pending")) {
				pendingCount = pendingCount + 1;
			}	
		}
		return pendingCount;
	}
	
	//get payment status pending appointment average
	public static double calPendingAppointAvg(List<Appointment> appointList) {
		double pendingAvg = 0.0;
		DecimalFormat df = new DecimalFormat("0.00");
		int pendingCount = 0;
		int totalAppoints = 0;
		
		if(appointList.isEmpty()) {
			return pendingAvg;
		}
		
		pendingCount = calPendingAppointCount(appointList);
		totalAppoints = appointList.size();
		
		//calculate average
		pendingAvg = pendingCount * 100.0 /totalAppoints;
		
		//convert average to three decimal places
		return Double.parseDouble(df.format(pendingAvg));
		
	}
	
	//get payment status completed appointment count
	public static int calCompletedAppointCount(List<Appointment> appointList) {
		int completedCount = 0;
		
		if(appointList.isEmpty()) {
			return completedCount;
		}
		
		for( Appointment a : appointList) {
			if(a.getStatus().equals("completed")) {
				completedCount = completedCount + 1;
			}	
		}
		return completedCount;
	}
	
	//get payment status completed appointment average
	public static double calCompletedAppointAvg(List<Appointment> appointList) {
		double completedAvg = 0.0;
		int completedCount = 0;
		int totalAppoints = 0;
		DecimalFormat df = new DecimalFormat("0.00");
		
		if(appointList.isEmpty()) {
			return completedAvg;
		}
		
		completedCount = calCompletedAppointCount(appointList);
		totalAppoints = appointList.size();
		
		//calculate average
		completedAvg = completedCount * 100.0 /totalAppoints;
		
		return Double.parseDouble(df.format(completedAvg));
	}
	
	//get payment status completed appointment total income
	public static double calCompletedAppointTotalIncome(List<Appointment> appointList) {
		double totalIncome = 0.0;
		
		if(appointList.isEmpty()) {
			return totalIncome;
		}
		
		//calculate total income
		for( Appointment a : appointList) {
			if(a.getStatus().equals("completed")) {
				totalIncome = totalIncome + a.getPayment();
			}	
		}
		
		return totalIncome;
	}
	

}
