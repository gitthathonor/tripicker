package com.tripicker.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardUpdateProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : BoardUpdateProAction_execute 호출");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// 전달되는값들 저장  (제목, 내용, nNum,pageNum)
		
		String pageNum = request.getParameter("pageNum");		
		// BoardDTO 객체 생성
		BoardDTO bdto = new BoardDTO();
		bdto.setnNum(Integer.parseInt(request.getParameter("nNum")));
		bdto.setnTitle(request.getParameter("nTitle"));
		bdto.setnContent(request.getParameter("nContent"));
		
		// BoardDAO 객체 생성 -> 정보 수정 메서드 updateBoard(bdto)
		BoardDAO bdao = new BoardDAO();
		
		int result = bdao.updateBoard(bdto);
		
		System.out.println("M : DB 처리 완료후 결과  -> "+result);
		
		// 결과를 리턴받아서 처리 (1, 0 ,-1)
		// 페이지이동 (js)	
		
		// 페이지 출력준비 
		response.setContentType("text/html; charset=UTF-8");
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
			out.print(" alert('해당 글 없음!');");
			out.print(" history.back();");
			out.print("</script>");
		    out.close();
		    
		    return null;
		}
		
		out.print("<script>");
		out.print(" alert('글 수정완료!');");
		out.print(" location.href='./BoardList.bo?pageNum="+pageNum+"';");
		out.print("</script>");
	    out.close();
		
		return null;
	}
}
