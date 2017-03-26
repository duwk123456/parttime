package com.portalmgr.sys.entity;



public class DictDef{
	private static final long serialVersionUID = -2263171405754895768L;
	/**
	 * String dict_type ：字典类型
	 */
	private String dictType;
	/**
	 * String type_name ：类型名称
	 */
	private String typeName;
	/**
	 * String dict_class ：字典类别
	 */
	private String dictClass;
	/**
	 * String class_name ：类别名称
	 */
	private String className;
	/**
	 * String entity_id ：实体标识
	 */
	private String entryId;
	/**
	 * String parent_entity_id ：父类实体id
	 */
	private String parentEntryId;
	/**
	 * String entity_name ：条目名称
	 */
	private String entryName;
	/**
	 * String entity_desc ：条目描述
	 */
	private String entryDesc;



	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDictClass() {
		return dictClass;
	}

	public void setDictClass(String dictClass) {
		this.dictClass = dictClass;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public String getParentEntryId() {
		return parentEntryId;
	}

	public void setParentEntryId(String parentEntryId) {
		this.parentEntryId = parentEntryId;
	}

	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public String getEntryDesc() {
		return entryDesc;
	}

	public void setEntryDesc(String entryDesc) {
		this.entryDesc = entryDesc;
	}
}
