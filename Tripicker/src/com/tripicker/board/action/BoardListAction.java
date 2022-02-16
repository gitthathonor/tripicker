package com.tripicker.board.action;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.board.db.BoardDAO;
import com.tripicker.board.db.BoardDTO;

public class BoardListAction implements Action{
	
	int numOfTuplesPerPage = 5;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int requestPage = 1;
		BoardDAO boDao = new BoardDAO();
		HttpSession session = request.getSession();
		
		if(request.getParameter("page") != null) {
			requestPage = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("courrentPage", requestPage);
		}
		
		int countedTuple = boDao.countTuple();
		// 페이지 목록(1..n)
		ArrayList<Integer> pageList = calcNumOfPage(countedTuple);
		session.setAttribute("pageList", pageList);
		ArrayList<BoardDTO> dtos = boDao.boardList(requestPage, numOfTuplesPerPage);
		request.setAttribute("list", dtos);
		System.out.println("보드객체 array:"+dtos.toString());
		
		// 이미지파일 불러올 경로
		ServletContext context = request.getServletContext();		
		String savePath = context.getRealPath("/save");	
		System.out.println("savePath경로1: "+savePath);
		savePath = savePath.substring(0,savePath.length()-5);
		System.out.println("savePath경로2: "+savePath);
		request.setAttribute("savePath", savePath);
				
		// 페이지 이동정보 저장
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardMain.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	
	// 총 열의 수를 받아 표시할 게시글의 수로 나누어 페이지 수 계산
	// BoardMain.jsp에서 for-each문으로 출력하기 위해 배열에 담기
	public ArrayList<Integer> calcNumOfPage(int countedTuple){
		ArrayList<Integer> arr = new ArrayList<Integer>();
		int calcPage = 0;
		// 열의 수가 딱 맞아떨어지는 경우 분기
		if(countedTuple % numOfTuplesPerPage == 0) {
			calcPage = countedTuple / numOfTuplesPerPage;
		}else {
			calcPage = countedTuple / numOfTuplesPerPage + 1;
		}
		for (int i = 1; i <= calcPage; i++) {
			System.out.println(i);
			arr.add(i);
		}			
		return arr;
		
	}
}
