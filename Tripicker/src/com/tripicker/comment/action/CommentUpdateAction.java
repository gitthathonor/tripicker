package com.tripicker.comment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.comment.db.CommentDAO;
import com.tripicker.comment.db.CommentDTO;

public class CommentUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: CommentUpdateAction_execute()");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		
		
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		CommentDAO cdao = new CommentDAO();
		
		CommentDTO cdto = cdao.getComment(nickname);
		request.setAttribute("cdto", cdto);
		
		forward.setPath("./board/commentUpdateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
