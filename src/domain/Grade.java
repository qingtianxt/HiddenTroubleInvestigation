package domain;

import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class Grade {
	private Integer grade_id;
	private String info;
	private String create_date;

	@JSONField(serialize = false)
	private Set<StandardInvestigation> standardInvestigations = new HashSet<StandardInvestigation>();

	@JSONField(serialize = false)
	private Set<HiddenDanger> hiddenDangers = new HashSet<>();

	public Set<StandardInvestigation> getStandardInvestigations() {
		return standardInvestigations;
	}

	public void setStandardInvestigations(Set<StandardInvestigation> standardInvestigations) {
		this.standardInvestigations = standardInvestigations;
	}

	public Integer getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Integer grade_id) {
		this.grade_id = grade_id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCreate_date() {
		return create_date;
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

}
