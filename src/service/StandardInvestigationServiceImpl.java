package service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.StandardInvestigationDao;
import domain.PageBean;
import domain.StandardInvestigation;

@Service("standardInvestigationService")
@Transactional
public class StandardInvestigationServiceImpl implements StandardInvestigationService {

	@Autowired
	private StandardInvestigationDao standardInvestigationDao;
	
	@Override
	public void save(StandardInvestigation standardInvestigation) {
		standardInvestigationDao.save(standardInvestigation);
	}

	@Override
	public PageBean<StandardInvestigation> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return standardInvestigationDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public StandardInvestigation getById(Integer standardInvestigation_id) {
		return standardInvestigationDao.findById(standardInvestigation_id);
	}

	@Override
	public void update(StandardInvestigation standardInvestigation) {
		standardInvestigationDao.update(standardInvestigation);
	}

	@Override
	public void delete(StandardInvestigation standardInvestigation) {
		standardInvestigationDao.delete(standardInvestigation);
	}

	@Override
	public List<StandardInvestigation> findByTiaojian(DetachedCriteria criteria) {
		// TODO 自动生成的方法存根
		return standardInvestigationDao.findByTiaojian(criteria);
	}


}
