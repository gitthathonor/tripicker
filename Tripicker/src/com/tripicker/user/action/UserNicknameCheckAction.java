package com.tripicker.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.tripicker.user.db.UserDAO;

public class UserNicknameCheckAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// 회원가입 폼에서 입력받은 닉네임 저장
		String nickname = request.getParameter("nickname");
		PrintWriter out = response.getWriter();
		
		// DAO 객체호출
		UserDAO dao = new UserDAO();
		
		// 중복x -> "ok"
		out.write(dao.checkDupleNickname(nickname));
		//System.out.println("A : 현재 닉네임"+nickname);
		
		return null;		
	}
}
