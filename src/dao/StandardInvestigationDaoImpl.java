package dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import domain.StandardInvestigation;

@Repository("standardInvestigationDao")
public class StandardInvestigationDaoImpl extends BaseDaoImpl<StandardInvestigation>
		implements StandardInvestigationDao {

	@Override
	public List<StandardInvestigation> findByTiaojian(DetachedCriteria criteria) {
		// TODO 自动生成的方法存根
		return (List<StandardInvestigation>) this.getHibernateTemplate().findByCriteria(criteria);
	}

}
