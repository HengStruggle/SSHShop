package com.demo.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.demo.Dao.CommodityDAO;
import com.demo.Model.Commodity;
import com.demo.Model.CommodityClass;
import com.demo.Page.Page;

public class CommodityDAOImpl implements CommodityDAO{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Commodity findByID(int commodityID) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from Commodity WHERE commodityID = :commodityID");//执行查询
		query.setInteger("commodityID", commodityID);
		 List<Commodity>commodityList =   query.list();		//获得查询结果
		 session.close();
		 
		 if(commodityList.size()==0){
			 return null;
		 }
		 else return (Commodity)commodityList.get(0);//返回记录数
	}
	
	@SuppressWarnings("unchecked")
	public List<Commodity> findAll(Page page) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from Commodity");//执行查询
		query.setFirstResult(page.getBeginIndex());	//设置查询起点位置
		query.setMaxResults(page.getEveryPage());	//设置查询最大值
		 List<Commodity>commodityList =   query.list();		//获得查询结果
		 session.close();
		 return commodityList;
	}
	public void save(Commodity commodity) {
		Session session = sessionFactory.openSession();		//获得session对象
		session.save(commodity);//保存实体
		session.flush();
		session.close();
	}
	
	public void update(Commodity commodity) {
		Session session = sessionFactory.openSession();		//获得session对象
		session.update(commodity);//保存实体
		session.flush();
		session.close();
	}
	
	public int findAllCount() {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from Commodity");//执行查询
		 List<Commodity>commodityList =   query.list();		//获得查询结果
		 session.close();
		return commodityList.size();//返回记录数
	}
	public void delete(int commodityID) {	//删除商品信息
		Commodity commodity = findByID(commodityID);
		if(commodity!=null){
			Session session = sessionFactory.openSession();
			session.delete(commodity);
			session.flush();
			session.close();
		}
	}
	public List<Commodity> findByTime(int num) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery
			("from Commodity order by regTime desc");//执行查询
		query.setFirstResult(0);	//设置查询起点位置
		query.setMaxResults(num);	//设置查询最大值
		List<Commodity> commodityList =  query.list();		//查询结果
		session.close();
		return commodityList;
	}

	public List<Commodity> findByClass(CommodityClass commodityClass, Page page) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from Commodity where commodityClass =:commodityClass");//执行查询
		query.setEntity("commodityClass", commodityClass);
		query.setFirstResult(page.getBeginIndex());	//设置查询起点位置
		query.setMaxResults(page.getEveryPage());	//设置查询最大值
		List<Commodity> commodityList =  query.list();		//查询结果
		session.close();
		return commodityList;
	}
	public int findAllCount(CommodityClass commodityClass) {
		Session session = sessionFactory.openSession();		//获得session对象
		Query query = session.createQuery("from Commodity where commodityClass =:commodityClass");//执行查询
		query.setEntity("commodityClass", commodityClass);
		List commodityList =  query.list();		//查询结果
		session.close();
		return commodityList.size();
	}
}
