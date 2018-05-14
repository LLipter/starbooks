import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String userName = req.getParameter("user_name");
		String passwd = req.getParameter("passwd");
		ServletContext sc = getServletContext();
		Connection con = (Connection) sc.getAttribute("DBCon");

		try {
			Statement st = con.createStatement();
			String cmd = "SELECT passwd FROM user WHERE user_name = '" + userName + "'";
			ResultSet rs = st.executeQuery(cmd);
			if(!rs.next()) {
				req.setAttribute("loginResult", 2); // no such user
			}else {
				String truePasswd = rs.getString("passwd");
				if(truePasswd.equals(passwd)) {
					// login successfully
					req.setAttribute("loginResult", 1);
					req.setAttribute("user_name", userName);
					req.setAttribute("passwd", passwd);
					HttpSession session = req.getSession();
					session.setAttribute("user", new User(userName));
				}else {
					req.setAttribute("loginResult", 3); // invalid password
				}
			}
			RequestDispatcher view = req.getRequestDispatcher("login.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			PrintWriter out = resp.getWriter();
			out.println("sql querying failed");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		
		


	}
	
}
