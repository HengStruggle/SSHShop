package com.demo.Dao;

import com.demo.Model.User;

public interface UserDao {
	
	public User findUserByUsername(String username);
	public User findUserByUserid(Integer userid);
	public void updateUser(User user);
	public void saveUser(User user);
}