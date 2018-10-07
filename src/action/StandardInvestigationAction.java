package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import domain.Grade;
import domain.PageBean;
import domain.Place;
import domain.StandardInvestigation;
import domain.User;
import service.GradeService;
import service.PlaceService;
import service.StandardInvestigationService;
import service.UserService;
import utils.DateUtil;
import utils.FastJsonUtil;
import utils.StringUtil;

/**
 * @author wzw
 *
 */
@Controller("standardInvestigationAction")
@Scope("prototype")
public class StandardInvestigationAction extends BaseAction implements ModelDriven<StandardInvestigation> {

	private static final long serialVersionUID = 1L;
	private StandardInvestigation standardInvestigation = new StandardInvestigation();

	@Override
	public StandardInvestigation getModel() {
		return standardInvestigation;
	}

	private Integer firstPlace;
	private Integer secondPlace;

	private String trueName;// 排查人员姓名
	private String repairName;// 整改人员姓名
	private String gradeId;// 隐患等级id
	private Integer standardId;// 标准id

	@Autowired
	private UserService userService;

	@Autowired
	private StandardInvestigationService standardInvestigationService;

	@Autowired
	private PlaceService placeService;

	@Autowired
	private GradeService gradeService;

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public void setStandardInvestigationService(StandardInvestigationService standardInvestigationService) {
		this.standardInvestigationService = standardInvestigationService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setFirstPlace(Integer firstPlace) {
		this.firstPlace = firstPlace;
	}

	public void setSecondPlace(Integer secondPlace) {
		this.secondPlace = secondPlace;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public void setRepairName(String repairName) {
		this.repairName = repairName;
	}

	public void setStandardId(Integer standardId) {
		this.standardId = standardId;
	}

	public String save() {

		User user = userService.findByTrueName(trueName);
		if (null != user) {
			standardInvestigation.setUser(user);
		}
		// 保存地点信息
		if (null != secondPlace) {
			Place place = placeService.getById(secondPlace);
			standardInvestigation.setPlace(place);
		}
		if (null != gradeId) {
			Grade grade = gradeService.getById(StringUtil.StringToInt(gradeId));
			standardInvestigation.setGrade(grade);
		}
		User user2 = userService.findByTrueName(repairName);
		if (null != user2) {
			standardInvestigation.setRepair(user2);
		}
		standardInvestigation.setFisrtPlace(firstPlace);
		standardInvestigation.setCreate_date(DateUtil.getDate());

		standardInvestigationService.save(standardInvestigation);
		this.setVs("msg", "1");
		return "baocun";

	}

	/**
	 * 分页展示隐患标准信息
	 * 
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(StandardInvestigation.class, "S");// .createCriteria("k.customer","c");
		if (null != trueName && !"".equals(trueName)) {
			criteria.add(Restrictions.eq("user.user_id", Integer.parseInt(trueName)));
			this.setVs("trueName", trueName);
		} else {
			this.setVs("trueName", -1);
		}
		if (null != repairName && !"".equals(repairName)) {
			criteria.add(Restrictions.like("repair.user_id", Integer.parseInt(repairName)));
			this.setVs("repairName", repairName);
		} else {
			this.setVs("repairName", -1);
		}
		if (null != gradeId && !"".equals(gradeId)) {
			criteria.add(Restrictions.eq("grade.grade_id", Integer.parseInt(gradeId)));
			this.setVs("gradeId", gradeId);
		} else {
			this.setVs("gradeId", -1);
		}
		PageBean<StandardInvestigation> page = standardInvestigationService.findByPage(this.getPageCode(),
				this.getPageSize(), criteria);

		this.setVs("page", page);
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			int msg1 = StringUtil.StringToInt(msg);
			this.setVs("msg", msg1);
		}
		return "page";
	}

	public String initUpdate() {
		standardInvestigation = standardInvestigationService
				.getById(standardInvestigation.getStandardInvestigation_id());
		this.setVs("standardInvestigation", standardInvestigation);
		this.setVs("place", standardInvestigation.getPlace());
		this.setVs("gradeId", "" + standardInvestigation.getGrade().getGrade_id());
		return "initUpdate";
	}

	public String update() {
		User user = userService.findByTrueName(trueName);
		if (null != user) {
			standardInvestigation.setUser(user);
		}
		// 保存地点信息
		if (null != secondPlace) {
			Place place = placeService.getById(secondPlace);
			standardInvestigation.setPlace(place);
		}
		if (null != gradeId) {
			Grade grade = gradeService.getById(StringUtil.StringToInt(gradeId));
			standardInvestigation.setGrade(grade);
		}
		User user2 = userService.findByTrueName(repairName);
		if (null != user2) {
			standardInvestigation.setRepair(user2);
		}
		System.out.println(standardInvestigation);
		standardInvestigationService.update(standardInvestigation);
		return "update";
	}

	public String delete() {
		standardInvestigation = standardInvestigationService
				.getById(standardInvestigation.getStandardInvestigation_id());
		standardInvestigationService.delete(standardInvestigation);
		return "delete";
	}

	/**
	 * 为前台提供条件查询
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findByPageForUI() throws IOException {
		DetachedCriteria criteria = DetachedCriteria.forClass(StandardInvestigation.class, "S");// .createCriteria("k.customer","c");
		if (null != trueName && !"".equals(trueName)) {
			criteria.add(Restrictions.eq("user.user_id", Integer.parseInt(trueName)));
		}
		if (null != firstPlace) {
			criteria.add(Restrictions.eq("fisrtPlace", firstPlace));
		}
		/*
		 * PageBean<StandardInvestigation> page =
		 * standardInvestigationService.findByPage(this.getPageCode(),
		 * this.getPageSize(), criteria); String jsonString =
		 * FastJsonUtil.toJSONString(page.getBeanList());
		 */

		List<StandardInvestigation> list = standardInvestigationService.findByTiaojian(criteria);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);

		return null;
	}

	/**
	 * 根据id获取标准的信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findByIdForUI() throws IOException {
		standardInvestigation = standardInvestigationService.getById(standardId);
		String jsonString = FastJsonUtil.toJSONString(standardInvestigation);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}
}
