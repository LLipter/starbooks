package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;

import listener.DatabaseUtility;

public class AddBook extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			Book book = DatabaseUtility.getBook(book_id);
			Order cart = (Order) req.getSession().getAttribute("cart");
			if (cart == null)
				cart = new Order();
			boolean isFound = false;
			for (Item item : cart) {
				if (item.getBook().getBook_id() == book.getBook_id()) {
					item.setQuantity(item.getQuantity() + quantity);
					isFound = true;
					break;
				}
			}
			if (!isFound)
				cart.AddItems(new Item(quantity, book));
			req.getSession().setAttribute("cart", cart);
			resp.sendRedirect("/starbooks/jsp/cart.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
