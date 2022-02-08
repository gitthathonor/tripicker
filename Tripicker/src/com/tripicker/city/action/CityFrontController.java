package com.tripicker.city.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;

public class CityFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CityFront : doProcess() 호출!");
		
		/////1. 가상 주소 계산/////
		String requestURI = request.getRequestURI(); //요청 URI 주소 : /Tripicker/*.ci
		String ctxPath = request.getContextPath(); //ContextPath 주소 : /Tripicker
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.ci
		
		System.out.println("CityFront : 가상 주소 계산 끝!");
		/////1. 가상 주소 계산/////
		
		
		/////2. 가상 주소 매핑/////
		Action action = null; // Action 인터페이스 초기화
		ActionForward forward = null; // ActionForward 객체 초기화
		
		if(command.equals("/CityInsert.ci")) {
			System.out.println("CityFront : /CityInsert.ci 주소호출!"); //tripicker 메인 페이지
			
			forward = new ActionForward();
			forward.setPath("./city/cityInsert.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/CityInsertAction.ci")) {
			action = new CityInsertAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		/////2. 가상 주소 매핑/////
		
		
		/////3. 페이지 이동/////
		if(forward != null) { //페이지 이동정보가 있을 때
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("CityFront : 페이지 주소  = " + forward.getPath());
				System.out.println("CityFront : Redirect 방식 페이지 이동");
				
			} else {
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("CityFront : 페이지 주소 = " + forward.getPath());
				System.out.println("CityFront : forward 방식 페이지 이동");
			}
			
		}
		System.out.println("CityFront : 페이지 이동 끝!");
		/////3. 페이지 이동/////
		
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CityFront : doGet(); 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CityFront : doPost(); 호출");
		doProcess(request, response);
	}
}
