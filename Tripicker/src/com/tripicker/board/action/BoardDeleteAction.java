package com.tripicker.board.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;

public class BoardDeleteAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result=0;
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));		
		BoardDAO bodao = new BoardDAO();
		result = bodao.delBoard(boardNum);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result == 1) {//글 삭제 성공
			out.print("<script>");
			out.print(" alert('게시글이 삭제되었습니다');");
			out.print(" location.href='./BoardMain.bo'; ");
			out.print("</script>");			
		}else { //글 삭제 실패
			out.print("<script>");
			out.print(" alert('게시글 삭제에 실패하였습니다');");
			out.print(" location.href='./BoardMain.bo'; ");
			out.print("</script>");	
		}
		out.close();

		return null;
	}

}
