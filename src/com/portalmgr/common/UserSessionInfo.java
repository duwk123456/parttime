package com.portalmgr.common;

import java.io.Serializable;

public class UserSessionInfo implements Serializable {

	private static final long serialVersionUID = -3054591104926661617L;

	private int userId;
	private String userName;
	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
