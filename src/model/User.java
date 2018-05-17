package model;

import java.sql.Timestamp;

public class User {

	private int user_id;
	private String userName;
	private String passwd;
	private Timestamp registerTime;
	private int privilege;
	
	public User(int user_id, String userName, String passwd, Timestamp registerTime, int privilege) {
		super();
		this.user_id = user_id;
		this.userName = userName;
		this.passwd = passwd;
		this.registerTime = registerTime;
		this.privilege = privilege;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public int getPrivilege() {
		return privilege;
	}

	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	
	
	

	
	
}
