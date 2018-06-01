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
			    int aim_status = Integer.parseInt(req.getParameter("aim_status"));;
				DatabaseUtility.bookStatus(book_id, aim_status);
				String path = String.format("/starbooks/jsp/admin.jsp?book_status=%d", aim_status == 1 ? 0 : 1);
				resp.sendRedirect(path);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

