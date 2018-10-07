package service;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import domain.PageBean;
import domain.User;

public interface UserService {

	void save(User user);

	PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	User findById(Integer id);

	void update(User user);

	void delete(User user);

	void changeWord(Integer id, String password);

	User findByTrueName(String trueName);

	User getByTelephone(String telephone);

	List<User> getCheckUp();

	List<User> getRepair();
	
}
