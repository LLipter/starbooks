package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import listener.DatabaseUtility;
import model.*;
public class RemoveBook extends  HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			Book book = DatabaseUtility.getBook(book_id);
			Order cart = (Order)req.getSession().getAttribute("cart");
			if(cart == null)
				cart = new Order();
			Item theItem = null;
			for(Item item : cart) {
				if(item.getBook().getBook_id() == book.getBook_id()) {
					theItem = item;
					break;
				}
			}
			cart.removeItem(theItem);			
			req.getSession().setAttribute("cart",cart);
			RequestDispatcher view = req.getRequestDispatcher("jsp/cart.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
