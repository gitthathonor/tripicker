package com.tripicker.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;


public class MyPageFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
	
		// 1. 가상주소 계산
		String url = request.getRequestURL()+"";
		String uri = request.getRequestURI();
		System.out.println("url : " +url);
		System.out.println("uri : " +uri);
		
		String requestURI = request.getRequestURI();
		System.out.println("MyPageFront : requestURI - " +requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("MyPageFront : ctxPath - " +ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("MyPageFront : command - "+command);
		System.out.println("MyPageFront : 1. 가상 주소 계산 끝");
	
		// 2. 가상주소 매핑
		Action action = null;
		ActionForward forward = null;
		
		if (command.equals("/MyPageInfo.my")) {
			action = new MyPageInfoAction();
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MyPageUpdateInfo.my")) {
			try {
				action = new MyPageUpdateInfoAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MyPageUpdateInfoProAction.my")) { 
			//DB처리(정보수정), view페이지로 이동(main.jsp)
			//MyPageUpdateInfoProAction() 객체
			try {
				action = new MyPageUpdateInfoProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MyPageDeleteInfo.my")) {
			forward = new ActionForward();
			forward.setPath("./mypage/deleteInfo.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MyPageDeleteInfoAction.my")) {
			try {
				action = new MyPageDeleteInfoAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}	
			
		
		
		
		
		System.out.println("MyPageFront: 2. 페이지 매핑처리 끝 (페이지 이동x)");
		
		// 3. 페이지 이동
		if(forward != null) { // 페이지 이동정보 있을때
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("MyPageFront: 페이지 주소 - " + forward.getPath());
			}else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("MyPageFront: " + forward.getPath());
			}
		}
		System.out.println("MyPageFront: 페이지이동 끝 \n\n\n");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 페이지가 get 방식으로 호출될때 실행되는 메서드
		System.out.println("MyPageFrontController_doGet() 호출");
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 페이지가 post 방식으로 호출될때 실행되는 메서드
		System.out.println("MyPageFrontController_doPost() 호출");
		doProcess(request, response);

	}
	
	
}
