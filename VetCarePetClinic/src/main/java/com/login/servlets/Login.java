package com.login.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.modules.LoginDao;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass  = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		LoginDao dao = new LoginDao();
		
		if(dao.check(uname, pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("username",uname);
			response.sendRedirect("main_homepage.jsp");
		}
		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Login details are invalid.Please enter valid username/password');");
			out.println("location='login.jsp';");
			out.println("</script>");
		}
	}

}
