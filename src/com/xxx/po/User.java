package com.xxx.po;

public class User {

	int id;
	String uname;
	String pwd;
	String phone;
	String mail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public User(int id, String uname, String pwd, String phone, String mail) {
		super();
		this.id = id;
		this.uname = uname;
		this.pwd = pwd;
		this.phone = phone;
		this.mail = mail;
	}
	public User() {
		super();
	}
	
}
