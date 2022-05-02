package com.petprofile.modules;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.utilities.DBConnect;

public class PetOwnerDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs   = null;
	
	//insert data
		//parameters take the servlet data values
		public static boolean insertPetOwner(String name,String addr,String contactNo) {
			
			  boolean isSuccess = false;
			  
			 
			   try {
				   con = DBConnect.getDBConnection(); 
				   stmt= con.createStatement();
				   
				   String sql="insert into PetOwner values(0,'"+name+"','"+addr+"','"+contactNo+"')";
				   int rs = stmt.executeUpdate(sql);
				   
				   if(rs > 0) {
					   isSuccess = true;
				   }else {
					   isSuccess = false;
				   }
				  
			   }
			   catch(Exception e) {
				   e.printStackTrace();
			   }
			  	
			  return isSuccess;
		}
		
		
		//update
		 public static boolean updatePetOwner(String id, String name, String addr, String contactNo) {
		    	
		    	try {
		    		
		    		con = DBConnect.getDBConnection();
		    		stmt = con.createStatement();
		    		String sql = "update petowner set name='"+name+"',addr='"+addr+"',contactNo='"+contactNo+"'";
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
		    
		 public static List<PetOwner> getPetOwnerDetails(String Id) {
		    	
		    	int convertedID = Integer.parseInt(Id);
		    	
		    	ArrayList<PetOwner> pat = new ArrayList<>();
		    	
		    	try {
		    		
		    		con = DBConnect.getDBConnection();
		    		stmt = con.createStatement();
		    		String sql = "select * from petowner where ownerID='"+convertedID+"'";
		    		rs = stmt.executeQuery(sql);
		    		
		    		while(rs.next()) {
		    			int id = rs.getInt(1);
		    			String name = rs.getString(2);
		    			String addr = rs.getString(3);
		    			String contactNo = rs.getString(4);
		    			
		    			
		    			PetOwner c = new PetOwner(id,name,addr,contactNo);
		    			pat.add(c);
		    		}
		    		
		    	}
		    	catch(Exception e) {
		    		e.printStackTrace();
		    	}	
		    	return pat;	
		    }
		 
		    
		    
		    
		    public static boolean deletePetOwner(String id) {
		    	
		    	int convId = Integer.parseInt(id);
		    	
		    	try {
		    		
		    		con = DBConnect.getDBConnection();
		    		stmt = con.createStatement();
		    		String sql = "delete from petowner where ownerID='"+convId+"'";
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
		    
		    
		    public static ArrayList<PetOwner> getAllInventory1() {
				ArrayList<PetOwner> invent = new ArrayList<PetOwner>();
				
				try {
					//database connection
					 String url ="jdbc:mysql://localhost:3306/vetcaredb"; //my sql location
					 String user ="rame123";
				     String pass = "rootpwd";
				     
				     Class.forName("com.mysql.jdbc.Driver");//create driver
						Connection con = DriverManager.getConnection(url , user , pass);// create db connections
						java.sql.Statement stmt = con.createStatement();
						
						String sql = "select * from vetcaredb.petowner;";
						
						ResultSet rs = stmt.executeQuery(sql);
						
						while(rs.next()) {  //variables for catch the values
							
							int id = rs.getInt(1);
							String name = rs.getString(2);
							String addr=rs.getString(3);
							String contactNo = rs.getString(4);
							
						
						
							
							PetOwner pat= new PetOwner(id,name,addr,contactNo);// petowner object
							
							
							invent.add(pat); //pet owner ArrayList
						
						}
				     
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
				
				return invent;
			}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
