package com.appointment.servlets;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appointment.modules.AppointmentDBUtil;

@WebServlet("/AppointmentAddServlet")
public class AppointmentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList <String> vetNames = new ArrayList<>();
		try {
			int aownerID = Integer.parseInt(request.getParameter("aOwnerID"));
			String aVetSurgeon = request.getParameter("aVetSurgeon");
			String aDate = request.getParameter("aDate");
			String aTime = request.getParameter("aTime");
			double aPayment = Double.parseDouble(request.getParameter("aPayment"));
			String aStatus = request.getParameter("aStatus");
			
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
			boolean isAppointTimeValid = AppointmentDBUtil.isAppointmentTimeValid(aVetSurgeon, aDate, aTime);
			boolean isAppointmentValid = AppointmentDBUtil.isAppointmentValid(aownerID, aVetSurgeon, aDate, aTime);
			
			if(isAppointTimeValid == true && isAppointmentValid == true) {
		
				//generate appointment no
				int appointmentNo = AppointmentDBUtil.getAppointmentNo(aVetSurgeon, aDate);
				
				//check appointment no is valid
				if(appointmentNo > 0) {

					//insert data to database
					Boolean isInsert = AppointmentDBUtil.insertAppointment(aownerID, aVetSurgeon, aDate, aTime, aPayment, aStatus, appointmentNo);
					if(isInsert == true) {
						request.setAttribute("Msg", "New Appointment is successully added...");
						request.setAttribute("AppointNoMsg", "Appointment No: ");
						request.setAttribute("appointNo", appointmentNo);
					}
					else {
						request.setAttribute("ErrorMsg1", "Oops..Appointment details are invalid.Please try again..");
					}
				}
				else {
					request.setAttribute("appointNoError", "Maximum Limit is exceeded");
				}
			
			}
			else if(isAppointTimeValid == false) {
				request.setAttribute("ErrorMsg1", "Veterinarian is not available at selected time.");
				request.setAttribute("ErrorMsg2", "Please check availability schedule");		
			}
			else {
				request.setAttribute("ErrorMsg1", "Appointment is already exists");
			}
			
			request.setAttribute("vetSurgeons", vetNames);
			RequestDispatcher rd = request.getRequestDispatcher("appointmentAdd.jsp");
			rd.forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error in appointmentAddservlet");
		}
	}

}
