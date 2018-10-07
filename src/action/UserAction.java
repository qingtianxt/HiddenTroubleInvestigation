package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import domain.PageBean;
import domain.User;
import service.HiddenDangerService;
import service.UserService;
import utils.DateUtil;
import utils.FastJsonUtil;
import utils.MD5Utils;
import utils.StringUtil;

public class UserAction extends BaseAction implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;

	private String time1;// 寮�濮嬫棩鏈�
	private String time2;// 鎴鏃ユ湡
	private String oldPic;

	public void setOldPic(String oldPic) {
		this.oldPic = oldPic;
	}

	private HiddenDangerService hiddenDangerService;

	public void setHiddenDangerService(HiddenDangerService hiddenDangerService) {
		this.hiddenDangerService = hiddenDangerService;
	}

	private File upload;
	private String uploadFileName;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	private String selectName;

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	private String roleId;

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	private User user = new User();
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return user;
	}

	public String login() {
		String telephone = user.getTelephone();
		String passwotd = user.getPassword();
		User existUser = userService.getByTelephone(telephone);
		if (null != existUser) {
			if (MD5Utils.md5(passwotd).equals(existUser.getPassword())) {

				if (existUser.getRole() != 1) {
					this.setVs("msg", "2");
					return "loginErrorPower";
				}

				ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
				return "loginTrue";
			}
		}
		this.setVs("msg", "1");
		return "loginFalse";
	}

	/**
	 * 锟剿筹拷
	 * 
	 * @return
	 */
	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return LOGIN;
	}

	/**
	 * 鍒嗛〉鑾峰彇
	 * 
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class, "U");// .createCriteria("k.customer","c");
		// 璋冪敤涓氬姟灞�
		int intRoleId = StringUtil.StringToInt(roleId);
		if (intRoleId != 0) {
			criteria.add(Restrictions.eq("role", intRoleId));
			this.setVs("roleId", intRoleId);
		} else {
			criteria.add(Restrictions.ne("role", 0));
		}
		if (null != selectName) {
			criteria.add(Restrictions.like("trueName", "%" + selectName + "%"));
			this.setVs("selectName", selectName);
		}
		PageBean<User> page = userService.findByPage(this.getPageCode(), this.getPageSize(), criteria);

		// 鍘嬫爤
		this.setVs("page", page);
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			if (1 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "1");
			} else if (2 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "2");
			} else if (3 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "3");
			} else if (4 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "4");
			} else if (5 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "5");
			} else if (6 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "6");
			}
		}
		return "page";
	}

	public String initUpdate() {
		user = userService.findById(user.getUser_id());
		return "initUpdate";
	}

	public String update() {
		String result = "success";
		if (uploadFileName != null) {
			result = deleteFile();
		}
		try {
			if (!"false".equals(result)) {
				user.setHeadPortrait(oldPic);
				saveFile();
				userService.update(user);
				return "updateSuccess";
			} else {
				System.out.println("删除旧图片失败");
				return "updateFail";
			}
		} catch (Exception e) {
			return "updateFail";
		}
	}

	public String delete() throws IOException {
		try {
			user = userService.findById(user.getUser_id());
			// List<HiddenDanger> list =
			// hiddenDangerService.findByUserId(user.getId());
			// if (list != null && list.size() > 0) {
			// return "delele1";// 该用户还有隐患信息没有清空
			// }

			oldPic = user.getHeadPortrait();
			deleteFile();
			userService.delete(user);

		} catch (Exception e) {
			return "delete2";// 删除失败
		}

		return "delete";
	}

	public String save() {

		saveFile();

		user.setCreate_date(DateUtil.getDate());
		user.setRole(0);
		user.setPassword(MD5Utils.md5(user.getPassword()));
		userService.save(user);
		this.setVs("msg", "1");

		return "save";
	}

	/**
	 * 鑾峰彇涓汉鐨勮缁嗕俊鎭�
	 * 
	 * @return
	 */
	public String getInfo() {
		user = userService.findById(user.getUser_id());
		return "getInfo";
	}

	public String initchangeWord() {
		user = userService.findById(user.getUser_id());
		return "initchangeWord";
	}

	/**
	 * 鏍规嵁id淇敼鐢ㄦ埛瀵嗙爜
	 * 
	 * @return
	 */
	public String changeWord() {
		userService.changeWord(user.getUser_id(), MD5Utils.md5(user.getPassword()));
		return "changeWord";
	}

	/**
	 * 审核页面
	 * 
	 * @return
	 */
	public String checkByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class, "U");// .createCriteria("k.customer","c");
		// 璋冪敤涓氬姟灞�
		criteria.add(Restrictions.eq("role", 0));
		if (null != time1 && !"".equals(time1)) {
			criteria.add(Restrictions.gt("create_date", time1));
			this.setVs("time1", time1);
		}
		if (null != time2 && !"".equals(time2)) {
			criteria.add(Restrictions.lt("create_date", time2));
			this.setVs("time2", time2);
		}
		if (null != selectName) {
			criteria.add(Restrictions.like("trueName", "%" + selectName + "%"));
			this.setVs("selectName", selectName);
		}
		PageBean<User> page = userService.findByPage(this.getPageCode(), this.getPageSize(), criteria);

		// 鍘嬫爤
		this.setVs("page", page);
		String msg = ServletActionContext.getRequest().getParameter("msg");
		if (null != msg) {
			if (1 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "1");
			} else if (2 == StringUtil.StringToInt(msg)) {
				this.setVs("msg", "2");
			}
		}
		return "check";
	}

	/**
	 * 跳转到用户授权
	 * 
	 * @return
	 */
	public String initauthorization() {
		user = userService.findById(user.getUser_id());
		return "initauthorization";
	}

	public String authorization() {
		userService.update(user);
		String result = "success";
		if (uploadFileName != null) {
			result = deleteFile();
		}
		try {
			if (!"false".equals(result)) {
				user.setHeadPortrait(oldPic);
				saveFile();
				userService.update(user);
				return "authorizateSuccess";
			} else {
				System.out.println("删除旧图片失败");
				return "authorizateFail";
			}
		} catch (Exception e) {
			return "authorizateFail";
		}
	}

	private void saveFile() {
		if (uploadFileName != null) {
			String path = null;
			try {
				ActionContext ac = ActionContext.getContext();
				ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
				path = sc.getRealPath("/");

				File file = new File(path + "headPortrait");
				if (!file.exists()) {
					file.mkdirs();
				}
				String fileName = "headPortrait" + "/" + DateUtil.getTimeName(uploadFileName);
				FileOutputStream os = new FileOutputStream(new File(path + fileName));
				FileInputStream is = new FileInputStream(upload);
				IOUtils.copy(is, os);

				os.close();
				is.close();
				user.setHeadPortrait(fileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

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
				System.out.println("文件不存在");
				return "nothing";
			}
		}

		return "success";
	}

	public String getCheckUp() throws IOException {
		List<User> list = userService.getCheckUp();
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}

	public String getRepair() throws IOException {
		List<User> list = userService.getRepair();
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}

	public String checkByTelephoneAndPasswordForUI() throws IOException {
		String password = user.getPassword();
		user = userService.getByTelephone(user.getTelephone());
		String data = null;
		if (user == null) {
			data = "0";// 0代表该用户不存在
		} else {
			if (user.getPassword().equals(MD5Utils.md5(password))) {
				String jsonString = FastJsonUtil.toJSONString(user);
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(jsonString);
				return null;

			} else {
				data = "1";// 表示密码
			}
		}
		String jsonString = FastJsonUtil.toJSONString(data);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;

	}

	/**
	 * 给前台mui的个人中心提供用户的基本信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getUserByTelephoneForUI() throws IOException {
		user = userService.getByTelephone(user.getTelephone());
		String jsonString = FastJsonUtil.toJSONString(user);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonString);
		return null;
	}

}
