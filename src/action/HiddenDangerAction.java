package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import domain.Grade;
import domain.HiddenDanger;
import domain.PageBean;
import domain.Place;
import domain.StandardInvestigation;
import domain.User;
import domain.hiddenPlaceCount;
import service.GradeService;
import service.HiddenDangerService;
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
/**
 * @author wzw
 *
 */
@Controller("hiddenDangerAction")
@Scope("prototype")
public class HiddenDangerAction extends BaseAction implements ModelDriven<HiddenDanger> {

	private static final long serialVersionUID = 1L;
	private HiddenDanger hiddenDanger = new HiddenDanger();

	public void setHiddenDangerService(HiddenDangerService hiddenDangerService) {
		this.hiddenDangerService = hiddenDangerService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// dsf
	private String time1;// 寮�濮嬫棩鏈�
	private String time2;// 鎴鏃ユ湡

	private String sta;// 状态

	private File upload;
	private String uploadFileName;
	private String oldPic;

	private Integer firstPlace;
	private Integer secondPlace;
	private Integer gradeId;

	private Integer userId;
	private Integer repairId;
	private Integer length;
	private String ids;

	private String trueName;// 添加隐患时的真实姓名
	private Integer typeId;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
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

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	@Override
	public HiddenDanger getModel() {
		return hiddenDanger;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public void setSta(String sta) {
		this.sta = sta;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setRepairId(Integer repairId) {
		this.repairId = repairId;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Autowired
	private PlaceService placeService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private UserService userService;
	@Autowired
	private HiddenDangerService hiddenDangerService;
	@Autowired
	private StandardInvestigationService standardInvestigationService;

	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public String save() {
		try {
			// 保存图片
			String fileName = saveFile();

			// 保存地点信息
			if (secondPlace != null) {
				Place place = placeService.getById(secondPlace);
				hiddenDanger.setPlace(place);
			}
			hiddenDanger.setStatus(0);
			hiddenDanger.setUpload_date(DateUtil.getDate());
			// 保存用户信息
			User user = userService.findByTrueName(trueName);
			if (user.getRole() == 2) {
				hiddenDangerService.save(hiddenDanger);
			} else if (user.getRole() == 3) {
				// hiddenDanger.getExecute1().add(user);
			}

			this.setVs("msg", "1");
		} catch (Exception e) {
			this.setVs("msg", "2");
		}
		return "save";
	}

	/**
	 * 分页获取上传的排查信息，用来审核
	 * 
	 * @return
	 */
	public String checkByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(HiddenDanger.class, "h");
		if (null != time1 && !"".equals(time1)) {
			criteria.add(Restrictions.gt("upload_date", time1));
			this.setVs("time1", time1);
		}
		if (null != time2 && !"".equals(time2)) {
			criteria.add(Restrictions.lt("upload_date", time2));
			this.setVs("time2", time2);
		}
		criteria.add(Restrictions.eq("status", 0));
		PageBean<HiddenDanger> page = hiddenDangerService.findByPage(this.getPageCode(), this.getPageSize(), criteria);
		
		System.out.println(page.getBeanList());
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			if (1 == StringUtil.StringToInt(msg)) {// 审核成功
				this.setVs("msg", "1");
			}
		}
		this.setVs("page", page);
		return "page";
	}

	/**
	 * 手机获取上传的排查信息，用来审核
	 * 
	 * @return
	 */
	public String getCheck() {
		int status = 0;
		List<HiddenDanger> list = hiddenDangerService.getByStatus(status);
		String jsonString = JSON.toJSONString(list);
		// JsonConfig config = JsonFilter.getFilter(new String[]{"checkUp"});
		// JSONArray jsonArray = JSONArray.fromObject(list,config);
		// String jsonString = jsonArray.toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		// response.setHeader("Access-Control-Allow-Origin", "*");
		FastJsonUtil.write_json(response, jsonString);
		System.out.println(jsonString);

		return null;
	}

	public String initUpdate() {

		hiddenDanger = hiddenDangerService.findById(hiddenDanger.getHidden_id());
		Integer place_id = hiddenDanger.getPlace().getId();
		if (place_id != null) {
			if (place_id > 9 && place_id != 91) {
				secondPlace = place_id;
				firstPlace = hiddenDanger.getPlace().getParent_id();

				Place first_Place = placeService.getById(firstPlace);
				Place second_Place = hiddenDanger.getPlace();

				this.setVs("first_Place", first_Place);
				this.setVs("second_Place", second_Place);

			} else {
				firstPlace = place_id;
				Place first_Place = hiddenDanger.getPlace();
				this.setVs("first_Place", first_Place);
			}

		}
		return "initUpdate";
	}

	public String findById() {

		hiddenDanger = hiddenDangerService.findById(hiddenDanger.getHidden_id());
		return "findById";
	}

	public String update() throws Exception {
		String result = "success";
		if (uploadFileName != null) {
			result = deleteFile();
		}

		try {
			if (!"false".equals(result)) {
				saveFile();
				if (secondPlace != null) {
					Place place = placeService.getById(secondPlace);
					hiddenDanger.setPlace(place);
				}
				System.out.println(hiddenDanger.toString());
				hiddenDangerService.update(hiddenDanger);
				return "updateSuccess";
			} else {
				return "updateFail";
			}
		} catch (Exception e) {
			return "updateFail";
		}
	}

	public String delete() throws IOException {
		try {
			// oldPic = hiddenDanger.getPicture();
			// deleteFile();
			hiddenDanger = hiddenDangerService.findById(hiddenDanger.getHidden_id());
			hiddenDangerService.delete(hiddenDanger);
		} catch (Exception e) {
			return "deleteFail";
		}
		return "deleteSuccess";
	}

	/**
	 * 根据id获取隐患信息，并跳转到排查的审核页面
	 * 
	 * @return
	 */
	public String checkUpById() {
		hiddenDanger = hiddenDangerService.findById(hiddenDanger.getHidden_id());
		return "checkUpById";
	}

	/**
	 * 根据id和status更新隐患信息
	 * 
	 * @return
	 */
	public String updateStatus() {
		hiddenDanger = hiddenDangerService.findById(hiddenDanger.getHidden_id());
		hiddenDanger.setStatus(1);
		hiddenDangerService.update(hiddenDanger);
		return "updateStatus";
	}

	/**
	 * 保存图片
	 * 
	 * @return
	 */
	private String saveFile() {
		String fileName = "";
		if (uploadFileName != null) {
			String monthName = DateUtil.getMonthStr();
			String path = null;
			try {
				ActionContext ac = ActionContext.getContext();
				ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
				path = sc.getRealPath("/");

				File file = new File(path + monthName);
				if (!file.exists()) {
					file.mkdirs();
				}
				fileName = monthName + "/" + DateUtil.getTimeName(uploadFileName);
				FileOutputStream os = new FileOutputStream(new File(path + fileName));
				FileInputStream is = new FileInputStream(upload);
				IOUtils.copy(is, os);

				os.close();
				is.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}

	/**
	 * 删除图片
	 * 
	 * @return
	 */
	private String deleteFile() {

		if (oldPic != null) {

			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/");
			File file = new File(path + oldPic);
			if (file.exists() && file.isFile()) {
				if (file.delete()) {
					return "success";
				} else {
					return "false";
				}
			} else {
				return "nothing";
			}
		}
		return "success";
	}

	public String getOldPic() {
		return oldPic;
	}

	public void setOldPic(String oldPic) {
		this.oldPic = oldPic;
	}

	/**
	 * 用户上传过来的用户自查隐患
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveForUI() throws IOException {
		if (null != secondPlace) {
			Place place = placeService.getById(secondPlace);
			hiddenDanger.setPlace(place);
			hiddenDanger.setFisrtPlace(place.getParent_id());
		}
		if (null != gradeId) {
			Grade grade = gradeService.getById(gradeId);
			hiddenDanger.setGrade(grade);
		}
		if (null != userId) {
			User user = userService.findById(userId);
			hiddenDanger.setUser(user);
		}
		if (null != repairId) {
			User repair = userService.findById(repairId);
			hiddenDanger.setRepair(repair);
		}
		hiddenDanger.setStatus(0);
		hiddenDanger.setUpload_date(DateUtil.getDate());

		hiddenDangerService.save(hiddenDanger);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append("1");
		return null;
	}

	/**
	 * 排查时批量上传没有问题的排查信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveCheckUpForUI() throws IOException {
		String[] split = ids.split(",");
		// 先判断传过来的数据长度是否相等,不相等说明数据错误
		if (split.length != length) {
			return null;
		} else {
			for (int i = 0; i < split.length; i++) {
				// 先查询标准获取相关信息，然后再设置所排查的隐患的状态
				StandardInvestigation standardInvestigation = standardInvestigationService
						.getById(StringUtil.StringToInt(split[i]));
				HiddenDanger hiddenDanger1 = new HiddenDanger();
				hiddenDanger1.setInfo("经排查后没有发现问题");
				hiddenDanger1.setType(1);
				hiddenDanger1.setUpload_date(DateUtil.getDate());
				hiddenDanger1.setCheckUpStatus(0);
				hiddenDanger1.setFisrtPlace(standardInvestigation.getFisrtPlace());
				hiddenDanger1.setGrade(standardInvestigation.getGrade());
				hiddenDanger1.setPlace(standardInvestigation.getPlace());
				hiddenDanger1.setUser(standardInvestigation.getUser());
				hiddenDanger1.setRepair(standardInvestigation.getRepair());
				hiddenDanger1.setStatus(2);
				hiddenDangerService.save(hiddenDanger1);
			}
		}
		String jsonString = FastJsonUtil.toJSONString("success");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}

	/**
	 * 条件查询 学会了调用关联的类的属性作为查询条件 采取的方式是inner join
	 * 
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(HiddenDanger.class, "H");// .createCriteria("H.user","u");
		if (null != time1 && !"".equals(time1)) {
			criteria.add(Restrictions.ge("upload_date", time1));
			this.setVs("time1", time1);
		}
		if (null != time2 && !"".equals(time2)) {
			System.out.println(time2);
			criteria.add(Restrictions.le("upload_date", time2));
			this.setVs("time2", time2);
		}
		if (null != sta && !"".equals(sta)) {
			criteria.add(Restrictions.eq("status", Integer.parseInt(sta)));
			this.setVs("sta", sta);
		}
		if (null != typeId) {
			System.out.println(typeId);
			criteria.add(Restrictions.eq("type", typeId));
			this.setVs("typeId", typeId);
		}
		if (null != trueName && !"".equals(trueName)) {
			System.out.println(trueName);
			criteria = criteria.createCriteria("user");
			criteria.add(Restrictions.like("trueName", "%" + trueName + "%"));
			this.setVs("trueName", trueName);
		}
		PageBean<HiddenDanger> page = hiddenDangerService.findByPage(this.getPageCode(), this.getPageSize(), criteria);

		this.setVs("page", page);
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			int msg1 = StringUtil.StringToInt(msg);
			this.setVs("msg", msg1);
		}
		return "page";
	}

	/**
	 * 地点统计加条件
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getPlaceCount() throws IOException {
		DetachedCriteria criteria = DetachedCriteria.forClass(HiddenDanger.class, "H");
		if (null != time1 && !"".equals(time1)) {
			criteria.add(Restrictions.ge("upload_date", time1));
			this.setVs("time1", time1);
		}
		List<HiddenDanger> list = hiddenDangerService.CountByTiaojian(criteria);
		List<hiddenPlaceCount> l = new ArrayList<>();
		if (list != null) {
			String jsonString = FastJsonUtil.toJSONString(list);
			System.out.println(jsonString);
			String[] split = jsonString.split(",");
			int m = 0;
			hiddenPlaceCount h = new hiddenPlaceCount();// 先初始化一个存储的实体对象
			Integer totalCount = 0;// 软件的总量
			Integer fisrtPlaceId = 0;
			for (int i = 0; i < split.length; i++) {// 遍历数组

				if (i % 2 == 0) {
					totalCount = StringUtil.StringToInt(split[i].replace("[", ""));
					h.setTotalCount(totalCount);
				} else {
					fisrtPlaceId = StringUtil.StringToInt(split[i].replace("]", ""));
					Place byId = placeService.getById(fisrtPlaceId);
					h.setFirstPlace(fisrtPlaceId);
					h.setPlace(byId);
				}
				m += 1;
				if (m >= 2) {// 将每两个数据存储到实体对象中
					l.add(h);
					h = new hiddenPlaceCount();
					m = 0;
				}
			}
			String jsonString1 = FastJsonUtil.toJSONString(l);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response.getWriter().append(jsonString1);
		}

		return null;
	}
	/**
	 * 根据月份统计隐患
	 * @return
	 * @throws IOException
	 */
	public String getTimeCount() throws IOException {
		DetachedCriteria criteria = DetachedCriteria.forClass(HiddenDanger.class, "H");
		
		Integer[] monthCount=hiddenDangerService.countByMonth(criteria);
		String jsonString = FastJsonUtil.toJSONString(monthCount);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		System.out.println(jsonString);
		return null;
	}
	

}
