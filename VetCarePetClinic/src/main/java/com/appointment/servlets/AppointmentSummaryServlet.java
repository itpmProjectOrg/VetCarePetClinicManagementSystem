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
import com.appointment.modules.AppointmentReport;

@WebServlet("/AppointmentSummaryServlet")
public class AppointmentSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList <String> vetNames = new ArrayList<>();
		AppointmentReport aReport = null;
		
		try {
			String aFromDate = request.getParameter("aFromDate");
			String aToDate = request.getParameter("aToDate");
			String avetSurgeon = request.getParameter("avetSurgeon");
			
			vetNames = AppointmentDBUtil.getVetSurgeonNames();
			
			//implement the report part
			aReport = AppointmentDBUtil.generateAppointSummaryReport(aFromDate, aToDate, avetSurgeon);
			if(aReport == null) {
				request.setAttribute("NoReportMsg", "No Result Found");
			}
			else {
				request.setAttribute("appointReport", aReport);
			}
			
			request.setAttribute("vetSurgeons", vetNames);
			RequestDispatcher rd = request.getRequestDispatcher("appointmentSummary.jsp");
			rd.forward(request, response);
			
		}catch(Exception e) {
			System.out.println("Error in appointmentSummarySevlet");
			e.printStackTrace();
		}
	}

}
