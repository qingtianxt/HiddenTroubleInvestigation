package service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.HiddenDangerDao;
import dao.UserDao;
import domain.HiddenDanger;
import domain.PageBean;
import domain.User;
import domain.hiddenPlaceCount;

@Service("hiddenDangerService")
@Transactional
public class HiddenDangerServiceImpl implements HiddenDangerService {

	@Autowired
	private HiddenDangerDao hiddenDangerDao;
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setHiddenDangerDao(HiddenDangerDao hiddenDangerDao) {
		this.hiddenDangerDao = hiddenDangerDao;
	}

	// 保存隐患信息
	@Override
	public void save(HiddenDanger hiddenDanger) {
		hiddenDangerDao.save(hiddenDanger);
	}

	@Override
	public PageBean<HiddenDanger> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {

		return hiddenDangerDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public HiddenDanger findById(Integer id) {

		return hiddenDangerDao.findById(id);
	}

	@Override
	public void update(HiddenDanger hiddenDanger) {
		hiddenDangerDao.update(hiddenDanger);
	}

	@Override
	public void delete(HiddenDanger hiddenDanger) {
		hiddenDangerDao.delete(hiddenDanger);
	}

	@Override
	public List<HiddenDanger> findByUserId(Integer id) {
		return hiddenDangerDao.findByUserId(id);
	}

	/**
	 * 根据状态获取隐患信息
	 */
	@Override
	public List<HiddenDanger> getByStatus(int status) {
		return hiddenDangerDao.getByStatus(status);
	}

	@Override
	public List<HiddenDanger> CountByTiaojian(DetachedCriteria criteria) {
		return hiddenDangerDao.CountByTiaojian(criteria);
	}

	@Override
	public Integer[] countByMonth(DetachedCriteria criteria) {
		
		return hiddenDangerDao.countByMonth(criteria);
	}

	/*
	 * @Override public void deleteByCriteria(DetachedCriteria criteria) {
	 * hiddenDangerDao.deleteByCriteria(criteria); }
	 */

}
