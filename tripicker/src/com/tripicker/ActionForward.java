package com.tripicker;

public class ActionForward {
	// 페이지를 이동할 때 필요한 정보를 저장하는 객체
	// 1) 페이지 이동 정보(주소)
	// 2) 페이지 이동방식
	
	private String path; //경로
	private boolean isRedirect; //true는 sendRedirect 방식, false는 forward 방식
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { //getter()
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	@Override
	public String toString() {
		return "ActionForward [path=" + path + ", isRedirect=" + isRedirect + "]";
	}
	
	
}
