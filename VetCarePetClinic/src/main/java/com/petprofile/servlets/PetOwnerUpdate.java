package com.petprofile.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petprofile.modules.PetOwner;
import com.petprofile.modules.PetOwnerDBUtil;


@WebServlet("/PetOwnerUpdate")
public class PetOwnerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ownerID = request.getParameter("ownerID");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String contactNo = request.getParameter("contactNo");
		PrintWriter out = response.getWriter();
		
        boolean isTrue;
		
		isTrue = PetOwnerDBUtil.updatePetOwner(ownerID, name, addr, contactNo);
		
        if(isTrue == true) {
			
			List<PetOwner> patDetails = PetOwnerDBUtil.getPetOwnerDetails(ownerID);
			request.setAttribute("patDetails", patDetails);
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Updated Successfully!');");
			out.println("location='petprofile_ownerlist.jsp';");
			out.println("</script>");
			//RequestDispatcher dis = request.getRequestDispatcher("petprofile_update_success.jsp");
			//dis.forward(request, response);
		}
		else {
			List<PetOwner> patDetails = PetOwnerDBUtil.getPetOwnerDetails(ownerID);
			request.setAttribute("patDetails", patDetails);
			
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Updated Successfully!');");
			out.println("location='petprofile_ownerlist.jsp';");
			out.println("</script>");
			//RequestDispatcher dis = request.getRequestDispatcher("petprofile_update_unsuccess.jsp");
			//dis.forward(request, response);
		}
		
	}

}
