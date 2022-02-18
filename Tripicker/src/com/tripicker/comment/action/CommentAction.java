package com.tripicker.comment.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.comment.db.CommentDAO;
import com.tripicker.comment.db.CommentDTO;

public class CommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		CommentDTO cdto = new CommentDTO();
		
//		cdto.setCommentNum(Integer.parseInt(request.getParameter("commentNum")));
		cdto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		cdto.setNickname(request.getParameter("nickname"));
		cdto.setContent(request.getParameter("content"));
		cdto.setcReg_date(new Timestamp(System.currentTimeMillis()));
		
		System.out.println("M: "+cdto.toString());
		
		CommentDAO cdao = new CommentDAO();
		
		cdao.insertComment(cdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/BoardContent.bo");
		forward.setRedirect(true);
		return forward;
	}
	 
	 
}
