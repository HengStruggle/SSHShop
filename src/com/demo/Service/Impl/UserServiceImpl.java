package com.demo.Service.Impl;

import com.demo.Dao.UserDao;
import com.demo.Model.User;
import com.demo.Service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void save(User user) {
		this.userDao.saveUser(user);
	}

	@Override
	public void update(User user) {
		this.userDao.updateUser(user);
	}

	@Override
	public User findUserByUserid(Integer userid) {
		return this.userDao.findUserByUserid(userid);
	}

	@Override
	public boolean checkUser(String username, String password,boolean admin) {
		User user = this.userDao.findUserByUsername(username);
		if(user!=null && user.getPassword().equals("password") && user.getAdmin().equals(admin)){
			return true;
		}
		else return false;
	}

	@Override
	public boolean checkUser(String username, String password, boolean admin, Integer[] userid) {
		User user = this.userDao.findUserByUsername(username);
		if(user!=null && user.getPassword().equals(password) && user.getAdmin().equals(admin)){
			userid[0] = user.getUserId();
			return true;
		}
		else return false;
	}

	@Override
	public boolean usernameExsit(String username) {
		User user = this.userDao.findUserByUsername(username);
		if(user!=null){
			return true;
		}
		return false;
	}
}
