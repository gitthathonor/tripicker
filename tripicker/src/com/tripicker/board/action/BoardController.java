package com.tripicker.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
 
public class BoardController extends HttpServlet{

	// 일반 클래스를  서블릿을 상속해서 컨트롤러 역활 할수있도록 설정
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
System.out.println("NoticeFront : doProcess() 호출!");
		
		/////1. 가상 주소 계산/////
		String requestURI = request.getRequestURI(); //요청 URI 주소 : /Tripicker/*.pl
		String ctxPath = request.getContextPath(); //ContextPath 주소 : /Tripicker
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.pl
		
		System.out.println("NoticeFront : 가상 주소 계산 끝!");
		/////1. 가상 주소 계산/////
		
		
		/////2. 가상 주소 매핑/////
		Action action = null; // Action 인터페이스 초기화
		ActionForward forward = null; // ActionForward 객체 초기화

		
		//2-1. 글목록
		if(command.equals("/BoardWrite.bo")){
			System.out.println("컨트롤러: BoardWrite.bo주소요청");
			//ActionForward 객체생성되면 2가지 정보를 저장할 수 있음 =>setPath(), setRedirect()
			//ActionForward 객체를 생성한다고 해서 바로 페이지이동이 가능하지않다. 이 객체는 이동할 정보만 가지고 있다.
			forward = new ActionForward();
			forward.setPath("./notice/boardwrite.jsp");
			forward.setRedirect(false); //주소는 `*.bo` 화면은 `.jsp`
			System.out.println("컨트롤러:./notice/boardwrite.jsp로 이동준비완료");
		} else if(command.equals("/FAQAction.bo")) {
			
			forward = new ActionForward();
			forward.setPath("./notice/faq.jsp");
			forward.setRedirect(false);
		
		} else if(command.equals("/BoardRequests.bo")) {
		
			forward = new ActionForward();
			forward.setPath("./notice/boardrequests.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/BoardWrite.bo")) {
			
		}else if(command.equals("/BoardWriteAction.bo")){	
			//글 하려면 : .jsp(뷰) -> servlet(컨트롤러) -> .java(모델) -> DB로 이동 해야한다

			//BoardWriteAction 생성 아래 두가지 방식
			try{
				action = new BoardWriteAction();
				forward = action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
				}
			// 글쓰기 동작 : 글 입력 + DB저장
			}else if(command.equals("/BoardList.bo")){
			System.out.println("컨트롤러: /BoardList.bo주소요청");
			//게시글 전체를 확인 하려면 : .jsp(뷰) <- servlet(컨트롤러) <- .java(모델) <- DB로 이동 해야한다.
			action = new BoardListAction();
			System.out.println("컨트롤러 : BoardListAction객체 생성 execute() 호출");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				}
			//content보기
			}else if(command.equals("./BoardContent.bo")){
				System.out.println("컨트롤러 : BoardContent객체 생성 execute() 호출");
				action = new BoardContentAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//게시글 수정
			}else if(command.equals("/BoardUpdate.bo")){
				System.out.println("컨트롤러 : BoardUpdate객체 생성 execute() 호출");
				action = new BoardUpdateAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else if(command.equals("/BoardUpdateProAction.bo")){
				System.out.println("C : /BoardUpdateProAction.bo 호출");
				System.out.println("C : .jsp -> .bo");
				// BoardUpdateProAction 객체 생성
				action = new BoardUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
				//글삭제
			}else if(command.equals("/BoardDelete.bo")){
				System.out.println("C : /BoardDelete.bo 호출");
				System.out.println("C : .jsp -> .bo");
				//페이지이동
				forward =  new ActionForward();
				forward.setPath("./notice/deleteForm.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/BoardDeleteAction.bo")){
				System.out.println("C : /BoardDeleteAction.bo 호출");
				action = new BoardDeleteAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e)
					{e.printStackTrace(); 
				}
			
	}//end of 주소비교후처리(command)
		
		
		//3. 페이이지이동
		System.out.println("-----------------@ 페이지 이동 @--------------");
		if(forward != null){ // 이동할 정보(setPath과setRedirect)가 있는 경우
			if(forward.isRedirect()){ //True면 sendRedirect이동방식, False면 forward이동 방식
				//true면 sendRedirect방식으로 이동
				//사용처: 주소와 화면의 전환이 동시에 일어날때 (가상주소 `.bo` -> 가상주소로 `.bo`)
				System.out.println("컨트롤러: "+forward.getPath()+"로 이동(sendRedirect이동방식)");
				response.sendRedirect(forward.getPath());
			}else{
				//false면  forward방식으로 이동
				//사용처: 주소는 그대로인데 화면이 바뀔때 (가상주소 `.bo`에서 request객체정보를 가지고 이동하면서 `.jsp`를 보여줌)
				//RequestDispatcher dis = new RequestDispatcher(forward.getPath()); 인터페이스이므로 new연산자를 이용한 객체생성 불가
				System.out.println("컨트롤러: "+forward.getPath()+"로 이동(forward이동방식)");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		
	}//end of doProcess
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet호출");
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost호출");
		doProcess(req, resp);
	}
}