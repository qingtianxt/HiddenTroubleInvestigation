package dao;

import java.util.List;

import domain.Place;

public interface PlaceDao  extends BaseDao<Place>{

	List<Place> getByParentId(Integer i);

	Place getByName(String name);

}
