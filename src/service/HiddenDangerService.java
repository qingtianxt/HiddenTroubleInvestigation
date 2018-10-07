package service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.HiddenDanger;
import domain.PageBean;
import domain.hiddenPlaceCount;

public interface HiddenDangerService {

	void save(HiddenDanger hiddenDanger);

	PageBean<HiddenDanger> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	HiddenDanger findById(Integer id);

	void delete(HiddenDanger hiddenDanger);

	void update(HiddenDanger hiddenDanger);

	List<HiddenDanger> findByUserId(Integer id);

	List<HiddenDanger> getByStatus(int status);

	List<HiddenDanger> CountByTiaojian(DetachedCriteria criteria);

	Integer[] countByMonth(DetachedCriteria criteria);

	/*void deleteByCriteria(DetachedCriteria criteria);*/

}
