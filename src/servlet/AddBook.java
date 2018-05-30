package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;

import listener.DatabaseUtility;


public class AddBook extends  HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			int quentity = Integer.parseInt(req.getParameter("quentity"));
			Book book = DatabaseUtility.getBook(book_id);
			Order cart = (Order)req.getSession().getAttribute("cart");
			if(cart == null)
				cart = new Order();
			boolean isFound = false;
			for(Item item : cart) {
				if(item.getBook().getBook_id() == book.getBook_id()) {
					item.setQuantity(item.getQuantity() + quentity);
					isFound = true;
					break;
				}
			}
			if(!isFound)
				cart.AddItems(new Item(1,book));
			req.getSession().setAttribute("cart",cart);
			RequestDispatcher view = req.getRequestDispatcher("jsp/cart.jsp");
			view.forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		}
	}


