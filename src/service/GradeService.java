package service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.Grade;
import domain.PageBean;

public interface GradeService {

	PageBean<Grade> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	void add(Grade grade);

	void delete(Grade grade);

	Grade getById(Integer integer);

	void update(Grade grade);

	List<Grade> findAll();

}
