package com.petprofile.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petprofile.modules.PetOwnerDBUtil;


@WebServlet("/PetOwnerInsert")
public class PetOwnerInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//save form values in variables     
				String name = request.getParameter("name");//form input field name
				String addr = request.getParameter("addr");
				String contactNo = request.getParameter("contactNo");
				PrintWriter out = response.getWriter();
				
				boolean isTrue;
				
				isTrue = PetOwnerDBUtil.insertPetOwner(name, addr, contactNo);
			
				//navigate to another page
			    if(isTrue == true) {
			    	out.println("<script type=\"text/javascript\">");
					out.println("alert('Inserted Successfully!');");
					out.println("location='petprofile_ownerlist.jsp';");
					out.println("</script>");
			    	//RequestDispatcher dis = request.getRequestDispatcher("petprofile_addowner_success.jsp");
			    	//dis.forward(request, response);
			    }else {
			    	out.println("<script type=\"text/javascript\">");
					out.println("alert('Inserted Unsuccessfully');");
					out.println("location='petprofile_ownerlist.jsp';");
					out.println("</script>");
			    	//RequestDispatcher dis2 = request.getRequestDispatcher("petprofile_addowner_unsuccess.jsp");
			    	//dis2.forward(request, response);
			    }
	}

}
