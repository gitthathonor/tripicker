package com.tripicker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFront : doProcess() 호출!");
		
		/////1. 가상 주소 계산/////
		String requestURI = request.getRequestURI(); //요청 URI 주소 : /Tripicker/*.pl
		String ctxPath = request.getContextPath(); //ContextPath 주소 : /Tripicker
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.pl
		
		System.out.println("MainFront : 가상 주소 계산 끝!");
		/////1. 가상 주소 계산/////
		
		
		/////2. 가상 주소 매핑/////
		Action action = null; // Action 인터페이스 초기화
		ActionForward forward = null; // ActionForward 객체 초기화
		
		if(command.equals("/Main.tr")) {
			System.out.println("MainFront : /Main.tr 주소호출!"); //tripicker 메인 페이지
			
			forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		} 
		/////2. 가상 주소 매핑/////
		
		
		/////3. 페이지 이동/////
		if(forward != null) { //페이지 이동정보가 있을 때
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("MainFront : 페이지 주소  = " + forward.getPath());
				System.out.println("MainFront : Redirect 방식 페이지 이동");
				
			} else {
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("MainFront : 페이지 주소 = " + forward.getPath());
				System.out.println("MainFront : forward 방식 페이지 이동");
			}
			
		}
		System.out.println("MainFront : 페이지 이동 끝!");
		/////3. 페이지 이동/////
		
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFront : doGet(); 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MainFront : doPost(); 호출");
		doProcess(request, response);
	}
	
}
