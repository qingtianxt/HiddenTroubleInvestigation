package dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.StandardInvestigation;

public interface StandardInvestigationDao extends BaseDao<StandardInvestigation>{

	List<StandardInvestigation> findByTiaojian(DetachedCriteria criteria);
	
}
