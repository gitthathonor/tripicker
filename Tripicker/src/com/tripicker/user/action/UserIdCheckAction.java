package com.tripicker.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
		UserDAO dao = new UserDAO();
		
		//System.out.println("아이디 중복체크 결과값: "+dao.idCheck(id));
		
		//PrintWriter out =response.getWriter();
			
//		JSONObject obj = new JSONObject();
//		obj.put("result",result);
//		response.setContentType("application/x-json; charset=UTF-8");
		
		// 중복x -> "ok"
		out.write(dao.checkDupleId(id));
		return null;
		
	}
}
