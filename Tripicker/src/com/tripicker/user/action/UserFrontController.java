package com.tripicker.user.action;

import java.io.IOException;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// *.us 회원정보 처리
		
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
			// 회원가입 페이지(LgoinForm.jsp) 출력
			//System.out.println("C : /UserJoin.us 호출");
			forward = new ActionForward();
			forward.setPath("./user/joinForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/UserJoinAction.us")) {
			// 회원가입 처리(DB로 정보전달)후 로그인페이지 출력			
			action = new UserJoinAction();
			//System.out.println("C : /UserJoinAction.us 호출");			
			try {
				 forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/UserLogin.us")) {
			// 로그인 페이지(joinForm.jsp) 출력
			//System.out.println("C : /UserLogin.us 호출");
			forward = new ActionForward();
			forward.setPath("./user/loginForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/UserIdCheckAction.us")) {
			action = new UserIdCheckAction();
			//System.out.println("C : /UserIdCheckAction.us 호출");
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
		}else if(command.equals("/UserLoginAction.us")) {
			//System.out.println("C : /UserLoginAction.us 호출");
			action = new UserLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/UserLogout.us")) {
			//System.out.println("C : /UserLogoutAction.us 호출");
			action = new UserLogoutAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(" C : 2. 페이지 매핑처리 끝 ");
	
		
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
