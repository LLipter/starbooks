package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;

import listener.DatabaseUtility;

public class CancelOrder extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int order_id = Integer.parseInt(req.getParameter("order_id"));
			DatabaseUtility.cancelOrder(order_id);
			RequestDispatcher view = req.getRequestDispatcher("jsp/user.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
