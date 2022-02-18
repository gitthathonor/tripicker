package com.tripicker.comment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward; 
import com.tripicker.comment.db.CommentDAO;


public class CommentDeleteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		Integer commentnum = (Integer)session.getAttribute("commentNum");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		CommentDAO cdao = new CommentDAO();
		
		cdao.deleteComment(commentnum, nickname);
	
		forward.setPath("./board/BoardDetail.bo");
		forward.setRedirect(true);
		return forward;
	}
	
}
