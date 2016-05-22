package com.demo.Test;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.metamodel.MetadataSources;
import org.hibernate.metamodel.source.internal.MetadataImpl;
import org.hibernate.service.ServiceRegistryBuilder;

import com.demo.Model.User;

public class HibernateTest {
	
	public static void main(String[] args){
		
		Configuration cfg = new Configuration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = null;
		Transaction t = null;
//		 ServiceRegistryBuilder builder = new ServiceRegistryBuilder().configure();
//		 builder.applySetting("connection.driver_class", "com.mysql.jdbc.Driver");
//		 builder.applySetting("connection.url", "jdbc:mysql://localhost:3307/test?characterEncoding=UTF-8");
//		 builder.applySetting("connection.username", "root");
//		 builder.applySetting("connection.password", "123");
//		 builder.applySetting("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
//		 builder.applySetting("show_sql", "true"); 
//		
//		 MetadataSources sources = new MetadataSources( builder.buildServiceRegistry() );
//		 sources.addResource("com/demo/Model/User.hbm.xml"); 
//		 
//		 MetadataImpl metadata = (MetadataImpl) sources.buildMetadata();
//		 SessionFactory factory = metadata.getSessionFactoryBuilder().buildSessionFactory(); 
//		 Session session = null;
//		 Transaction t = null;
		
//		try{
//			User user = new User();
//			user.setUsername("Rose");
//			user.setPassword("123");
//			user.setBirthday(new Date());
//			 session = factory.openSession();
//			 t = session.beginTransaction();
//			 session.save(user);
//			 t.commit();
//		}catch(Exception e){
//			t.rollback();
//			e.printStackTrace();
//		}finally{
//			session.close();
//		}
	}
}
	
