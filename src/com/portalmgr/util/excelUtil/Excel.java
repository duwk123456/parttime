/**   
 * Copyright ® 2012 Newland Sci.&Tech.Co.,Ltd
 * All right reserved.
 * 项目名称：MPayWeb   
 * 类名：Excel.java
 * 类描述：EXCEL 实体BEAN对应注解中的相应字段
 * 作者：SuShiting email: sust@newlandcomputer.com   
 * 创建日期：2013-3-11 下午4:08:11   
 * 修改者：
 * 修改日期：
 * @version    
 */
package com.portalmgr.util.excelUtil;

public class Excel implements Comparable<Excel> {

	private String excelTitle;
	private String columnTitle;
	private String columnName;
	private int columnWidth;
	private int columnIndex;

	public Excel() {
		super();
	}

	public String getExcelTitle() {
		return excelTitle;
	}

	public void setExcelTitle(String excelTitle) {
		this.excelTitle = excelTitle;
	}

	public String getColumnTitle() {
		return columnTitle;
	}

	public void setColumnTitle(String columnTitle) {
		this.columnTitle = columnTitle;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public int getColumnWidth() {
		return columnWidth;
	}

	public void setColumnWidth(int columnWidth) {
		this.columnWidth = columnWidth;
	}

	public int getColumnIndex() {
		return columnIndex;
	}

	public void setColumnIndex(int columnIndex) {
		this.columnIndex = columnIndex;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + columnIndex;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Excel other = (Excel) obj;
		if (columnIndex != other.columnIndex)
			return false;
		return true;
	}

	public int compareTo(Excel o) {
		// TODO Auto-generated method stub
		return columnIndex - o.getColumnIndex();
	}

	@Override
	public String toString() {
		return "Excel [excelTitle=" + excelTitle + ", columnTitle=" + columnTitle + ", columnWidth=" + columnWidth + ", columnIndex=" + columnIndex + "]";
	}
}
