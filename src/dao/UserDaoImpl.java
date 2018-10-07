package dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.HibernateCallback;

import domain.PageBean;
import domain.User;
import utils.PageHibernateCallbackUtils;

/**
 * �־ò㣺�����Լ̳�hibernateDaoSupport
 * 
 * @author wzw
 *
 */
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public List<User> findByPage(Integer pageCode, Integer pageSize, Object[] objects) {
		PageBean<User> page = new PageBean<User>();
		page.setPageCode(pageCode);
		page.setPageSize(pageSize);

		String sql = "from user";
		List<User> list = (List<User>) this.getHibernateTemplate().execute(
				(HibernateCallback<User>) new PageHibernateCallbackUtils(sql, new Object[] {}, pageCode, pageSize));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@Override
	public int getTotalCount(DetachedCriteria criteria) {
		criteria.setProjection(Projections.rowCount());
		List<Number> list = (List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		int totalCount = 0;
		if (list != null && list.size() > 0) {
			totalCount = list.get(0).intValue();
		}
		// ���sql select*from xx
		criteria.setProjection(null);
		return totalCount;
	}

	@Override
	public User getByTrueName(String trueName) {
		List<User> list = (List<User>) getHibernateTemplate().find("from User where trueName=?", trueName);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public User getByTelephone(String telephone) {
		List<User> list = (List<User>) getHibernateTemplate().find("from User where telephone=?", telephone);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<User> getCheckUp() {
		return (List<User>) getHibernateTemplate().find("from User where role=?", 2);
	}

	@Override
	public List<User> getRepair() {
		return (List<User>) getHibernateTemplate().find("from User where role=?", 3);
	}

}
