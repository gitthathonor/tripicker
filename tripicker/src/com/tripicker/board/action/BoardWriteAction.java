package com.tripicker.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;




public class BoardWriteAction implements Action {
		@Override
	    public ActionForward execute(HttpServletRequest request,
	            HttpServletResponse response) throws Exception {
			
			//1. 한글처리
			request.setCharacterEncoding("UTF-8");
			
			//2.전달되는 파라미터 정보저장 
			BoardDTO bdto = new BoardDTO();

			bdto.setnTitle(request.getParameter("nTitle"));
			bdto.setnContent(request.getParameter("nContent"));
			
			//3.BoardDAO객체생성
			BoardDAO bdao = new BoardDAO();
			int result = bdao.insertBoard(bdto);
			
			//4페이지 이동
			ActionForward forward = new ActionForward();
			
	        if(result == 1){ // 글하나 작성완료
	        	forward.setPath("./BoardList.bo");
	        	forward.setRedirect(true);
	        }else{
	        	//에러 상황( 자바스크립트 / 페이지 이동 )
	        	forward.setPath("./Main.tr");
	        	forward.setRedirect(true);
	        }
			return forward;
		}
	}
