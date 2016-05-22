package com.demo.Action;

import java.util.Map;

import com.demo.Model.User;
import com.demo.Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = -6583771540757402864L;
	
	private User user;
	private UserService userService;
	
	public LoginAction(){
		System.out.println("Initialize LoginAction.....");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String execute() throws Exception {
		
	Integer[] userid = {0};
	
	if(this.userService.checkUser(user.getUsername(), user.getPassword(), user.getAdmin(), userid)){
		Map session = ActionContext.getContext().getSession();
		session.put("username", user.getUsername());
		session.put("admin",user.getAdmin());
		session.put("userid", userid[0]);
		return SUCCESS;
	}
	else{
		addFieldError("message", "用户名或密码错误！");
		return INPUT;
	}		
}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
