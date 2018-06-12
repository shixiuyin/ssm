package com.hzit.bean;

public class Users {

	private Integer userId;
	private String userName;
	private String userPwd;
	private Integer userAge;
	private String userSex;
	private String userAddr;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userAge=" + userAge
				+ ", userSex=" + userSex + ", userAddr=" + userAddr + "]";
	}

	public Users(Integer userId, String userName, String userPwd, Integer userAge, String userSex, String userAddr) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userAge = userAge;
		this.userSex = userSex;
		this.userAddr = userAddr;
	}

	public Users() {
		super();
	}

}
