package com.tripicker.mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.mypage.db.MyPageDAO;
import com.tripicker.mypage.db.MyPageDTO;

public class MyPageUpdateInfoProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPageFront: MyPageUpdateInfoProAction 호출");
		
		request.setCharacterEncoding("utf-8");
		
		// 세션체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		

		MyPageDAO dao = new MyPageDAO();
		MyPageDTO dto = dao.getUser(id);
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
				
		dto.setPass(request.getParameter("pass"));
		dto.setName(request.getParameter("name"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddr(request.getParameter("addr"));
		
		System.out.println("MyPageFront: "+ dto);
		
		request.setAttribute("dto", dto);
		
		
		
		int result = dao.updateInfo(dto);
		System.out.println("수정처리 결과: "+result);
		
		
		
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('회원정보가 없습니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else if (result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('비밀번호가 일치하지 않습니다');");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}else {
			PrintWriter out = response.getWriter();
			/*out.print("<script>");
			out.print(" alert('회원정보 수정이 완료되었습니다.');");
			out.print("</script>");
			out.close();*/
			
			forward.setPath("./Main.tr");
			forward.setRedirect(true);
			
			return forward;
		}
		
		
		
		
	}
	
}
