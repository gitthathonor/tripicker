package com.tripicker.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripciker.user.db.UserDAO;
import com.tripciker.user.db.UserDTO;

public class UserJoinAction implements Action{
	
	// 회원가입 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		System.out.println("UserJoinAction.java 호출");
		// mb 객체
		UserDTO user = new UserDTO();
		// 회원가입 페이지로부터 전달된 정보 저장
		user.setId(request.getParameter("id"));
		user.setPass(request.getParameter("pass"));
		user.setName(request.getParameter("name"));
		user.setNickname(request.getParameter("nickname"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender"));
		user.setEmail(request.getParameter("email"));
		user.setAddr(request.getParameter("addr")+request.getParameter("detailAddr"));
		//mb.setRank(디폴트값1);
		//mb.setReg_date(now());
		System.out.println("M : " +user);
		
		// DB에 회원정보 저장
		UserDAO dao = new UserDAO();
		dao.insertUser(user);
		System.out.println("M : 회원정보 저장완료");
		
		// 페이지 이동정보 저장
		ActionForward forward = new ActionForward();
		forward.setPath("./UserLogin.me");
		forward.setRedirect(true);
		
		return forward;
	}
}
