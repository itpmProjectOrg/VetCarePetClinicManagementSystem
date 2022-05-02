package com.petprofile.modules;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import com.utilities.DBConnect;

public class PetDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	
    
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
}
