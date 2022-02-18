package com.tripicker.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardContentAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		BoardDAO bodao = new BoardDAO();
		// 글 조회수 증가
		bodao.updateReadcount(boardNum);
		BoardDTO bodto = bodao.selContent(boardNum);
		
		if(bodto.getBoardFile() != null) {
			String filePath = bodto.getBoardFile();
			String fileName = filePath.substring(5); //save/만큼 잘라내기
			
			// 파일 여러개일 경우, 첫번째 파일만 가져오기
//			int cutIndex = fileName.indexOf("*");
//			if(cutIndex > 0){
//				fileName = fileName.substring(0,cutIndex);
//			}
			request.setAttribute("fileName", fileName);			
		}
		request.setAttribute("content", bodto);
	
		// 페이지 이동정보 저장
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
