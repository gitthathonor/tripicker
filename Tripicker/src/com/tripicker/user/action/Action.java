package com.tripicker.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// DB처리동작 필요시 사용하는 객체
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws Exception;
	

}
