package model;

import java.sql.Timestamp;

public class User {

	private int user_id;
	private String user_name;
	private String passwd;
	private Timestamp registerTime;
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
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
