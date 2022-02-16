package com.tripicker.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;

public class BoardDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardListAction_execute() 호출");
		
		//전달정보 저장
		int nNum = Integer.parseInt(request.getParameter("nNum"));
		String pageNum = request.getParameter("pageNum");
		String pw = request.getParameter("pw");
		
		//BoardDAO객체생성 deleteBoard
		BoardDAO bdao = new BoardDAO();
		int result = bdao.deleteBoard(nNum, pw);
		System.out.println("M: DB처리완료 ->"+result);
		
		//처리결과를 js사용하여 페이지 이동
		//인코딩
		response.setContentType("text/html; charset=UTF-8");
		//출력통로생성
		PrintWriter out = response.getWriter();
		if(result == 0){
			out.print("<script>");
			out.print(" alert('비밀번호 오류');");
			out.print(" history.back();");
			out.print("</script>");
		    out.close();
		    
		    return null;			
		}else if(result == -1){
			out.print("<script>");
			out.print(" alert('해당 글 없음');");
			out.print(" history.back();");
			out.print("</script>");
		    out.close();
		    
		    return null;
		}
		
		//result == 1인경우
		out.print("<script>");
		out.print(" alert('글 삭제완료');");
		out.print(" location.href='./BoardList.bo?pageNum="+pageNum+"';");
		out.print("</script>");
	    out.close();
		
		return null;
	}
	
}