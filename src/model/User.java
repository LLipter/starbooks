package model;

import java.sql.*;

public class User {
	
	public final static int ADMIN = 10;

	private final int user_id;
	private final String user_name;
	private String passwd;
	private final Timestamp registerTime;
	private int privilege;
	private int gender;
	private Date birthday;
	private String address;
	private String phone;
	private String email;
	
	public User(String user_name, String passwd) {
		this.user_id = -1;
		this.user_name = user_name;
		this.passwd = passwd;
		this.registerTime = null;
		this.privilege = 0;
	}
	
	public User(int user_id, String user_name, String passwd, Timestamp registerTime, int privilege, int gender,
			Date birthday, String address, String phone, String email) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.passwd = passwd;
		this.registerTime = registerTime;
		this.privilege = privilege;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getPrivilege() {
		return privilege;
	}

	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static int getAdmin() {
		return ADMIN;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}


	
	

	
	

	
	
}
