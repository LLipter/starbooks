import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		String userName = req.getParameter("user_name");
		String passwd = req.getParameter("passwd");
		
		ServletContext sc = getServletContext();
		Connection con = (Connection) sc.getAttribute("DBCon");
		try {
			Statement st = con.createStatement();
			String cmd = "SELECT passwd FROM user WHERE user_name = '" + userName + "'";
			ResultSet rs = st.executeQuery(cmd);
			if(!rs.next()) {
				out.println("No such user");
			}else {
				String truePasswd = rs.getString("passwd");
				if(truePasswd.equals(passwd)) {
					out.println("Hello, " + userName);
					out.println("your password is " + passwd);
				}else {
					out.println("Invalid password");
				}
			}
		} catch (SQLException e) {
			out.println("sql querying failed");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		
		out.println("</body>");
		out.println("</html>");
	}
	
}
