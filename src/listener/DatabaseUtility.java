package listener;

import java.sql.*;
import java.util.ArrayList;

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
			return null; // no such user
		
		int user_id = rs.getInt("user_id");
		String passwd = rs.getString("passwd");
		Timestamp registerTime = rs.getTimestamp("register_time");
		int privilege = rs.getInt("privilege");
		
		return new User(user_id,userName,passwd,registerTime,privilege);
	}
	
	public static int updateUser(User user) throws SQLException{
		PreparedStatement ps = con.prepareStatement("UPDATE user SET passwd=?,privilege=? WHERE user_id=?");
		ps.setString(1, user.getPasswd());
		ps.setInt(2, user.getPrivilege());
		ps.setInt(3, user.getUser_id());
		return ps.executeUpdate();	// the number of rows that are changed
	}
	
	public static int registerUser(User user) throws SQLException{
		PreparedStatement ps = con.prepareStatement("INSERT INTO user(user_name,passwd) VALUES(?,?)");
		ps.setString(1, user.getUser_name());
		ps.setString(2, user.getPasswd());
		return ps.executeUpdate();	// the number of rows that are changed
	}
	
	public static Book getBook(int book_id) throws SQLException{
		PreparedStatement ps = con.prepareStatement("SELECT * FROM book WHERE book_id = ?");
		ps.setInt(1, book_id);
		ResultSet rs = ps.executeQuery();
		if(!rs.next())
			return null; // no such book
		
		String book_name = rs.getString("book_name");
		String author = rs.getString("author");
		String publisher = rs.getString("publisher");
		double price = rs.getDouble("price");
		String res_url = rs.getString("res_url");
		int book_status = rs.getInt("book_status");
		return new Book(book_id,book_name,author,publisher,price,res_url,book_status);
	}
	
	public static ArrayList<Book> getAllBooks() throws SQLException{
		PreparedStatement ps = con.prepareStatement("SELECT * FROM book");
		ResultSet rs = ps.executeQuery();
		ArrayList<Book> ret = new ArrayList<Book>();
		while(rs.next()) {
			int book_id = rs.getInt("book_id");
			String book_name = rs.getString("book_name");
			String author = rs.getString("author");
			String publisher = rs.getString("publisher");
			double price = rs.getDouble("price");
			String res_url = rs.getString("res_url");
			int book_status = rs.getInt("book_status");
			Book book = new Book(book_id,book_name,author,publisher,price,res_url,book_status);
			ret.add(book);
		}
		return ret;
	}
	
	public static ArrayList<User> getAllUsers() throws SQLException{
		PreparedStatement ps = con.prepareStatement("SELECT * FROM user");
		ResultSet rs = ps.executeQuery();
		ArrayList<User> ret = new ArrayList<User>();
		while(rs.next()) {
			int user_id = rs.getInt("user_id");
			String user_name = rs.getString("user_name");
			String passwd = rs.getString("passwd");
			Timestamp registerTime = rs.getTimestamp("register_time");
			int privilege = rs.getInt("privilege");
			User user = new User(user_id,user_name,passwd,registerTime,privilege);
			ret.add(user);
		}
		return ret;
	}
}
