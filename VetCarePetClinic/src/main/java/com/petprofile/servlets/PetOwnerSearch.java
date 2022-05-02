package com.petprofile.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PetOwnerSearch")
public class PetOwnerSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "vetcaredb";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "rame123";
        String password = "rootpwd";
 
        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected!");
            String name = request.getParameter("name");
                        
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select * from petowner where name='" + name + "' ";
     
            System.out.println("query " + query);            
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
         
 
            while (rs.next()) {
                al = new ArrayList();
 

                al.add(rs.getInt(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));              
                
                
 
                System.out.println("al :: " + al);
                pid_list.add(al);
            }
 
            request.setAttribute("piList", pid_list);
            System.out.println("piList " + pid_list);
            RequestDispatcher view = request.getRequestDispatcher("/petprofile_owner_search.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }
	

}
