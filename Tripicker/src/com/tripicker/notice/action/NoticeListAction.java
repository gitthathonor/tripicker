package com.tripicker.notice.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.notice.db.NoticeDAO;
import com.tripicker.notice.db.NoticeDTO;


public class NoticeListAction implements Action{
	@Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
			
	System.out.println("모델: NoticeListAction안의 execute() 실행됨");
		
		// 페이징 처리*****************************
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 5; 
		// 현 페이지의 페이지값을 확인 
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) { // 페이지 정보가 없을경우 항상 1페이지
			pageNum = "1";
		}

		// 시작 행번호 계산 1...10 / 11...20 / 21...30 / 31...40
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝 행번호 계산
		int endRow = currentPage * pageSize;
		////////////////페이징 처리 위쪽//////////////////////////
		
		// NoticeDAO 객체 생성
		NoticeDAO ndao = new NoticeDAO();
		

		// 글 개수 체크하는 메서드, 정보 가져오는 메서드
		// getNoticeCount(), getNoticeList()
		int noticeCount = ndao.getNoticeCount();
	
		//////////////////페이징 처리 아래쪽/////////////////////
		// 전체 페이지수 - 글 50 / 화면 10씩 출력 => 5페이지
		// - 글 56 / 화면 10씩 출력 => 6페이지

		int pageCount = noticeCount / pageSize + (noticeCount % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지 번호개수
		int pageBlock = 2;

		// 페이지 블럭의 시작페이지 번호 1...10/11...20/21....30/31....40
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		//글이 있는 경우에만 글 가져오기
		ArrayList noticeList = new ArrayList<>();
		if(noticeCount > 0){
			noticeList = (ArrayList) ndao.getNoticeList();
		}
		System.out.println("모델: "+noticeList);
		// 정보(글목록)를 가지고 .jsp페이지로 이동
		
		// request 영역에 NoticeList 저장
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("cnt", noticeCount);
		
		// 페이징처리를 위한 정보 추가 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 페이지 이동 (./Notice/NoticeList.jsp)	
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticelist.jsp");
		forward.setRedirect(false);		
		return forward;
	}

}