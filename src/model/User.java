package model;

import java.sql.Timestamp;

public class User {

	private final int user_id;
	private final String user_name;
	private String passwd;
	private final Timestamp registerTime;
	private int privilege;
	public User(int user_id, String user_name, String passwd, Timestamp registerTime, int privilege) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.passwd = passwd;
		this.registerTime = registerTime;
		this.privilege = privilege;
	}
	public int getUser_id() {
		return user_id;
	}

	public String getUser_name() {
		return user_name;
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

	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	

	
	

	
	
}
