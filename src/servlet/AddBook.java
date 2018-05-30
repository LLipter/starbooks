package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;
import listener.DatabaseUtility;


public class AddBook extends  HttpServlet {
	private  Item item;
	private Order cart;
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bookId = req.getParameter("book_id");
		int bookId_int = Integer.parseInt(bookId);

		try{
			Book book = DatabaseUtility.getBook(bookId_int );
			HttpSession session = req.getSession();
	        
			cart=new Order();
			item = new Item(bookId_int, book);
			
			
			boolean iffound=false;
			if(session.getAttribute("cart") != null) {
			cart = (Order) session.getAttribute("cart");
			for(Item it:cart) {
				if(it.getBook().getBook_id()==book.getBook_id()) {
					
					it.setQuantity(it.getQuantity()+1);
				   iffound=true;
				}
				
			}
			if(!iffound)
			cart.AddItems(item);
			
			}
			else {
				session.setAttribute("cart", cart);
			    cart = (Order) session.getAttribute("cart");
			    cart.AddItems(item);
			}
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/cart.jsp");
			view.forward(req, resp);
		} catch (SQLException ex){
			PrintWriter out = resp.getWriter();
			out.println("Add book failed");
			out.println(ex.getMessage());
			ex.printStackTrace();
		}

		}
	}


