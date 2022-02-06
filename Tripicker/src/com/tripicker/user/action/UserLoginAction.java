package com.tripicker.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.user.db.UserDAO;
import com.tripicker.user.db.UserDTO;

public class UserLoginAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인정보(id,pass) 받아와 DAO에서 비교후,
		// 가져온 결과값에 따라 메세지와 함께 페이지 이동 (forward)
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		// DTO생성, set
		UserDTO user = new UserDTO();
		user.setId(id);
		user.setPass(pass);
		
		// DAO생성, loginCheck() 호출
		UserDAO udao = new UserDAO();
		int result = udao.loginCheck(id,pass);
				
		// 결과에 따른 페이지 이동
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('존재하지 않는 아이디 입니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('비밀번호가 일치하지 않습니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else {//로그인 성공 
			// 회원등급 조회
			int rank = udao.getRank(id);
			
			// 아이디, 등급 세션생성
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("rank", rank);
			
			// 페이지 이동(main.jsp)
			ActionForward forward = new ActionForward();
			forward.setPath("./Main.tr");
			forward.setRedirect(true);
			return forward;
		}
		
	}	
}
