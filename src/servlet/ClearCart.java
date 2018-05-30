package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listener.DatabaseUtility;
import model.Book;
import model.Item;
import model.Order;

public class ClearCart extends  HttpServlet {

	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Order cart = (Order)req.getSession().getAttribute("cart");
		cart = new Order();
		req.getSession().setAttribute("cart",cart);
		RequestDispatcher view = req.getRequestDispatcher("jsp/cart.jsp");
		view.forward(req, resp);
	}
	
}
