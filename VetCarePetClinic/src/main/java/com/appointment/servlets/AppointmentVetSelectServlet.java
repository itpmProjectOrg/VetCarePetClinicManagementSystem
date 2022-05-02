package com.appointment.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.appointment.modules.AppointmentDBUtil;

@WebServlet("/AppointmentVetSelectServlet")
public class AppointmentVetSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> vetSurgeons = new ArrayList<String>();
		
		try {
			
			vetSurgeons = AppointmentDBUtil.getVetSurgeonNames();
			request.setAttribute("vetSurgeons", vetSurgeons);
			
			if(request.getParameter("apppointSideBtn2") != null) { //request direct to appointAdd page
				RequestDispatcher rd = request.getRequestDispatcher("appointmentAdd.jsp");
				rd.forward(request, response);
			}
			else if(request.getParameter("apppointSideBtn3") != null){
				RequestDispatcher rd = request.getRequestDispatcher("appointmentSummary.jsp"); //request direct to appointPortal page
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("appointmentPortal.jsp"); //request direct to appointPortal page
				rd.forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
