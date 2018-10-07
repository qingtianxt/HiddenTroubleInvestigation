package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import domain.PageBean;

/**
 * �Ժ����е�dao�Ľӿڶ�Ҫ�̳�baseDao�ӿ�
 * �Զ��巺�ͽӿ�
 * @author wzw
 *
 * @param <T>
 */
public interface BaseDao<T> {
	public void save(T t);
	public void delete(T t);
	public void update(T t);
	public T findById(Integer id);
	public List<T> findAll();
	public PageBean<T>findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);
	public Session getSession();
}
