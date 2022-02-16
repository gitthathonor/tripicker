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
		BoardDTO bodto = bodao.selContent(boardNum);
		
		if(bodto.getBoardFile() != null) {
			String filePath = bodto.getBoardFile();
			String fileName = filePath.substring(5); //save/만큼 잘라내기
			System.out.println("ContentAction - filePath:"+filePath);
			System.out.println("ContentAction - fileName:"+fileName);
			request.setAttribute("fileName", fileName);			
		}
		request.setAttribute("content", bodto);
		request.setAttribute("writer", bodto.getNickname());
		request.setAttribute("boardPass", bodto.getBoardPass());
		
		// 페이지 이동정보 저장
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
