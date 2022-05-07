package com.appointment.servlets;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appointment.modules.*;

@WebServlet("/AppointmentDeleteServlet")
public class AppointmentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList <String> vetNames = new ArrayList<>();
		try {
			int appointID =  Integer.parseInt(request.getParameter("appointIDForDelete"));
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
			boolean isDeleted = AppointmentDBUtil.deleteAppointment(appointID);
			
			if(isDeleted == true) {
				request.setAttribute("appointDeleteConfirmation", "***Appointment is deleleted successufully");
			}
			else {
				request.setAttribute("appointDeleteConfirmation", "***Deletion is not successfull");
			}
			
			request.setAttribute("vetSurgeons", vetNames); 
			RequestDispatcher rd = request.getRequestDispatcher("appointmentPortal.jsp");
			rd.forward(request, response);
			
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("error in appintmentDeleteServlet");
		}
	}

}
