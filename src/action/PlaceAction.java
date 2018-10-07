package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RespectBinding;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import domain.Place;
import domain.place_treeVO;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import service.PlaceService;
import utils.FastJsonUtil;

@Controller("placeAction")
@Scope("prototype")
public class PlaceAction extends BaseAction implements ModelDriven<Place> {

	private static final long serialVersionUID = 1L;

	private Place place = new Place();

	@Override
	public Place getModel() {
		return place;
	}

	private Integer first_id;
	private String fisrt_name;

	@Autowired
	private PlaceService placeService;

	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}

	public void setFirst_id(Integer first_id) {
		this.first_id = first_id;
	}

	public void setFisrt_name(String fisrt_name) {
		this.fisrt_name = fisrt_name;
	}

	public String getFirst() throws IOException {
		List<Place> list = placeService.getByParentId(0);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}

	public String getSecond() throws IOException {

		List<Place> list = placeService.getByParentId(first_id);
		System.out.println(list);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}
	
	/**
	 * 保存地点信息
	 * 
	 * @return
	 */
	public String save() {
		placeService.save(place);
		this.setVs("msg", "1");
		return "save";
	}

	/**
	 * 获取所有节点信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getAll() throws IOException {
		List<Place> list = placeService.getAll();

		List<place_treeVO> l = new ArrayList<>();
		for (Place p : list) {
			place_treeVO p1 = new place_treeVO();
			p1.setId(p.getId() + "");
			p1.setpId(p.getParent_id() + "");
			p1.setName(p.getPlace_name());
			l.add(p1);
		}
		String treeNodeJson = JSONArray.fromObject(l).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(treeNodeJson);

		return null;
	}

	public String getById() {
		place = placeService.getById(place.getId());
		Place p = placeService.getById(place.getParent_id());
		this.setVs("p", p);
		return "getById";
	}

	public String initUpdate() {
		place = placeService.getById(place.getId());
		Place p = placeService.getById(place.getParent_id());
		this.setVs("p", p);
		return "initUpdate";
	}

	public String update() {
		placeService.update(place);
		this.setVs("msg", "1");
		return "update";
	}

	public String delete() {
		place = placeService.getById(place.getId());
		if (place.getParent_id() <= 0) {
			List<Place> list = placeService.getByParentId(place.getId());
			if (list != null && list.size() > 0) {// 说明这个父类还有子类，不能删除
				this.setVs("msg", "2");
				return "deleteFail";
			}

		}
		placeService.delete(place);
		this.setVs("msg", "3");
		return "deleteSuccess";
	}
}
