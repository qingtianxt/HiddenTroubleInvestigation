package domain;

import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class Place {
	private Integer id;
	private String place_name;
	private Integer parent_id;

	private String longitude;// 经度
	private String latitude;// 纬度

	private String info;// 描述信息

	@JSONField(serialize = false)
	public Set<HiddenDanger> hiddenDangers = new HashSet<HiddenDanger>();

	@JSONField(serialize = false)
	public Set<StandardInvestigation> standardInvestigations = new HashSet<StandardInvestigation>();

	public Set<StandardInvestigation> getStandardInvestigations() {
		return standardInvestigations;
	}

	public void setStandardInvestigations(Set<StandardInvestigation> standardInvestigations) {
		this.standardInvestigations = standardInvestigations;
	}

	public Set<HiddenDanger> getHiddenDangers() {
		return hiddenDangers;
	}

	public void setHiddenDangers(Set<HiddenDanger> hiddenDangers) {
		this.hiddenDangers = hiddenDangers;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "Place [id=" + id + ", place_name=" + place_name + ", parent_id=" + parent_id + ", longitude="
				+ longitude + ", latitude=" + latitude + ", info=" + info + ", hiddenDangers=" + hiddenDangers + "]";
	}

}
