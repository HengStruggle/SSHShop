package com.demo.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.demo.Dao.UserDao;
import com.demo.Model.User;

public class UserDaoImpl implements UserDao{

	private SessionFactory sessionFactory;
	
	@Override
	public User findUserByUsername(String username) {
		Session session = sessionFactory.openSession();
		String hql="from User as  u WHERE u.username=:username";
		Query query = session.createQuery(hql);
		query.setString("username", username);
		
		List list = query.list();
		session.close();
		if(list.size() == 0){
			return null;
		}else{
			return (User)list.get(0);
		}
	}

	@Override
	public User findUserByUserid(Integer userid) {
		Session session = sessionFactory.openSession();
		String hql="from User as  u WHERE u.userid=:userid";
		Query query = session.createQuery(hql);
		query.setInteger("userid", userid);
		
		List list = query.list();
		session.close();
		if(list.size() == 0){
			return null;
		}else{
			return (User)list.get(0);
		}
	}

	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		session.update(user);
		session.flush();
		session.close();
	}

	@Override
	public void saveUser(User user) {
		Session session = sessionFactory.openSession();
		session.save(user);
		session.flush();
		session.close();
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
