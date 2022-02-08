package com.tripicker.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tripicker.Action;
import com.tripicker.ActionForward;

public class UserLogoutAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserLogoutAction 들어옴");
		// 로그아웃 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("세션초기화 됨!");
		// 페이지 이동(main.jsp)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print(" alert('로그아웃 되었습니다');");
		out.print(" location.href='./Main.tr'; ");
		out.print("</script>");
		out.close();
		
		return null;
	}
	
	
}
