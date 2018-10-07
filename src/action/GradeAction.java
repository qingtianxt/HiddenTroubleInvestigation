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
import domain.HiddenDanger;
import domain.PageBean;
import service.GradeService;
import utils.DateUtil;
import utils.FastJsonUtil;
import utils.StringUtil;
@Controller("gradeAction")
@Scope("prototype")
public class GradeAction extends BaseAction implements ModelDriven<Grade> {

	private static final long serialVersionUID = 1L;
	private Grade grade = new Grade();

	@Autowired
	private GradeService gradeService;

	private String time1;
	private String time2;

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Grade.class, "g");
		if (null != time1 && !"".equals(time1)) {
			criteria.add(Restrictions.gt("create_date", time1));
			this.setVs("time1", time1);
		}
		if (null != time2 && !"".equals(time2)) {
			criteria.add(Restrictions.lt("create_date", time2));
			this.setVs("time2", time2);
		}
		PageBean<Grade> page = gradeService.findByPage(this.getPageCode(), this.getPageSize(), criteria);
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			int msg1 = StringUtil.StringToInt(msg);
			this.setVs("msg", msg1);
		}
		this.setVs("page", page);

		return "page";
	}

	/**
	 * 添加隐患
	 * 
	 * @return
	 */
	public String add() {
		grade.setCreate_date(DateUtil.getDate());
		gradeService.add(grade);
		return "save";
	}

	public String delete() {
		gradeService.delete(grade);
		return "delete";
	}

	/**
	 * 携带信息跳转到修改页面
	 * @return
	 */
	public String initUpdate() {
		grade = gradeService.getById(grade.getGrade_id());
		this.setVs("grade", grade);
		return "initUpdate";
	}

	public String update() {
		gradeService.update(grade);
		return "update";
	}
	
	public String getGrade() throws IOException {
		List<Grade> list=gradeService.findAll();
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}
	

	@Override
	public Grade getModel() {
		return grade;
	}

}
