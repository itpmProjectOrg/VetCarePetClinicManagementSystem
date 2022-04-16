package com.utilities;
import java.sql.*;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/vetcaredb";
	private static String uname = "rame123";
	private static String pwd = "rootpwd";
	
	public static Connection getDBConnection(){
		
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con =  DriverManager.getConnection(url, uname, pwd);
			System.out.println("Sucessfully connected");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error while connecting");
		}
		return con;
					
	}
	 

}
