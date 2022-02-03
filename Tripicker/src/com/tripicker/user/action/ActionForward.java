package com.tripicker.user.action;


public class ActionForward {
	// 페이지 이동시 필요한 정보를 저장
	
	private String path; //페이지 이동정보(주소)
	private boolean isRedirect; //페이지 이동방식(false:forward, true:sendRedirect);
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
