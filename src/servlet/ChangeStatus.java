package servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.SQLException;

import model.*;

import listener.DatabaseUtility;

public class ChangeStatus extends HttpServlet{
	
		@Override
		public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				int book_id = Integer.parseInt(req.getParameter("book_id"));
			    int aim_status=0;
				DatabaseUtility.bookStatus(book_id, aim_status);
				
				RequestDispatcher view = req.getRequestDispatcher("jsp/admin.jsp");
				view.forward(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

