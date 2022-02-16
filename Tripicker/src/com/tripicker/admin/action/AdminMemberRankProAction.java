package com.tripicker.admin.action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.admin.db.AdminDAO;

public class AdminMemberRankProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" Admin : AdminMemberRankProAction_execute() 호출");
		
		// 세션체크
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				Integer rank = (Integer)session.getAttribute("rank");
				
				ActionForward forward = new ActionForward();
				if(id==null || rank != 4){
					forward.setPath("./UserLogin.us");
					forward.setRedirect(true);
					return forward;
				}
		//한글처리
		request.setCharacterEncoding("UTF-8");		
		// 이전페이지에서 전달된 정보 저장(DTO) <<DTO안에있는 정보를 하나하나 다 저장을 해야함
		
		
		// DAO 객체 생성 - 정보수정 메서드 호출
		String rankID = (String)session.getAttribute("rankID");
		int changeRank = Integer.parseInt(request.getParameter("changeRank"));
		
		AdminDAO adao = new AdminDAO();
		adao.rankUpdate(rankID,changeRank);
		
		// 처리 결과에 따른 페이지 이동(0,1,-1)-js
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('rank 변경 완료');");
		out.print("location.href='./AdminMemberList.ad';");
		out.print("</script>");
		
		
		out.close();
		return null;
	}

}
