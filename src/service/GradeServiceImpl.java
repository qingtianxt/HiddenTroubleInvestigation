package service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.GradeDao;
import domain.Grade;
import domain.PageBean;

@Service("gradeService")
@Transactional
public class GradeServiceImpl implements GradeService {

	@Autowired
	private GradeDao gradeDao;

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	@Override
	public PageBean<Grade> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return gradeDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public void add(Grade grade) {
		gradeDao.save(grade);
	}

	@Override
	public void delete(Grade grade) {
		gradeDao.delete(grade);
	}

	@Override
	public Grade getById(Integer id) {
		return gradeDao.findById(id);
	}

	@Override
	public void update(Grade grade) {
		gradeDao.update(grade);
	}

	@Override
	public List<Grade> findAll() {
		return gradeDao.findAll();
	}


}
