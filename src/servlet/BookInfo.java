package servlet;
import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import listener.DatabaseUtility;
import model.Book;

public class BookInfo extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			String book_title = new String(req.getParameter("book_title"));
			String book_Author = new String(req.getParameter("book_Author"));
			String book_publisher = new String(req.getParameter("book_publisher"));
			double book_price = Double.parseDouble(req.getParameter("book_price"));
			String book_resource = req.getParameter("book_resource");
			String status=req.getParameter("status");
			int book_status=1;
			if(status=="avaliable")
				book_status=1;
			else if(status=="unavaliable")
				book_status=0;


			try {
				Book book = DatabaseUtility.getBook(book_id);
				if (book_id==0)
					req.setAttribute("BookInfoResult", "ID不能为空");
				else if (book_title.equals(""))
					req.setAttribute("BookInfoResult", "title不能为空");
				else if (book_Author.equals(""))
					req.setAttribute("BookInfoResult", "author不能为空");
				else if (book_publisher.equals(""))
					req.setAttribute("BookInfoResult", "publisher不能为空");
				else if (book_price==0.0d)
					req.setAttribute("BookInfoResult", "price不能为空");
				else if (book_resource.equals(""))
					req.setAttribute("BookInfoResult", "resource不能为空");
				else if (book != null)
					req.setAttribute("BookInfoResult", "book已存在，请重新输入");
				else {
					book = new Book(book_id, book_title, book_Author, book_publisher, book_price, book_resource, book_status);
					DatabaseUtility.setBook(book);
					resp.sendRedirect("/starbooks/jsp/admin.jsp");
				}
				RequestDispatcher view = req.getRequestDispatcher("jsp/bookInfo.jsp");
				view.forward(req, resp);
			} catch (SQLException e) {
				PrintWriter out = resp.getWriter();
				out.println("sql querying failed");
				out.println(e.getMessage());
				e.printStackTrace();
			} catch (Exception e) {
				PrintWriter out = resp.getWriter();
				e.printStackTrace();
				out.println(e.getMessage());
			}
		}

	}


