package com.demo.Service;

import com.demo.Dao.UserDao;
import com.demo.Model.User;

public interface UserService {
	
	public void save(User user);

	public void update(User user);
	
	public User findUserByUserid(Integer userid);
	
	public boolean checkUser(String username, String password, boolean admin);
	
	public boolean checkUser(String username, String password, boolean admin, Integer[] userid);
	
	public boolean usernameExsit(String username);
}
