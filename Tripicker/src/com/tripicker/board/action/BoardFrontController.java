package com.tripicker.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;

public class BoardFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		///////////// 1. 가상 주소 계산 /////////////
		String requestURI = request.getRequestURI(); //URI 주소 : /Tripicker/*.bd
		String ctxPath = request.getContextPath(); //ContextPath 주소 : /Tripicker
		System.out.println(" C : ctxPath - " +ctxPath);
		String command = requestURI.substring(ctxPath.length()); //페이지 이동할 주소 : /*.bd		
		System.out.println(" C : command - "+command);
		System.out.println("BoardFrontController : 가상주소 계산 끝");
		///////////// 1. 가상 주소 계산 /////////////
		
		
		///////////// 2. 가상 주소 매핑 /////////////
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/BoardMain.bo")) {			
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/BoardWrite.bo")) {
			forward = new ActionForward();
			forward.setPath("./board/boardWrite.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/BoardWriteAction.bo")) {
			action = new BoardWriteAction();			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			
		}else if(command.equals("/BoardContent.bo")) {
			action = new BoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardModify.bo")) {
			action = new BoardModifyAction();
			
		}
		
		
		
		///////////// 2. 가상 주소 매핑 /////////////
		
		
		/////////////  3. 페이지 이동   /////////////		
		if(forward != null) {
			if(forward.isRedirect()) {//sendRedirect
				response.sendRedirect(forward.getPath());
				System.out.println(" C : 페이지주소 - " +forward.getPath());
			}else {//forward
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println(" C : 페이지주소 - " +forward.getPath());
			}

		}

		/////////////  3. 페이지 이동   /////////////		
		
	}

	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("BoardFrontController : doGet() 호출");
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("BoardFrontController : doPost() 호출");
		doProcess(request, response);
	}
		
}
