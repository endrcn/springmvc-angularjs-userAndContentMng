package com.idbilisim.service;

import java.util.List;

public interface PersistenceService {
	public <T> T select(Class<T> clazz, Long id);
	public void save(Object entity);
	public void update(Object entity);
	public void delete(Object entitiy);
	public <T> List<T> getAllEntities(Class<T> clazz);
	public <T> List<T> getByNamedQuery(String namedQuery,Object entity);
}
