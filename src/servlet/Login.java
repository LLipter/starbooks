package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;
import listener.DatabaseUtility;


public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String userName = req.getParameter("user_name");
		String passwd = req.getParameter("passwd");
		String admin = req.getParameter("admin");

		try {
			User user = DatabaseUtility.getUser(userName);
			if(user == null) {
				req.setAttribute("loginResult", "no such user");
			}else if(!user.getPasswd().equals(passwd)) {
				req.setAttribute("loginResult", "invalid password");
			}else if(admin != null && user.getPrivilege() < User.ADMIN)
				req.setAttribute("loginResult", "No enough privilege");
			else{
				req.setAttribute("loginResult", "login successfully");
				req.setAttribute("user_name", userName);
				req.setAttribute("passwd", passwd);
				HttpSession session = req.getSession();
				session.setAttribute("user",user);
				if(admin != null) {
					RequestDispatcher view = req.getRequestDispatcher("jsp/admin.jsp");
					view.forward(req, resp);
				}
			}
			RequestDispatcher view = req.getRequestDispatcher("jsp/login.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			PrintWriter out = resp.getWriter();
			out.println("sql querying failed");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}
	
	
}
