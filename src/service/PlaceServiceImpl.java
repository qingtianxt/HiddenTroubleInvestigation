package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PlaceDao;
import domain.Place;

@Service("placeService")
@Transactional
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao placeDao;

	public void setPlaceDao(PlaceDao placeDao) {
		this.placeDao = placeDao;
	}

	@Override
	public List<Place> getByParentId(Integer i) {

		return placeDao.getByParentId(i);
	}

	@Override
	public Place getById(Integer secondPlace) {
		return placeDao.findById(secondPlace);
	}

	@Override
	public void save(Place place) {
		placeDao.save(place);
	}

	@Override
	public List<Place> getAll() {

		return placeDao.findAll();
	}

	@Override
	public void update(Place place) {
		placeDao.update(place);
	}

	@Override
	public void delete(Place place) {
		placeDao.delete(place);
	}

	@Override
	public Place getByName(String name) {
		return placeDao.getByName(name);
	}

}
