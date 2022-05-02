package com.appointment.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appointment.modules.*;
import java.util.*;

@WebServlet("/AppointmentSearchServlet")
public class AppointmentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Appointment> appoints = new ArrayList<Appointment>();
		ArrayList <String> vetNames = new ArrayList<>();
		
		try {
			String aDate = request.getParameter("aDate");
			String vetName = request.getParameter("vetSurgeon");
			
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
		
			if(request.getParameter("appointNo").equals("")){
				
				//search without appointmentNo
				appoints = AppointmentDBUtil.searchAppointmentWithoutNo(aDate, vetName);
				
			}else {
				
				//search with appointmentNo 
				int apNo = Integer.parseInt(request.getParameter("appointNo")); 
				appoints = AppointmentDBUtil.searchAppointmentWithNo(aDate, vetName, apNo);	 
			} 
			
			if(appoints.isEmpty()) { 
				request.setAttribute("searchNoRsltMsg","No Result Found"); 
			} 
			else { 
				request.setAttribute("appoints", appoints); 
			}
			
			
			request.setAttribute("vetSurgeons", vetNames); 
			RequestDispatcher rd = request.getRequestDispatcher("appointmentPortal.jsp");
			rd.forward(request, response);
				
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error in AppointmentSearchServlet");
		}
	}

}
