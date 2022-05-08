package com.login.modules;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	 String sql = "select * from login where uname=? and password=?";
	 String url = "jdbc:mysql://localhost:3306/vetcaredb";
	 String userName = "rame123";
	 String pass = "rootpwd" ;
	 
	 public boolean check(String uname,String password) {
			
			
			try {
			   Class.forName("com.mysql.jdbc.Driver");
			   Connection con = DriverManager.getConnection(url,userName,pass);
			   PreparedStatement st = con.prepareStatement(sql);
			   st.setString(1, uname);
			   st.setString(2, password);
			   
			   ResultSet rs = st.executeQuery();
			   if(rs.next()) {
				   return true;
			   }
				  
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
}
