package listener;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;

import model.*;

public class DatabaseUtility implements ServletContextListener {

	private static final String userName = "starbooks";
	private static final String password = "admin";
	private static final String url = "jdbc:mysql://www.irran.top:3306/starbooks?"
			+ "user=starbooks&password=admin&useUnicode=true&characterEncoding=UTF8";
	private static final String driverName = "com.mysql.jdbc.Driver";
	private static Connection con = null;
	public static String basePath = null;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		basePath = sce.getServletContext().getRealPath("/");
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.out.println("Can not load mysql/jdbc driver.");
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url);
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
		if (!rs.next())
			return null; // no such user

		int user_id = rs.getInt("user_id");
		String passwd = rs.getString("passwd");
		Timestamp registerTime = rs.getTimestamp("register_time");
		int privilege = rs.getInt("privilege");
		int gender = rs.getInt("gender");
		Date birthday = rs.getDate("birthday");
		String address = rs.getString("address");
		String phone = rs.getString("phone");
		String email = rs.getString("email");
		return new User(user_id, userName, passwd, registerTime, privilege, gender, birthday, address, phone, email);
	}

	public static int registerUser(User user) throws SQLException {
		PreparedStatement ps = con.prepareStatement(
				"INSERT INTO user(user_name,passwd,gender,birthday,address,phone,email) VALUES(?,?,?,?,?,?,?)");
		ps.setString(1, user.getUser_name());
		ps.setString(2, user.getPasswd());
		ps.setInt(3, user.getGender());
		ps.setDate(4, user.getBirthday());
		ps.setString(5, user.getAddress());
		ps.setString(6, user.getPhone());
		ps.setString(7, user.getEmail());
		return ps.executeUpdate(); // the number of rows that are changed
	}
	
	public static int updateBook(Book book) throws SQLException {
		book.updateText();
		PreparedStatement ps = con.prepareStatement(
				"UPDATE book SET "
				+ "book_name = ?,author = ?,publisher = ?,price = ?,book_status = ? "
				+ "WHERE book_id = ?");
		ps.setString(1, book.getBook_name());
		ps.setString(2, book.getAuthor());
		ps.setString(3, book.getPublisher());
		ps.setDouble(4, book.getPrice());
		ps.setInt(5, book.getBook_status());
		ps.setInt(6, book.getBook_id());
		return ps.executeUpdate(); // the number of rows that are changed
	}
	
	
	public static int setBook(Book book) throws SQLException {
		book.updateText();
		book.generateRes_url();
		PreparedStatement ps = con.prepareStatement(
				"INSERT INTO book(book_name,author,publisher,price,res_url,book_status) VALUES(?,?,?,?,?,?)");
		ps.setString(1, book.getBook_name());
		ps.setString(2, book.getAuthor());
		ps.setString(3, book.getPublisher());
		ps.setDouble(4, book.getPrice());
		ps.setString(5, book.getRes_url());
		ps.setInt(6, book.getBook_status());
		return ps.executeUpdate(); // the number of rows that are changed
	}

	public static Book getBook(int book_id) throws SQLException {
		PreparedStatement ps = con.prepareStatement("SELECT * FROM book WHERE book_id = ?");
		ps.setInt(1, book_id);
		ResultSet rs = ps.executeQuery();
		if (!rs.next())
			return null; // no such book

		String book_name = rs.getString("book_name");
		String author = rs.getString("author");
		String publisher = rs.getString("publisher");
		double price = rs.getDouble("price");
		String res_url = rs.getString("res_url");
		int book_status = rs.getInt("book_status");
		return new Book(book_id, book_name, author, publisher, price, res_url, book_status);

	}

	public static ArrayList<Book> getAllBooks(int book_status) throws SQLException {
		PreparedStatement ps = con.prepareStatement("SELECT * FROM book WHERE book_status = ?");
		ps.setInt(1, book_status);
		ResultSet rs = ps.executeQuery();
		ArrayList<Book> ret = new ArrayList<Book>();
		while (rs.next()) {
			int book_id = rs.getInt("book_id");
			String book_name = rs.getString("book_name");
			String author = rs.getString("author");
			String publisher = rs.getString("publisher");
			double price = rs.getDouble("price");
			String res_url = rs.getString("res_url");
			Book book = new Book(book_id, book_name, author, publisher, price, res_url, book_status);
			ret.add(book);
		}
		return ret;
	}

	public static int getNumberOfUser() throws SQLException {
		PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS res FROM user");
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getInt("res");
	}
    
    public static int getNumberOfBook(int book_status) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS res FROM book WHERE book_status = ?");
        ps.setInt(1, book_status);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getInt("res");
    }

	public static ArrayList<Order> getOrder(User user) throws SQLException {
		PreparedStatement ps = con.prepareStatement("SELECT * FROM book_order WHERE user_id = ?");
		ps.setInt(1, user.getUser_id());
		ResultSet rs = ps.executeQuery();
		ArrayList<Order> ret = new ArrayList<Order>();
		while (rs.next()) {
			int order_id = rs.getInt("order_id");
			Timestamp created_time = rs.getTimestamp("created_time");
			int order_status = rs.getInt("order_status");
			String receiver_name = rs.getString("receiver_name");
			String address = rs.getString("address");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String post_code = rs.getString("post_code");
			Order order = new Order(order_id, created_time, order_status, receiver_name, address, email, phone,
					post_code);
			PreparedStatement subps = con.prepareStatement("SELECT * FROM item WHERE order_id = ?");
			subps.setInt(1, order_id);
			ResultSet subrs = subps.executeQuery();
			while (subrs.next()) {
				int book_id = subrs.getInt("book_id");
				int quentity = subrs.getInt("quentity");
				Item item = new Item(quentity, DatabaseUtility.getBook(book_id));
				order.AddItems(item);
			}
			ret.add(order);
		}
		return ret;
	}

	private static int getLastestOrderID(User user) throws SQLException {
		PreparedStatement ps = con
				.prepareStatement("SELECT * FROM book_order WHERE user_id = ? ORDER BY created_time DESC LIMIT 1");
		ps.setInt(1, user.getUser_id());
		ResultSet rs = ps.executeQuery();
		if (!rs.next())
			return -1;// no such order
		return rs.getInt("order_id");
	}

	public static int pay(User user, Order order) throws SQLException {
		PreparedStatement ps = con.prepareStatement(
				"INSERT INTO book_order(user_id,receiver_name,address,email,phone,post_code) VALUES(?,?,?,?,?,?)");
		ps.setInt(1, user.getUser_id());
		ps.setString(2, order.getReceiver_name());
		ps.setString(3, order.getAddress());
		ps.setString(4, order.getEmail());
		ps.setString(5, order.getPhone());
		ps.setString(6, order.getPost_code());
		ps.executeUpdate();
		int order_id = getLastestOrderID(user);
		for (Item item : order) {
			PreparedStatement subps = con.prepareStatement("INSERT INTO item(book_id,order_id,quentity) VALUES(?,?,?)");
			subps.setInt(1, item.getBook().getBook_id());
			subps.setInt(2, order_id);
			subps.setInt(3, item.getQuantity());
			subps.executeUpdate();
		}

		return order.size() + 1; // number of records inserted
	}

	public static int bookStatus(int book_id,int aim_status ) throws SQLException {
		PreparedStatement ps = con.prepareStatement("UPDATE book SET book_status = ? WHERE book_id = ?");
		ps.setInt(1,aim_status);
		ps.setInt(2, book_id);
		return ps.executeUpdate();
	}
	
	public static int cancelOrder(int order_id) throws SQLException {
		PreparedStatement ps = con.prepareStatement("UPDATE book_order SET order_status = 0 WHERE order_id = ?");
		ps.setInt(1, order_id);
		return ps.executeUpdate();
	}

}
