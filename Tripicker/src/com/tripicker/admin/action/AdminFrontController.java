package com.tripicker.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;

public class AdminFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFront : doProcess() 호출!");
		
		// -----------------------1. 가상 주소 계산 --------------------------
		String requestURI = request.getRequestURI(); 
		String ctxPath = request.getContextPath(); 
		String command = requestURI.substring(ctxPath.length()); 
		
		System.out.println("AdminFront : 가상 주소 계산 끝!");
		// -----------------------1. 가상 주소 계산 --------------------------
		
		
		// -----------------------2. 가상 주소 매핑(처리) --------------------
		Action action = null; 
		ActionForward forward = null; 
			
		 if(command.equals("/AdminMemberDeleteAction.ad")){
			
			System.out.println("AdminFront : /AdminMemberDeleteAction.ad 주소 호출");
			action=new AdminMemberDeleteAction();
			try {
				forward=action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/AdminMemberRankAction.ad")){
			System.out.println("AdminFront : /AdminMemberRankAction.ad 주소 호출");
			action = new AdminMemberRankAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminMemberRankProAction.ad")){
			System.out.println("AdminFront : /AdminMemberRankProAction.ad 주소 호출");
			action=new AdminMemberRankProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminMemberList.ad")) {
			action = new AdminMemberListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// -----------------------2. 가상 주소 매핑(처리) --------------------
		
		
		// -----------------------3. 페이지 이동 -----------------------------
		/*if(forward != null) { //페이지 이동정보가 있을 때
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
				System.out.println("AdminFront : 페이지 주소  = " + forward.getPath());
				System.out.println("AdminFront : Redirect 방식 페이지 이동");
				
			} else {
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("AdminFront : 페이지 주소 = " + forward.getPath());
				System.out.println("AdminFront : forward 방식 페이지 이동");
			}
			
		}*/
		System.out.println("AdminFront : 페이지 이동 끝!");
		// -----------------------3. 페이지 이동 -----------------------------
		
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFront : doGet(); 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFront : doPost(); 호출");
		doProcess(request, response);
	}
}
