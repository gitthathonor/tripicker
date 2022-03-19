package com.tripicker.mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.mypage.db.MyPageDAO;
import com.tripicker.mypage.db.MyPageDTO;

public class MyPageDeleteInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPageFront: MyPageDeleteInfoAction 실행");
		
		request.setCharacterEncoding("utf-8");
		
<<<<<<< HEAD

		
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pass = request.getParameter("pass");
		
		MyPageDTO dto = new MyPageDTO();
		MyPageDAO dao = new MyPageDAO();
		
		
		int result = dao.deleteInfo(id, pass);
		System.out.println("수정처리 결과: "+result);
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			// 로그인 확인
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
	
		
=======
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pass = (String) session.getAttribute("pass");
		
		MyPageDAO dao = new MyPageDAO();
		MyPageDTO dto = dao.getUser(id);
		
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
		int result = dao.deleteInfo(dto);
		System.out.println("수정처리 결과: "+result);
>>>>>>> branch 'master' of https://github.com/gitthathonor/tripicker.git
		
		if (result == -1) {	//데이터x
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('회원정보가 없습니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else if (result == 0) {  //비밀번호 틀림
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('비밀번호가 일치하지 않습니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else {
			session.invalidate();
			PrintWriter out = response.getWriter();
			/*out.print("<script>");
			out.print(" alert('회원탈퇴가 완료되었습니다.');");
			out.print("</script>");
			out.close();*/
			
			forward.setPath("./Main.tr");
			forward.setRedirect(true);
			
			return forward;
		}
		

	}
	
}
