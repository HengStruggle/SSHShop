package com.demo.Model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

	private Integer userId;			//用户编号
	private String username;		//用户名
	private String password;		//密码
	private Boolean admin;					//身份：普通用户 或者 管理员	
	
	public User() {
	}



	public User(Integer userId, String username, String password, Boolean admin) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.admin = admin;
	}



	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}



	public Boolean getAdmin() {
		return admin;
	}



	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}


}
