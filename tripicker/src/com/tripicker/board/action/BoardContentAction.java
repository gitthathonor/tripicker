package com.tripicker.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;


public class BoardContentAction implements Action {
	@Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
	System.out.println("모델: BoardContentAction안의 execute() 실행됨");

	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 1. 전달받은 데이터 저장(nNum, pageNum)
	int nNum = Integer.parseInt(request.getParameter("nNum"));
	String pageNum = request.getParameter("pageNum");
	//2. BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	//3.조회수 1증가
	bdao.updateReadcount(nNum);
	
	//4.특정 번호에 해당하는 글 정보 가져오기
	BoardDTO bdto = bdao.getBoard(nNum);
	//5.리퀘스트영역에 정보저장
	request.setAttribute("bdto", bdto);
	//pageNum도 함께 전달해야한다
	request.setAttribute("pageNum", pageNum);
	
	//6. 화면출력하는 뷰페이지(.jsp)로 전달
	ActionForward forward = new ActionForward();
	forward.setPath("./notice/boardcontent.jsp");
	forward.setRedirect(false);
	
	return forward;
		}
	}


