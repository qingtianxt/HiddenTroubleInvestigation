package service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.PageBean;
import domain.StandardInvestigation;

public interface StandardInvestigationService {

	void save(StandardInvestigation standardInvestigation);

	PageBean<StandardInvestigation> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	StandardInvestigation getById(Integer standardInvestigation_id);

	void update(StandardInvestigation standardInvestigation);

	void delete(StandardInvestigation standardInvestigation);

	List<StandardInvestigation> findByTiaojian(DetachedCriteria criteria);

	
}
