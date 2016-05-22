package com.demo.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.demo.Dao.CommodityClassDAO;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;

public class CommodityClassDAOImpl  implements CommodityClassDAO{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public List<CommodityClass> findAll(Page page) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from CommodityClass");//执行查询
		query.setFirstResult(page.getBeginIndex());	//设置查询起点位置
		query.setMaxResults(page.getEveryPage());	//设置查询最大值
		List commodityClasses = query.list();
		session.close();
		return commodityClasses;		//返回查询结果
	}
	public void save(CommodityClass commodityclass) {
		//保存实体
		Session session = sessionFactory.openSession();	
		session.save(commodityclass);
		session.flush();
		session.close(); 
	}
	
	@Override
	public void update(CommodityClass commodityclass) {
		Session session = sessionFactory.openSession();	
		session.update(commodityclass);
		session.flush();
		session.close(); 
	}
	
	public int findAllCount() {
		//查询所有记录
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from CommodityClass");//执行查询
		List commodityClasses = query.list();
		session.close();
		return commodityClasses.size();//返回记录数
	}
	@SuppressWarnings("unchecked")
	public List<CommodityClass> findAll() {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from CommodityClass");//执行查询
		List<CommodityClass> commodityClasses = (List<CommodityClass>)query.list();
		session.close();
		
		return commodityClasses;
	}
	public CommodityClass findByID(int commodityClassID) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from CommodityClass WHERE commodityClassID = :commodityClassID ");//执行查询
		query.setInteger("commodityClassID", commodityClassID);
		List commodityClasses = query.list();
		session.close();
		
		if(commodityClasses.size() == 0){
			return null;
		}else{
			return (CommodityClass)commodityClasses.get(0);
		}
	}
}
