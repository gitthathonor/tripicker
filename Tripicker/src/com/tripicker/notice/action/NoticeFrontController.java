package com.tripicker.notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.plan.action.PlanDateAction;

public class NoticeFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFront : doProcess() 호출!");
		
		/////1. 가상 주소 계산/////
		String requestURI = request.getRequestURI(); //요청 URI 주소
		String ctxPath = request.getContextPath(); //ContextPath 주소 
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.no
		
		System.out.println("NoticeFront : 가상 주소 계산 끝!");
		/////1. 가상 주소 계산/////
		
		
		/////2. 가상 주소 매핑/////
		Action action = null; // Action 인터페이스 초기화
		ActionForward forward = null; // ActionForward 객체 초기화
		
		if(command.equals("/NoticeWrite.no")){
			System.out.println("컨트롤러: NoticeWrite.no주소요청");
			//ActionForward 객체생성되면 2가지 정보를 저장할 수 있음 =>setPath(), setRedirect()
			//ActionForward 객체를 생성한다고 해서 바로 페이지이동이 가능하지않다. 이 객체는 이동할 정보만 가지고 있다.
			forward = new ActionForward();
			forward.setPath("./notice/noticewrite.jsp");
			forward.setRedirect(false); //주소는 `*.bo` 화면은 `.jsp`
			System.out.println("컨트롤러:./notice/noticewrite.jsp로 이동준비완료");
		} else if(command.equals("/FAQAction.no")) {
			
			forward = new ActionForward();
			forward.setPath("./notice/faq.jsp");
			forward.setRedirect(false);
		
		} else if(command.equals("/NoticeRequests.no")) {
		
			forward = new ActionForward();
			forward.setPath("./notice/noticerequests.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/NoticeWriteAction.no")){	
			//글 하려면 : .jsp(뷰) -> servlet(컨트롤러) -> .java(모델) -> DB로 이동 해야한다

			//BoardWriteAction 생성 아래 두가지 방식
			try{
				action = new NoticeWriteAction();
				forward = action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
				}
			// 글쓰기 동작 : 글 입력 + DB저장
		}else if(command.equals("/NoticeList.no")){
			System.out.println("컨트롤러: /NoticeList.no주소요청");
			//게시글 전체를 확인 하려면 : .jsp(뷰) <- servlet(컨트롤러) <- .java(모델) <- DB로 이동 해야한다.
			action = new NoticeListAction();
			System.out.println("컨트롤러 : NoticeListAction객체 생성 execute() 호출");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				}
			//content보기
		}else if(command.equals("/NoticeContent.no")){
				System.out.println("컨트롤러 : NoticeContent객체 생성 execute() 호출");
				action = new NoticeContentAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
				//게시글 수정
		}else if(command.equals("/NoticeUpdate.no")){
				System.out.println("컨트롤러 : NoticeUpdate객체 생성 execute() 호출");
				action = new NoticeUpdateAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e){
					e.printStackTrace();
				}
		}else if(command.equals("/NoticeUpdateProAction.no")){
				System.out.println("C : /NoticeUpdateProAction.no 호출");
				System.out.println("C : .jsp -> .bo");
				// BoardUpdateProAction 객체 생성
				action = new NoticeUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
				//글삭제
		}else if(command.equals("/NoticeDelete.no")){
				System.out.println("C : /NoticeDelete.no 호출");
				System.out.println("C : .jsp -> .bo");
				//페이지이동
				forward =  new ActionForward();
				forward.setPath("./notice/deleteForm.jsp");
				forward.setRedirect(false);
		}else if(command.equals("/NoticeDeleteAction.no")){
				System.out.println("C : /NoticeDeleteAction.no 호출");
				action = new NoticeDeleteAction();
				try{
					forward = action.execute(request, response);
				}catch(Exception e)
					{e.printStackTrace(); 
				}
		} 
		
		//end of 주소비교후처리(command)
		
		
		/////2. 가상 주소 매핑/////
		
		
		/////3. 페이지 이동/////
		if(forward != null) { //페이지 이동정보가 있을 때
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("NoticeFront : 페이지 주소  = " + forward.getPath());
				System.out.println("NoticeFront : Redirect 방식 페이지 이동");
				
			} else {
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("NoticeFront : 페이지 주소 = " + forward.getPath());
				System.out.println("NoticeFront : forward 방식 페이지 이동");
			}
			
		}
		System.out.println("NoticeFront : 페이지 이동 끝!");
		/////3. 페이지 이동/////
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFront : doGet() 호출!");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFront : doPost() 호출!");
		doProcess(request,response);
	}
}