package com.tripicker.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;

public class AdminMemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("A : AdminMemberListAction_execute() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/memberList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
