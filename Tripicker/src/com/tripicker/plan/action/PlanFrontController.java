package com.tripicker.plan.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;

// 여행 계획 짜기 페이지 FrontController
public class PlanFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PlanFront : doProcess() 호출!");
		
		/////1. 가상 주소 계산/////
		String requestURI = request.getRequestURI(); //요청 URI 주소 : /Tripicker/*.pl
		String ctxPath = request.getContextPath(); //ContextPath 주소 : /Tripicker
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.pl
		
		System.out.println("PlanFront : 가상 주소 계산 끝!");
		/////1. 가상 주소 계산/////
		
		
		/////2. 가상 주소 매핑/////
		Action action = null; // Action 인터페이스 초기화
		ActionForward forward = null; // ActionForward 객체 초기화
		
		if(command.equals("/PlanDate.pl")) {
			System.out.println("PlantFront : /PlanDate.pl 주소호출!"); //plan 메인 페이지
			
			forward = new ActionForward();
			forward.setPath("./plan/planDate.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/PlanDateAction.pl")) {
			action = new PlanDateAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/PlanSpotInsert.pl")) {
			forward = new ActionForward();
			forward.setPath("./plan/planSpotInsert.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/PlanSpotInsertAction.pl")) {
			action = new PlanSpotInsertAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		} 
		
		/////2. 가상 주소 매핑/////
		
		
		/////3. 페이지 이동/////
		if(forward != null) { //페이지 이동정보가 있을 때
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("PlantFront : 페이지 주소  = " + forward.getPath());
				System.out.println("PlanFront : Redirect 방식 페이지 이동");
				
			} else {
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("PlanFront : 페이지 주소 = " + forward.getPath());
				System.out.println("PlanFront : forward 방식 페이지 이동");
			}
			
		}
		System.out.println("PlanFront : 페이지 이동 끝!");
		/////3. 페이지 이동/////
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PlanFront : doGet() 호출!");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PlanFront : doPost() 호출!");
		doProcess(request,response);
	}
	
}
