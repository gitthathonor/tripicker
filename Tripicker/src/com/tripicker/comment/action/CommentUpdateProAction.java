package com.tripicker.comment.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.comment.db.CommentDAO;
import com.tripicker.comment.db.CommentDTO;

public class CommentUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M: CommentUpdateProAction_execute() 호출");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		CommentDTO cdto = new CommentDTO();
		
		cdto.setCommentNum(Integer.parseInt(request.getParameter("commentNum")));
		cdto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		cdto.setNickname(request.getParameter("nickname"));
		cdto.setContent(request.getParameter("content"));
		cdto.setcReg_date(new Timestamp(System.currentTimeMillis()));
		
		CommentDAO cdao = new CommentDAO();
		int result = cdao.updateComment(cdto);
		
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('댓글 수정 실패!');");
			out.print("history.back();");
			out.print("</script>");
			
			out.close();
			return null;
		}
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('댓글 수정 실패!');");
			out.print("history.back();");
			out.print("</script>");
			
			out.close();
			return null;
		}
		//result == 1
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('댓글 수정 완료!');");
		out.print("location.href='./board/BoardDetail.bo';");
		out.print("</script>");
		
		out.close();
			
		return null;
		
	}
	
}
