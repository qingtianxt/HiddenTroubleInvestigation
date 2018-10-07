package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * action����
 * @author wzw
 *
 */
public class BaseAction extends ActionSupport{

	private Integer pageCode = 1;
	
	//���������ķ�ʽ
	public void setPageCode(Integer pageCode) {
		if(pageCode==null){
			pageCode=1;
		}
		this.pageCode = pageCode;
	}
	private Integer pageSize=5;
	
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	public Integer getPageCode() {
		return pageCode;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	/**
	 * ����ֵջ�����set����
	 */
	public void setVs(String key,Object obj){
		ActionContext.getContext().getValueStack().set(key, obj);
	}
	/**
	 * ����ֵջ��push����
	 * @param obj
	 */
	public void pushVs(Object obj){
		ActionContext.getContext().getValueStack().push(obj);
	}
}
