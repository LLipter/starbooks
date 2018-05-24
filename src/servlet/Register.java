package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import listener.DatabaseUtility;
import model.User;

public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userName = req.getParameter("user_name");
		String passwd = req.getParameter("passwd");
		String passwdConfirm = req.getParameter("passwd_confirm");
		
		try {
			User user = DatabaseUtility.getUser(userName);
			if(!passwd.equals(passwdConfirm)) {
				req.setAttribute("registerResult", "两次密码不相同");
			}else if(user != null) {
				req.setAttribute("registerResult", "用户名已存在，请重新输入");
			}else {
				user = new User(userName,passwd);
				DatabaseUtility.registerUser(user);
				req.setAttribute("registerResult", "register successfully");
				req.setAttribute("user_name", userName);
				req.setAttribute("passwd", passwd);
				HttpSession session = req.getSession();
				session.setAttribute("user",user);
			}
			RequestDispatcher view = req.getRequestDispatcher("jsp/register.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			PrintWriter out = resp.getWriter();
			out.println("sql querying failed");
			out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
}
