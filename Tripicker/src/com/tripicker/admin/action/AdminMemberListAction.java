package com.tripicker.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.admin.db.AdminDAO;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("A : AdminMemberListAction_execute() 호출");

		request.setCharacterEncoding("UTF-8");

		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		Integer grade = (Integer)session.getAttribute("grade");

		/*
		 * String turn =(String) session.getAttribute("turn"); String
		 * turn=(String) request.getParameter("turn");
		 */

		// System.out.println("A : turn " +turn);
		System.out.println("A : grade " + grade);
		ActionForward forward = new ActionForward();
		if (id == null || grade != 4) {
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		/*
		 * if(turn==null){ turn="reg_date"; }
		 */
		AdminDAO adao = new AdminDAO();

		int cnt = adao.memberListCount();
		System.out.println("AdminMemberListAction : memberListCount " + cnt);

		// session.setAttribute("cnt", cnt);
		// 페이징처리

		// 한 페이지에 출력될 글 수
		int PageSize = 20;
		// 현재 페이지 정보 설정
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// 첫 행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * PageSize + 1;

		if (cnt != 0) {
			// 전체 페이지수 계산
			int pageCount = cnt / PageSize + (cnt % PageSize == 0 ? 0 : 1);

			// 한 페이지에 보여줄 페이지블럭
			int pageBlock = 2;

			// 한 페이지에 보여줄 페이지 블럭 시작번호 계산
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

			// 한 페이지에 보여줄 페이지 블럭 끝번호 계산
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			session.setAttribute("startPage", startPage);
			session.setAttribute("endPage", endPage);
			session.setAttribute("pageCount", pageCount);
			session.setAttribute("pageBlock", pageBlock);
		}

		request.setAttribute("memberList", adao.getMemberList(startRow, PageSize));		

		forward.setPath("./admin/memberList.jsp");
		forward.setRedirect(false);

		return forward;
		
	}

}
