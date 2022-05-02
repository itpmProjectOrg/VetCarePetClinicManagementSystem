package com.petprofile.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petprofile.modules.PetDBUtil;
import com.petprofile.modules.Pet;



@WebServlet("/PetUpdate")
public class PetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String petID = request.getParameter("petID");
		String ownerID = request.getParameter("ownerID");
		String name = request.getParameter("name");
		String petType = request.getParameter("petType");
		String breed = request.getParameter("breed");
		String sex = request.getParameter("sex");
		String dob = request.getParameter("dob");
		String date = request.getParameter("date");
		
        boolean isTrue;
		
		isTrue = PetDBUtil.updatePet(petID,ownerID, name, petType, breed, sex, dob, date);
		
        if(isTrue == true) {
			
			List<Pet> patDetails = PetDBUtil.getPetDetails(petID);
			request.setAttribute("patDetails", patDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("petprofile_update_success.jsp");
			dis.forward(request, response);
		}
		else {
			List<Pet> patDetails = PetDBUtil.getPetDetails(petID);
			request.setAttribute("patDetails", patDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("petprofile_update_unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}
}


