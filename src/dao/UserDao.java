package dao;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.PageBean;
import domain.User;

public interface UserDao extends BaseDao<User>{

	void save(User user);

	List<User> findByPage(Integer pageCode, Integer pageSize, Object[] objects);

	int getTotalCount(DetachedCriteria criteria);

	User getByTrueName(String trueName);

	User getByTelephone(String telephone);

	List<User> getCheckUp();

	List<User> getRepair();

}
