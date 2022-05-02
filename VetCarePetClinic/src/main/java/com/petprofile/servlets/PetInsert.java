package com.petprofile.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petprofile.modules.PetDBUtil;

@WebServlet("/PetInsert")
public class PetInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ownerID = Integer.parseInt(request.getParameter("ownerID"));
		String name = request.getParameter("name");
		String petType = request.getParameter("petType");
		String breed = request.getParameter("breed");
		String sex = request.getParameter("sex");
		String dob = request.getParameter("dob");
		String date = request.getParameter("date");
			
		PrintWriter out = response.getWriter();
		
		boolean isTrue;
		
		isTrue = PetDBUtil.insertPet(ownerID, name, petType, breed, sex, dob, date);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("petprofile_addpet_success.jsp");
	    	dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("petprofile_addpet_unsuccess.jsp");
	    	dis2.forward(request, response);
		}
	}

}
