package com.appointment.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appointment.modules.AppointmentDBUtil;

@WebServlet("/AppointmentUpdateServlet")
public class AppointmentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList <String> vetNames = new ArrayList<>();
		try {
			double payment = Double.parseDouble(request.getParameter("aPayment"));
			String paymentStatus = request.getParameter("aStatus");
			int appID = Integer.parseInt(request.getParameter("appointIDForUpdateForm"));
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
			
			boolean isUpdateValid = AppointmentDBUtil.isUpdateValid(payment, paymentStatus);
			if(isUpdateValid == true) {
				boolean isUpdate = AppointmentDBUtil.updateAppointment(payment, paymentStatus, appID);
				if(isUpdate == true) {
					request.setAttribute("updateConfirmation", "Appointment is updated successfully..");	
				}
				else {
					request.setAttribute("updateConfirmation", "Oops..Update is not successful..");	
				}
			}
			else {
				request.setAttribute("updateConfirmation", "Update is not successfull");
				request.setAttribute("updateConfirmation1", "Updated data might be invalid.Please try again..");
			}
				
			request.setAttribute("vetSurgeons", vetNames); 
			RequestDispatcher rd = request.getRequestDispatcher("appointmentPortal.jsp");
			rd.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in appointmentupdate servlet");
		}
	}

}
