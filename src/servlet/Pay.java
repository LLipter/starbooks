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
import model.Order;
import model.User;

public class Pay extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String receiverName = req.getParameter("receiver_name");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone_number");
		String postCode = req.getParameter("post_code");

		try {
			User user = (User) req.getSession().getAttribute("user");
			Order order = (Order) req.getSession().getAttribute("cart");
			if (user == null) {
				req.setAttribute("loginResult", "付款前必须登录");
				req.getRequestDispatcher("jsp/login.jsp").forward(req, resp);
			} else if (receiverName.equals(""))
				req.setAttribute("payResult", "用户名不能为空");
			else if (address.equals(""))
				req.setAttribute("payResult", "地址不能为空");
			else if (email.equals(""))
				req.setAttribute("payResult", "邮箱不能为空");
			else if (phone.equals(""))
				req.setAttribute("payResult", "手机号不能为空");
			else if (postCode.equals(""))
				req.setAttribute("payResult", "邮编不能为空");
			else {
				order.setReceiver_name(receiverName);
				order.setAddress(address);
				order.setEmail(email);
				order.setPhone(phone);
				order.setPost_code(postCode);
				DatabaseUtility.pay(user, order);
				req.getSession().setAttribute("cart", new Order());
				RequestDispatcher view = req.getRequestDispatcher("jsp/user.jsp");
				view.forward(req, resp);
			}
			RequestDispatcher view = req.getRequestDispatcher("jsp/pay.jsp");
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
