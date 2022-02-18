package com.tripicker.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;
import com.tripicker.notice.db.NoticeDAO;
import com.tripicker.notice.db.NoticeDTO;


public class NoticeContentAction implements Action {
	@Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
	System.out.println("모델: NoticeContentAction안의 execute() 실행됨");

	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 1. 전달받은 데이터 저장(nNum, pageNum)
	int nNum = Integer.parseInt(request.getParameter("nNum"));
	String pageNum = request.getParameter("pageNum");
	//2. BoardDAO 객체 생성
	NoticeDAO ndao = new NoticeDAO();
	//3.조회수 1증가
	ndao.updateReadcount(nNum);
	
	//4.특정 번호에 해당하는 글 정보 가져오기
	NoticeDTO ndto = ndao.getNotice(nNum);
	//5.리퀘스트영역에 정보저장
	request.setAttribute("bdto", ndto);
	//pageNum도 함께 전달해야한다
	request.setAttribute("pageNum", pageNum);
	
	//6. 화면출력하는 뷰페이지(.jsp)로 전달
	ActionForward forward = new ActionForward();
	forward.setPath("./notice/noticecontent.jsp");
	forward.setRedirect(false);
	
	return forward;
		}
	}


