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
import model.User;

public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		PrintWriter out = resp.getWriter();
		
		FileItem portrait = null;
		HashMap<String,String> map = new HashMap<String,String>(); 
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			List<FileItem> files = fileUpload.parseRequest(req);
			for (FileItem file : files){
				if(file.isFormField()) {
					String key = file.getFieldName();
					String value = file.getString();
					map.put(key, value);
				}else {
					portrait = file;
				}
//				out.println(file.getFieldName());
//				out.println(file.getString());
//				out.println(file.getName());
			}
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}

		String userName = map.get("user_name");
		String passwd = map.get("passwd");
		String passwdConfirm = map.get("passwd_confirm");
		int gender = Integer.parseInt(map.get("gender"));
		Date birthday = map.get("birthday").equals("") ? null : Date.valueOf(map.get("birthday"));
		String address = map.get("address");
		String phone = map.get("phone");
		String email = map.get("email");
		
		try {
			User user = DatabaseUtility.getUser(userName);
			if(userName.equals(""))
				req.setAttribute("registerResult", "用户名不能为空");
			else if(passwd.equals(""))
				req.setAttribute("registerResult", "密码不能为空");
			else if(!passwd.equals(passwdConfirm))
				req.setAttribute("registerResult", "两次密码不相同");
			else if(birthday == null)
				req.setAttribute("registerResult", "生日不能为空");
			else if(address.equals(""))
				req.setAttribute("registerResult", "地址不能为空");
			else if(phone.equals(""))
				req.setAttribute("registerResult", "手机号不能为空");
			else if(email.equals(""))
				req.setAttribute("registerResult", "邮箱不能为空");
            else if(portrait.getSize() == 0)
			else if(portrait == null)
				req.setAttribute("registerResult", "头像不能为空");
			else if(user != null)
				req.setAttribute("registerResult", "用户名已存在，请重新输入");
			else {
				user = new User(userName,passwd,gender,birthday,address,phone,email);
				DatabaseUtility.registerUser(user);
				user = DatabaseUtility.getUser(user.getUser_name());	// get user_id
                String path = getServletContext().getRealPath("/") + "resource/user/" + user.getUser_id() + ".jpg";
                File file = new File(path);  
                portrait.write(file);
				
				// used for test 
				req.setAttribute("registerResult", "register successfully");
				req.setAttribute("user_name", userName);
				req.setAttribute("passwd", passwd);
				
				HttpSession session = req.getSession();
				session.setAttribute("user",user);
                resp.sendRedirect("/starbooks/userhome");
			}
			RequestDispatcher view = req.getRequestDispatcher("jsp/register.jsp");
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
