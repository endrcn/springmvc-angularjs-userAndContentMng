package com.idbilisim.service;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class PersistenceServiceImpl implements PersistenceService {

	public <T> T select(Class<T> clazz, Long id) {
		Session session = openSession();
		try{
			return (T) session.get(clazz, id);
		}finally{
			session.close();
		}
	}

	public void save(Object entity) {
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(entity);
			transaction.commit();
		} catch (Exception e) {
			System.err.println("Kayıt işlemi sırasında hata oluştu"+e.getMessage());
			transaction.rollback();
		}finally{
			session.close();
		}
		
	}

	public void update(Object entity) {
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(entity);
			transaction.commit();
		} catch (Exception e) {
			System.err.println("Güncelleme işlemi sırasında hata oluştu"+e.getMessage());
			transaction.rollback();
		}finally{
			session.close();
		}
		
	}

	public void delete(Object entitiy) {
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(entitiy);
			transaction.commit();
		} catch (Exception e) {
			System.err.println("Silme işlemi sırasında hata oluştu"+e.getMessage());
			transaction.rollback();
		}finally{
			session.close();
		}
		
	}

	public <T> List<T> getAllEntities(Class<T> clazz) {
		Session session = openSession();
		Criteria criteria = session.createCriteria(clazz);
		try {
			return criteria.list();
		}finally{
			session.close();
		}
	}

	public <T> List<T> getByNamedQuery(String namedQuery, Object entity) {
		
		Session session = openSession();
		Query query = session.getNamedQuery(namedQuery);
		query.setProperties(entity);
		
		return query.list();
	}
	
	private Session openSession(){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		return session;
	}
	
}
