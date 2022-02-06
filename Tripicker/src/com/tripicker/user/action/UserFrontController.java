package com.tripicker.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.ResponseWrapper;

import com.tripicker.Action;
import com.tripicker.ActionForward;



public class UserFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UserFrontController_doProcess() 호출");
		// *.me 회원정보 처리
		
		// 1. 가상주소 계산 //
		String url = request.getRequestURL()+"";
		String uri = request.getRequestURI();

		System.out.println("url : " +url);
		System.out.println("uri : " +uri);
		
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI - " +requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" C : ctxPath - " +ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" C : command - "+command);
		System.out.println(" C : 1. 가상 주소 계산 끝");	
		// 1. 가상주소 계산 끝 //
		// 2. 가상주소 매핑 //
		Action action = null;
		ActionForward forward  = null;
		
		if(command.equals("/UserJoin.us")) {
			//회원가입 페이지(LgoinForm.jsp) 출력
			System.out.println("C : /UserJoin.us 호출");
			forward = new ActionForward();
			forward.setPath("./user/JoinForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/UserJoinAction.us")) {
			//회원가입 처리(DB로 정보전달)			
			action = new UserJoinAction();
			System.out.println("C : /UserJoinAction.us 호출");
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/UserLogin.us")) {
			//로그인 페이지(joinForm.jsp) 출력
			forward = new ActionForward();
			forward.setPath("./user/LoginForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/UserIdCheckAction.us")) {
			//System.out.println("/UserIdCheckAction.me 들어옴!");
			// 아이디 중복체크후 가입폼에 JSONObject형태로 반환
			// 페이지 이동, 파일전환x
			//String id =request.getParameter("id");
			//System.out.println("FrontController : 아이디값"+id);
			action = new UserIdCheckAction();
			System.out.println("C : /UserIdCheckAction.us 호출");
			try {
				action.execute(request, response);
			} catch (Exception e) {				
				e.printStackTrace();
			}
			
		}else if(command.equals("/UserNicknameCheckAction.us")) {
			action = new UserNicknameCheckAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {				
				e.printStackTrace();
			}
		}else if(command.equals("/UserEmailCheckAction.us")) {
			action = new UserEmailCheckAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
		
		// 3. 페이지 이동 //
		if(forward != null) { //페이지 이동정보 있음
			
			if(forward.isRedirect()) { //sendRedirect 
				response.sendRedirect(forward.getPath());
				System.out.println("C : 페이지 주소 -" +forward.getPath());
			}else { //forward
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("C : 페이지 주소 - "+forward.getPath());
			}
			
		}	
		System.out.println(" C : 3. 페이지 이동끝 \n\n\n ");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 페이지가 get 방식으로 호출될때 실행되는 메서드
		System.out.println("UserFrontController_doGet() 호출");
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 페이지가 post 방식으로 호출될때 실행되는 메서드
		System.out.println("UserFrontController_doPost() 호출");
		doProcess(request, response);

	}

}