package domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 排查标准类，包括隐患编码，排查的内容，地点，等级，排查人和整改负责人
 * 
 * @author wzw
 *
 */
public class StandardInvestigation implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer standardInvestigation_id;// 排查标准编码
	private String info;// 具体内容
	private String content;// 主题
	private String create_date;// 订立时间

	private Place place;
	private Integer fisrtPlace;// 地点分类
	private Grade grade;

	private User user;// 这里是指排查人员

	private User repair;// 整改负责人

	public Integer getStandardInvestigation_id() {
		return standardInvestigation_id;
	}

	public void setStandardInvestigation_id(Integer standardInvestigation_id) {
		this.standardInvestigation_id = standardInvestigation_id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public User getRepair() {
		return repair;
	}

	public void setRepair(User repair) {
		this.repair = repair;
	}

	public Integer getFisrtPlace() {
		return fisrtPlace;
	}

	public void setFisrtPlace(Integer fisrtPlace) {
		this.fisrtPlace = fisrtPlace;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
