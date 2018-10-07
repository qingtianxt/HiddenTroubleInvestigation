package dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import domain.PageBean;

@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	private Class clazz;

	public BaseDaoImpl() {
		// this��ʾ�����࣬c��ʾ����CustomerDaoImpl��Class����
		Class c = this.getClass();
		// �ڶ�������ȡ����BaseDaoImpl<Customer>
		Type type = c.getGenericSuperclass();

		// Ŀ�ģ���type�ӿ�ת�����ӽӿ�
		ParameterizedType ptype = (ParameterizedType) type;

		// ��ȡ��Customer
		Type[] types = ptype.getActualTypeArguments();
		this.clazz = (Class) types[0];

	}

	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	@Override
	public T findById(Integer id) {

		return (T) this.getHibernateTemplate().get(clazz, id);
	}

	@Override
	public List<T> findAll() {
		return (List<T>) this.getHibernateTemplate().find("from " + clazz.getSimpleName());
	}

	@Override
	public PageBean<T> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<T> page = new PageBean<T>();
		page.setPageCode(pageCode);
		page.setPageSize(pageSize);

		// ���ò�ѯ�ۺϺ�����sql�Ѿ������select count(*) from
		criteria.setProjection(Projections.rowCount());
		List<Number> list = (List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if (list != null && list.size() > 0) {
			int totalCount = list.get(0).intValue();
			// �ܼ�¼��
			page.setTotalCount(totalCount);
		}
		// ���sql select*from xx
		criteria.setProjection(null);
		List<T> beanList = (List<T>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode - 1) * pageSize,
				pageSize);
		// ÿҳ��ʾ������
		page.setBeanList(beanList);

		return page;
	}

	@Override
	public Session getSession() {
		return this.getSessionFactory().getCurrentSession();
	}

	@Resource
	public void setSessionFacotry(SessionFactory sessionFacotry) {
		super.setSessionFactory(sessionFacotry);
	}

}
