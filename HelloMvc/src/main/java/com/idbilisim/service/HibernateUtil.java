package com.idbilisim.service;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	
	private static SessionFactory buildSessionFactory(){
		try {
			Configuration configuration = new Configuration();
			configuration.configure();
			
			ServiceRegistry serviceRegistry = new ServiceRegistryBuilder()
												.applySettings(configuration.getProperties())
												.buildServiceRegistry();
			SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
			return sessionFactory;
		} catch (Exception e) {
			System.err.println("BuildSessionFactory de hata oluştu "+ e );
		}
		return null;
	}
	
	public static SessionFactory getSessionFactory(){
		if(sessionFactory == null)
			sessionFactory = buildSessionFactory();
		return sessionFactory;
	}
	
}
