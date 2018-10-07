package service;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import domain.PageBean;
import domain.User;
import utils.MD5Utils;

/**
 * �û���ҵ���
 * 
 * @author wzw
 *
 */
@Transactional
public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<User> page = userDao.findByPage(pageCode, pageSize, criteria);
		return page;
	}

	@Override
	public User findById(Integer id) {

		return userDao.findById(id);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
		
		
		
	}

	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public void changeWord(Integer id, String password) {
		User u1 = userDao.findById(id);
		userDao.getSession().clear();
		u1.setPassword(password);
		userDao.update(u1);
	}

	@Override
	public User findByTrueName(String trueName) {
		return userDao.getByTrueName(trueName);
	}

	@Override
	public User getByTelephone(String telephone) {
		
		return userDao.getByTelephone(telephone);
	}


	@Override
	public List<User> getCheckUp() {
		return userDao.getCheckUp();
	}


	@Override
	public List<User> getRepair() {
		return userDao.getRepair();
	}


}
