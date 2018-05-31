package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;
import listener.DatabaseUtility;

public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user_name");
		String passwd = req.getParameter("passwd");
		String admin = req.getParameter("admin");

		try {
			User user = DatabaseUtility.getUser(userName);
			if (user == null) {
				req.setAttribute("loginResult", "no such user");
			} else if (!user.getPasswd().equals(passwd)) {
				req.setAttribute("loginResult", "invalid password");
			} else if (admin != null && user.getPrivilege() < User.ADMIN)
				req.setAttribute("loginResult", "No enough privilege");
			else {
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				if (admin != null) {
					resp.sendRedirect("/starbooks/jsp/admin.jsp");
					return;
				}
				resp.sendRedirect("/starbooks/userhome");
				return;
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


}
