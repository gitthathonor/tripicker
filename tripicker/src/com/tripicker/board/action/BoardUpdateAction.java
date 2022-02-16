package com.tripicker.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("모델: BoardUpdateAction안의 execute() 실행됨");
		//1. 한글처리
		req.setCharacterEncoding("UTF-8");
		
		//2.전달되는 파라미터 정보저장 
		int nNum = Integer.parseInt(req.getParameter("nNum"));
		String pageNum = (String) req.getAttribute("pageNum");
		
		//3.DAO객체생성 -> nNum 해당되는 정보 가져오기
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = bdao.getBoard(nNum);
		
		//5.리퀘스트영역에 정보저장
		req.setAttribute("bdto", bdto);
		
		//6. 화면출력하는 뷰페이지(.jsp)로 전달 (get방식)
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/boardupdate.jsp?pageNum="+pageNum);
		forward.setRedirect(false);
		
		return forward;
	}
}
