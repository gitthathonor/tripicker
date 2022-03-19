package com.tripicker.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;
import com.tripicker.notice.db.NoticeDAO;
import com.tripicker.notice.db.NoticeDTO;




public class NoticeWriteAction implements Action {
		@Override
	    public ActionForward execute(HttpServletRequest request,
	            HttpServletResponse response) throws Exception {
			
			//1. 한글처리
			request.setCharacterEncoding("UTF-8");
			
			//2.전달되는 파라미터 정보저장 
			NoticeDTO ndto = new NoticeDTO();

			ndto.setnTitle(request.getParameter("nTitle"));
			ndto.setnContent(request.getParameter("nContent"));
			
			//3.NoticeDAO객체생성
			NoticeDAO ndao = new NoticeDAO();
			int result = ndao.insertNotice(ndto);
			
			//4페이지 이동
			ActionForward forward = new ActionForward();
			
	        if(result == 1){ // 글하나 작성완료
	        	forward.setPath("./NoticeAction.no");
	        	forward.setRedirect(true);
	        }else{
	        	//에러 상황( 자바스크립트 / 페이지 이동 )
	        	forward.setPath("./Main.tr");
	        	forward.setRedirect(true);
	        }
			return forward;
		}
	}
