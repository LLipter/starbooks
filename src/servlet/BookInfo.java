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
			FileItem cover = null;
			HashMap<String, String> map = new HashMap<String, String>();
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload fileUpload = new ServletFileUpload(factory);
				List<FileItem> files = fileUpload.parseRequest(req);
				for (FileItem file : files) {
					if (file.isFormField()) {
						String key = file.getFieldName();
						String value = file.getString();
						value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
						map.put(key, value);
					} else {
						cover = file;
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			
			int book_id = Integer.parseInt(map.get("book_id"));
			String book_title = map.get("book_title");
			String book_Author = map.get("book_Author");
			String book_publisher = map.get("book_publisher");
			double book_price = map.get("book_price").equals("") ? 0 : Double.parseDouble(map.get("book_price"));
			String res_url = map.get("res_url");
			String description = map.get("description");
			String information = map.get("information");
			String review = map.get("review");
			int book_status = map.get("status").equals("avaliable") ? 1 : 0;
			try {
				if (book_title.equals(""))
					req.setAttribute("BookInfoResult", "title不能为空");
				else if (book_Author.equals(""))
					req.setAttribute("BookInfoResult", "author不能为空");
				else if (book_publisher.equals(""))
					req.setAttribute("BookInfoResult", "publisher不能为空");
				else if (book_price == 0)
					req.setAttribute("BookInfoResult", "price不能为空");
				else if (description.equals(""))
					req.setAttribute("BookInfoResult", "description不能为空");
				else if (information.equals(""))
					req.setAttribute("BookInfoResult", "information不能为空");
				else if (review.equals(""))
					req.setAttribute("BookInfoResult", "review不能为空");
				else if(book_id == -1 && cover.getSize() == 0)
					req.setAttribute("BookInfoResult", "cover不能为空");
				else {
					Book book = new Book();
					book.setBook_id(book_id);
					book.setBook_name(book_title);
					book.setAuthor(book_Author);
					book.setPublisher(book_publisher);
					book.setPrice(book_price);
					//这里不太对
					book.setRes_url(res_url);
					book.setDescription(description);
					book.setInformation(information);
					book.setReviews(review);
					book.setBook_status(book_status);
					// add new book
					if(book_id == -1) {
						DatabaseUtility.setBook(book);
						String path = getServletContext().getRealPath("/") + "resource/book/image/" + book.getRes_url() + ".jpg";
						File file = new File(path);
						cover.write(file);
					// update existing book
					}else {
						DatabaseUtility.updateBook(book);
					}
					resp.sendRedirect("/starbooks/jsp/admin.jsp");
					return;
				}
				if(book_id == -1) 
					req.getRequestDispatcher("jsp/bookInfo.jsp").forward(req, resp);
				else
					req.getRequestDispatcher(String.format("jsp/bookInfo.jsp?Modify=true&book_id=%d", book_id)).forward(req, resp);
			} catch (SQLException e) {
				PrintWriter out = resp.getWriter();
				out.println(e.getMessage());
				e.printStackTrace();
			} catch (Exception e) {
				PrintWriter out = resp.getWriter();
				e.printStackTrace();
				out.print(e.getMessage());
			}
		}

	}


