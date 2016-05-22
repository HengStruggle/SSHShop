package com.demo.Action;

import java.util.Map;

import com.demo.Model.User;
import com.demo.Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegistrationAction extends ActionSupport{

	private String username;
	private String password;
	private String confirm_password;
	private UserService userService;
	
	public RegistrationAction(){
		System.out.println("Initialize RegistrationAction.....");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String execute() throws Exception {
		if (userService.usernameExsit(username)) {
			addFieldError("message", "用户名已存在，请重新注册！");
			return INPUT;
		}
		User user = new User();
		user.setAdmin(false);
		user.setUsername(username);
		user.setPassword(password);
		userService.save(user);
		Map session = ActionContext.getContext().getSession();
		session.put("username", username);
		session.put("userid", user.getUserId());
		session.put("admin", 0);
		return SUCCESS;
}
	
	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
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

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	
}
