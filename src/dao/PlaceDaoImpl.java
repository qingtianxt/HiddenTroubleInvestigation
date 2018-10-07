package dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import domain.Place;

@Repository("placeDao")
public class PlaceDaoImpl extends BaseDaoImpl<Place> implements PlaceDao {

	@Override
	public List<Place> getByParentId(Integer i) {
		return (List<Place>) getHibernateTemplate().find("from Place where parent_id=?", i);
	}

	@Override
	public Place getByName(String name) {
		List<Place> list =(List<Place>)getHibernateTemplate().find("from Place where place_name=?", name);
		if(list.size()>0&&null!=list) {
			return list.get(0);
		}else {
			return null;
		}
	}

}
