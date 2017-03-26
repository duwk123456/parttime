package com.portalmgr.common;


/**
 * 需要查询的分页的Vo实体继承此类
 * @author duwk
 * @date： 日期：2016-11-17 时间：下午4:22:57
 */
public class CommBean {
	// 第page页
	private Integer page;
	// 每页rows行
	private Integer rows;
	// 计算得到 开始行
	private Integer beginRowNum;
	
	private Integer isPage;

	
	
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getBeginRowNum() {
		return beginRowNum;
	}

	public void setBeginRowNum(Integer beginRowNum) {
		this.beginRowNum = beginRowNum;
	}

	public Integer getIsPage() {
		return isPage;
	}

	public void setIsPage(Integer isPage) {
		this.isPage = isPage;
	}
	
	
	public void setStartRow(){
		this.beginRowNum =this.rows * (this.page - 1);
	}
}
