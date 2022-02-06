package com.tripicker.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.user.db.UserDAO;

public class UserIdCheckAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// 회원가입 폼에서 입력받은 id 저장
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		
		// DAO 객체호출
		UserDAO udao = new UserDAO();
				
		// 중복x -> "ok"
		out.write(udao.checkDupleId(id));
		return null;
		
	}
}
