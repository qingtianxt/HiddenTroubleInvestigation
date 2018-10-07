package dao;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.stereotype.Repository;

import domain.HiddenDanger;

@Repository("hiddenDangerDao")
public class HiddenDangerDaoImpl extends BaseDaoImpl<HiddenDanger> implements HiddenDangerDao {

	@Override
	public List<HiddenDanger> findByUserId(Integer id) {
		List<HiddenDanger> list = (List<HiddenDanger>) this.getHibernateTemplate().find("from HiddenDanger where user_id=?", id);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public Session getSession(){
		return this.getHibernateTemplate().getSessionFactory().getCurrentSession();
	}

	@Override
	public List<HiddenDanger> getByStatus(int status) {
		List<HiddenDanger> list = (List<HiddenDanger>) getHibernateTemplate().find("from HiddenDanger where status=?", status);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	//先找出分类的地点id，
	@Override
	public List<HiddenDanger> CountByTiaojian(DetachedCriteria criteria) {
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.rowCount());
		proList.add(Projections.groupProperty("fisrtPlace"));
		criteria.setProjection(proList);
		//List<HiddenDanger> list= (List<HiddenDanger>) this.getHibernateTemplate().findByCriteria(criteria);
		//System.out.println(list.get(0).getFisrtPlace());
		return (List<HiddenDanger>) this.getHibernateTemplate().findByCriteria(criteria);
		//return null;
	}

	@Override
	public Integer[] countByMonth(DetachedCriteria criteria) {
		criteria.setProjection(Projections.rowCount());
		Calendar cal=Calendar.getInstance(); 
		int year = cal.get(Calendar.YEAR);
		String compareMinMonth=year+"-";
		String compareMaxMonth=year+"-";
		
		Integer[] countByMonth=new Integer[12];
		for(int i=1;i<13;i++) {
			if(i<=9) {
				compareMinMonth+="0"+i+"-00 00:00:00";
				
				criteria.add(Restrictions.ge("upload_date", compareMinMonth));
				if(i!=9) {
					compareMaxMonth+="0"+(i+1)+"-00 00:00:00";
				}else {
					compareMaxMonth+=(i+1)+"-00 00:00:00";
				}
				criteria.add(Restrictions.le("upload_date", compareMaxMonth));
			}else {
				compareMinMonth+=i+"-00 00:00:00";
				compareMaxMonth+=(i+1)+"-00 00:00:00";
				criteria.add(Restrictions.ge("upload_date", compareMinMonth));
				criteria.add(Restrictions.le("upload_date", compareMaxMonth));
			}
			System.out.println(compareMinMonth);
			System.out.println(compareMaxMonth);
			List<Number> list = (List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
			if (list != null && list.size() > 0) {
				countByMonth[i-1] = list.get(0).intValue();
			}
			
			compareMinMonth=year+"-";
			compareMaxMonth=year+"-";
			eraseCriteria(criteria);
		}
		
		return countByMonth;
	}
	
	/*
	 * @Override public void deleteByCriteria(DetachedCriteria criteria) {
	 * List<HiddenDanger> list = (List<HiddenDanger>)
	 * this.getHibernateTemplate().findByCriteria(criteria); if (list != null) {
	 * for (HiddenDanger hiddenDanger : list) {
	 * this.getHibernateTemplate().delete(hiddenDanger); } } }
	 */
	/**
	 * 清空离线的criteria
	 * @param dc
	 */
	private void eraseCriteria(DetachedCriteria dc) {
        try {
            Field impl = dc.getClass().getDeclaredField("impl");
            impl.setAccessible(true);

            // 得到实现类
            CriteriaImpl cimpl = (CriteriaImpl) impl.get(dc);
            
            // 思路二: 再次反射, 直接将criterionEntries置空.
            // 获取criterionEntries属性
            Field criterionEntries = cimpl.getClass().getDeclaredField("criterionEntries");
            criterionEntries.setAccessible(true);
            // 重置条件list
            criterionEntries.set(cimpl, new ArrayList());

        
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        
    }

}
