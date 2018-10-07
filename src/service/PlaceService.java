package service;

import java.util.List;

import domain.Place;

public interface PlaceService {

	List<Place> getByParentId(Integer i);

	Place getById(Integer secondPlace);

	void save(Place place);

	List<Place> getAll();

	void update(Place place);

	void delete(Place place);

	Place getByName(String name);
	
}
