package domain;

import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class User {
	private Integer user_id;
	private String telephone;
	private String password;

	private String headPortrait;
	private Integer role;// 1是管理员，2是排查人员，3是维修人员
	private String trueName;// 真实姓名

	private String create_date;// 创建日期

	// 和隐患标准关联排查负责人
	@JSONField(serialize = false)
	private Set<StandardInvestigation> standardInvestigations = new HashSet<>();

	// 和隐患标准管理整改负责人
	@JSONField(serialize = false)
	private Set<StandardInvestigation> standards = new HashSet<>();

	// 隐患关联的排查人
	@JSONField(serialize = false)
	public Set<HiddenDanger> hiddenDangers = new HashSet<HiddenDanger>();

	// 隐患关联的整改人
	@JSONField(serialize = false)
	public Set<HiddenDanger> hiddenDangers2 = new HashSet<HiddenDanger>();

	public String getCreate_date() {
		return create_date;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public Set<HiddenDanger> getHiddenDangers() {
		return hiddenDangers;
	}

	public void setHiddenDangers(Set<HiddenDanger> hiddenDangers) {
		this.hiddenDangers = hiddenDangers;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeadPortrait() {
		return headPortrait;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}

	public User() {
		super();
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public Set<StandardInvestigation> getStandardInvestigations() {
		return standardInvestigations;
	}

	public void setStandardInvestigations(Set<StandardInvestigation> standardInvestigations) {
		this.standardInvestigations = standardInvestigations;
	}

	public Set<StandardInvestigation> getStandards() {
		return standards;
	}

	public void setStandards(Set<StandardInvestigation> standards) {
		this.standards = standards;
	}

	public Set<HiddenDanger> getHiddenDangers2() {
		return hiddenDangers2;
	}

	public void setHiddenDangers2(Set<HiddenDanger> hiddenDangers2) {
		this.hiddenDangers2 = hiddenDangers2;
	}

}
