package dao;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.HiddenDanger;
import domain.hiddenPlaceCount;

public interface HiddenDangerDao extends BaseDao<HiddenDanger> {

	List<HiddenDanger> findByUserId(Integer id);

	List<HiddenDanger> getByStatus(int status);

	List<HiddenDanger> CountByTiaojian(DetachedCriteria criteria);

	Integer[] countByMonth(DetachedCriteria criteria);

	/*void deleteByCriteria(DetachedCriteria criteria);*/

}
