package com.tripicker.board.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardModifyProAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileName = "";
		
		// Post 한글처리
		request.setCharacterEncoding("UTF-8");	
		
		// 파일이 저장될 경로
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/save");	
		System.out.println("경로:"+uploadPath.toString());		
		int maxSize = 10 * 1024 * 1024; //최대 파일크기 10MB
					
		File folder = new File(uploadPath);		
		if(!folder.exists()) {//해당 디렉토리 없을시, 폴더 생성
			try{				
				folder.mkdir();
				System.out.println("폴더 생성 완료");
			}catch (Exception e) {
				e.getStackTrace();
			}			
		} else {
			System.out.println("폴더 이미 생성되어있음");
		}

		try {		
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"UTF-8");						
			// 업로드한 파일명 받아오기			
			fileName = multi.getParameter("fileName");
			
			if(fileName == "") {//파일업로드 실패
				System.out.println("파일 업로드 실패");
			}else {//파일업로드 성공시
				// BoardWriter.jsp -> BoardDTO에 저장
				BoardDTO bdto = new BoardDTO();		
				bdto.setBoardNum(Integer.parseInt(multi.getParameter("boardNum")));
				System.out.println("게시글번호:"+bdto.getBoardNum());
				bdto.setBoardPass(multi.getParameter("boardPass"));
				bdto.setNickname(multi.getParameter("nickname"));
				bdto.setBoardTitle(multi.getParameter("boardTitle"));
				bdto.setBoardContent(multi.getParameter("boardContent"));				
				bdto.setTag(multi.getParameter("tag"));
				// DB에 저장될 파일경로+이름 
				String filePath = "save/" + fileName;		
				bdto.setBoardFile(filePath);
				// DB에 글정보 저장
				BoardDAO bdao = new BoardDAO();
				bdao.modifyBoard(bdto);		
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
