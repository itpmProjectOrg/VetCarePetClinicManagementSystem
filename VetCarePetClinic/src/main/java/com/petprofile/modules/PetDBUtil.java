package com.petprofile.modules;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.utilities.DBConnect;

public class PetDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	
    //insert
    public static boolean insertPet(int ownerID,String name, String petType, String breed, String sex, String dob, String date) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnect.getDBConnection();
    		
    		String query = "insert into pet values (?,?,?,?,?,?,?,?)";
    		
    		PreparedStatement ps = con.prepareStatement(query);
    		ps.setInt(1, 0);
			ps.setInt(2,ownerID);
			ps.setString(3, name);
			ps.setString(4, petType);
			ps.setString(5, breed);
			ps.setString(6, sex);
			ps.setString(7, dob);
			ps.setString(8, date);
			
			int rs = ps.executeUpdate(); //return no of roles which affected
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			ps.close();
			con.close();
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    		System.out.println("error while inserting pet");
    	}
 	
    	return isSuccess;
    }
    
    
  //update
	 public static boolean updatePet(String id,String iD, String name, String petType, String breed, String sex, String dob, String date) {
	    	
	    	try {
	    		
	    		con = DBConnect.getDBConnection();
	    		stmt = con.createStatement();
	    		String sql = "update pet set ownerID='"+iD+"',name='"+name+"',petType='"+petType+"',breed='"+breed+"',sex='"+sex+"',dob='"+dob+"',date='"+date+"'"
	    		+ "where petID='"+id+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	}
	 
	 
	 public static List<Pet> getPetDetails(String Id) {
	    	
	    	int convertedID = Integer.parseInt(Id);
	    	
	    	ArrayList<Pet> pat = new ArrayList<>();
	    	
	    	try {
	    		
	    		con = DBConnect.getDBConnection();
	    		stmt = con.createStatement();
	    		String sql = "select * from pet where petID='"+convertedID+"'";
	    		rs = stmt.executeQuery(sql);
	    		
	    		while(rs.next()) {
	    			int id = rs.getInt(1);
	    			int ownerID = rs.getInt(2);
	    			String name = rs.getString(3);
	    			String petType = rs.getString(4);
	    			String breed = rs.getString(5);
	    			String sex = rs.getString(6);
	    			String dob = rs.getString(7);
	    			String date = rs.getString(8);
	    			
	    			
	    			Pet c = new Pet(id,ownerID,name,petType,breed,sex,dob,date);
	    			pat.add(c);
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}	
	    	return pat;	
	    }
	 	 
	 //delete
	 public static boolean deletePet(String id) {
	    	
	    	int convId = Integer.parseInt(id);
	    	
	    	try {
	    		
	    		con = DBConnect.getDBConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from pet where petID='"+convId+"'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if (r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	    
	 public static ArrayList<Pet> getAllInventory1() {
			ArrayList<Pet> invent = new ArrayList<Pet>();
			
			try {
				//database connection
				 String url ="jdbc:mysql://localhost:3306/vetcaredb"; //my sql location
				 String user ="rame123";
			     String pass = "rootpwd";
			     
			     Class.forName("com.mysql.jdbc.Driver");//create driver
					Connection con = DriverManager.getConnection(url , user , pass);// create db connections
					java.sql.Statement stmt = con.createStatement();
					
					String sql = "select * from vetcaredb.pet;";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()) {  //variables for catch the values
						
						int id = rs.getInt(1);
						int ownerID = rs.getInt(2);
						String name = rs.getString(3);
						String petType=rs.getString(4);
						String breed = rs.getString(5);
						String sex = rs.getString(6);
						String dob = rs.getString(7);
						String date = rs.getString(8);
						
					
					
						
						Pet pat= new Pet(id,ownerID,name,petType,breed,sex,dob,date);// petowner object
						
						
						invent.add(pat); //pet owner ArrayList
					
					}
			     
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return invent;
		}
	
	
}




