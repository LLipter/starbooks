package listener;

import java.sql.*;
import javax.servlet.*;

import model.*;


public class DatabaseUtility implements ServletContextListener {

	private static final String userName = "starbooks";
	private static final String password = "admin";
	private static final String host = "jdbc:mysql://www.irran.top:3306/starbooks";
	private static final String driverName = "com.mysql.jdbc.Driver";
	private static Connection con = null;
	

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.out.println("Can not load mysql/jdbc driver.");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(host, userName, password);
			ServletContext sc = sce.getServletContext();
			sc.setAttribute("DBCon", con);
			
		} catch (SQLException e) {
			System.out.println("Can not connect to database.");
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Connection closing failed.");
			e.printStackTrace();
		}
		
	}
	
	public static User getUser(String userName) throws SQLException {
		PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE user_name = ?");
		ps.setString(1, userName);
		ResultSet rs = ps.executeQuery();
		if(!rs.next())
			return null; // no such user;
		
		int user_id = rs.getInt("user_id");
		String passwd = rs.getString("passwd");
		Timestamp registerTime = rs.getTimestamp("register_time");
		int privilege = rs.getInt("privilege");
		
		return new User(user_id,userName,passwd,registerTime,privilege);
	}
}
