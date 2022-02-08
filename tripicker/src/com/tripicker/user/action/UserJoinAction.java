package com.tripicker.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.user.db.UserDAO;
import com.tripicker.user.db.UserDTO;

public class UserJoinAction implements Action{
	
	// 회원가입 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		//System.out.println("UserJoinAction.java 호출");
		// user 객체
		UserDTO user = new UserDTO();
		// 회원가입 페이지로부터 전달된 정보 저장
		user.setId(request.getParameter("id"));
		user.setPass(request.getParameter("pass"));
		user.setName(request.getParameter("name"));
		user.setNickname(request.getParameter("nickname"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender"));
		user.setEmail(request.getParameter("email"));
		user.setAddr(request.getParameter("addr")+request.getParameter("detailAddr")); //주소+상세주소
		System.out.println("M : " +user);
		
		// DAO객체 생성후 회원가입 메서드 실행
		UserDAO udao = new UserDAO();
		udao.joinUser(user);
		System.out.println("M : 회원정보 저장완료");
		
		// 페이지 이동정보 저장
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.tr");
		forward.setRedirect(true);
		
		return forward;
	}
}
