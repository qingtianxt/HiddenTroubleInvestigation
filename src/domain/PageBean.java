package domain;

import java.util.List;

/**
 * ��ҳ��JavaBean
 * 
 * @author Administrator
 */
public class PageBean<T> {

	// ��ǰҳ
	private int pageCode;

	// ��ҳ��
	// private int totalPage;

	// �ܼ�¼��
	private int totalCount;
	// ÿҳ��ʾ�ļ�¼����
	private int pageSize;
	// ÿҳ��ʾ������
	private List<T> beanList;

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	/**
	 * ����getTotalPage() ��ȡ����ҳ�� JavaBean�����Թ涨��totalPage��JavaBean������
	 * ${pageBean.totalPage}
	 * 
	 * @return
	 */
	public int getTotalPage() {
		// ����
		int totalPage = totalCount / pageSize;
		// ˵������
		if (totalCount % pageSize == 0) {
			return totalPage;
		} else {
			return totalPage + 1;
		}
	}

	/*
	 * public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
	 */

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}
}
