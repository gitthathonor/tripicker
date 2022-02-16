package com.tripicker.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// Post 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파일 업로드 실행
		String fileName = "";
		String savePath = "D:\\Tripciker_board";
		//String savePath = request.getSession().getServletContext().getRealPath("upload");
		//ServletContext ctx = getServletContext();
		//String savePath = request.getSession().getServletContext().getRealPath("/upload");		
		int maxSize = 10 * 1024 * 1024; //최대 파일크기 10MB
				
		try {
			// 톰캣서버에 파일 저장
			MultipartRequest multi = 
					new MultipartRequest(
							request,
							savePath,
							maxSize,
							"UTF-8");
			
			
			// 업로드한 파일명 받아오기			
			fileName = multi.getParameter("fileName");
			System.out.println("파라미터로 받은 파일명: "+fileName);
			System.out.println(multi.getFileNames());
			
			if(fileName == "") {//파일업로드 실패
				System.out.println("파일 업로드 실패");
			}else {//파일업로드 성공시
				// BoardWriter.jsp -> BoardDTO에 저장
				BoardDTO bdto = new BoardDTO();		
				bdto.setBoardPass(multi.getParameter("boardPass"));
				bdto.setNickname(multi.getParameter("nickname"));
				bdto.setBoardTitle(multi.getParameter("boardTitle"));
				bdto.setBoardContent(multi.getParameter("boardContent"));
				bdto.setBoadFile(fileName);
				bdto.setTag(multi.getParameter("tag"));
				
				// DB에 글정보 저장
				BoardDAO bdao = new BoardDAO();
				bdao.insertBoard(bdto);	
				System.out.println("File name: "+fileName);				
			}//파일업로드,글작성 성공						
		} catch (Exception e) {
			System.out.println("글 작성 예외발생"+e);
		}//catch

		// 페이지 이동	
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardMain.bo");	
		forward.setRedirect(true);
		
		return forward;
	}
}
