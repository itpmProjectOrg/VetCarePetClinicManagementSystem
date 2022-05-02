package com.appointment.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appointment.modules.Appointment;
import com.appointment.modules.AppointmentDBUtil;

@WebServlet("/AppointRedirectToUpdatePageServlet")
public class AppointRedirectToUpdatePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//get doctor names & status 
			ArrayList <String> vetNames = new ArrayList<>();
			ArrayList <String> aStatus = new ArrayList<>();
			
			int appointID = Integer.parseInt(request.getParameter("appointIDForUpdate"));
			Appointment appObj = AppointmentDBUtil.getAppointmentDetails(appointID);
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
			aStatus = AppointmentDBUtil.getStatus();
			
			if(appObj != null) {
				request.setAttribute("appointment", appObj);
				request.setAttribute("vetSurgeonNames", vetNames);
				request.setAttribute("status", aStatus);
				RequestDispatcher rd=  request.getRequestDispatcher("appointmentUpdate.jsp");
				rd.forward(request, response);
			}
			else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No results found');");
				out.println("location='appointmentPortal.jsp';");
				out.println("</script>");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in appointmentRedirectToUpdatePage servlet");
		}
	}

}
