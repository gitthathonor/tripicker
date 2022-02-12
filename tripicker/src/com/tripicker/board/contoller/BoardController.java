package com.tripicker.board.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.board.service.DeleteServiceImpl;
import com.tripicker.board.service.GetContentServiceImpl;
import com.tripicker.board.service.GetListServiceImpl;
import com.tripicker.board.service.IBoardService;
import com.tripicker.board.service.RegistServiceImpl;
import com.tripicker.board.service.UpHitServiceImpl;
import com.tripicker.board.service.UpdateServiceImpl;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardController() {
        super();
    }

    // 2. get, post요청 통일
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 3. 요청분기
		request.setCharacterEncoding("UTF-8");
		
//		String command = request.getRequestURI().substring(request.getContextPath().length());
		String uri = request.getRequestURI(); // URI
		String path = request.getContextPath();
		
		String command = uri.substring(path.length()); // 요청경로
		
		System.out.println(command);
		
		// MVC2 방식은 forward 이동을 기본적으로 사용합니다. Redirect는 다시 컨트롤러로 연결할 때 사용합니다.
		
		// service의 인터페이스 타입을 선언(if문 안에서 알맞은 서비스 클래스로 연결)
		IBoardService service;
		
		if(command.equals("/board/list.board")) { // 글목록 요청
			// ....조회 메서드를 실행하고, 값을 가지고 화면으로 이동
			service = new GetListServiceImpl();
			service.execute(request, response);
			
			// 화면에 전달할 값이 있으니 forward이동
			request.getRequestDispatcher("board_list.jsp").forward(request, response);
			
		} else if(command.equals("/board/write.board")) { // 글작성 화면요청
			
			request.getRequestDispatcher("board_write.jsp").forward(request, response);
		} else if(command.equals("/board/regist.board")) { // 글 등록 요청
			
			// ....
			service = new RegistServiceImpl();
			service.execute(request, response);
			
			response.sendRedirect("list.board"); // 리다이렉트는 다시 컨트롤러를 태울때 사용합니다.
		} else if (command.equals("/board/getContent.board")) { // 글 상세
			
			// 조회수 증가 (service영역)
			service = new UpHitServiceImpl();
			service.execute(request, response);
			
			// 게시글 정보 조회
			service = new GetContentServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("board_content.jsp").forward(request, response);
		} else if (command.equals("/board/modify.board")) { // 글 수정요청
			
			// getContentServiceImpl 재활용
			service = new GetContentServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("board_modify.jsp").forward(request, response);
		} else if (command.equals("/board/update.board")) { // 글 수정 완료
			
			// 서비스...
			/*
			 *  1. UpdateServiceImpl 클래스를 생성하고 execute()메서드 실행.
			 *  2. 서비스 영역에서 bno, title, content를 받아서 DAO의 update() 메서드 실행
			 *  3. update()는 sql문을 이용해서 해당 글 번호의 내용을 수정.
			 *  4. 컨트롤러에서는 Content화면으로 이동. (content가 필요한 값을 자바측에서 전송)
			 */
			service = new UpdateServiceImpl();
			service.execute(request, response);
			
			// forward 로 넘길 경우. 주소값이 변경되지 않아서 새로고침 하는 순간 다시 update로 넘어오게 됌
			response.sendRedirect("getContent.board?bno=" + request.getParameter("bno")); // 수정완료된 글로 이동
//			response.sendRedirect("list.board"); // 글 목록 이동
		} else if (command.equals("/board/delete.board")) { // 글 삭제 요청
			
			service = new DeleteServiceImpl();
			service.execute(request, response);
			
			response.sendRedirect("list.board");
		}
		
	}

}

