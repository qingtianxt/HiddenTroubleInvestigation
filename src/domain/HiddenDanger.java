package domain;

//除去基本信息，还要包括隐患标准id（有代表排查，无代表自查）
public class HiddenDanger {
	private Integer hidden_id;
	private String info;// 问题描述
	private Integer status;// 问题处理状态：0：排查人上传未处理 1.整改人已整改,2排查人上传没有问题

	private Integer type;// 隐患类型 0代表自查 1.代表排查
	private String upload_date;
	private Integer checkUpStatus;// 问题检查结果，这个只在排查的时候有，0代表没有问题，1代表有问题
	private Integer fisrtPlace;// 地点分类

	private Grade grade;// 隐患等级
	private Place place;
	private User user;
	private User repair;

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public Integer getHidden_id() {
		return hidden_id;
	}

	public void setHidden_id(Integer hidden_id) {
		this.hidden_id = hidden_id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public HiddenDanger() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getRepair() {
		return repair;
	}

	public void setRepair(User repair) {
		this.repair = repair;
	}

	public Integer getCheckUpStatus() {
		return checkUpStatus;
	}

	public void setCheckUpStatus(Integer checkUpStatus) {
		this.checkUpStatus = checkUpStatus;
	}

	public Integer getFisrtPlace() {
		return fisrtPlace;
	}

	public void setFisrtPlace(Integer fisrtPlace) {
		this.fisrtPlace = fisrtPlace;
	}

	@Override
	public String toString() {
		return "HiddenDanger [hidden_id=" + hidden_id + ", info=" + info + ", status=" + status + ", type=" + type
				+ ", upload_date=" + upload_date + ", checkUpStatus=" + checkUpStatus + ", fisrtPlace=" + fisrtPlace
				+ ", grade=" + grade + ", place=" + place + ", user=" + user + ", repair=" + repair + "]";
	}

}
