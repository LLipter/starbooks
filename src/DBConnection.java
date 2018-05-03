import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import javax.servlet.*;


public class DBConnection implements ServletContextListener {

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
}
