package com.tripicker.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.board.persistence.BoardDAO;

public class UpHitServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bno = request.getParameter("bno");
		
		// 2. 쿠키는 서버측으로 자동으로 전송되고, 화면에서 넘어온 쿠키를 받아서 현재 조회번호와 같은지 검사.
		//	    조회수 실행여부 결정
		Cookie[] cookies = request.getCookies();

		boolean flag = true;
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(bno)) { // 쿠키이름이 게시글 조회번호와 동일한지 검사
					flag = false; // 중복의 의미
					break;
				}
			}
		}
		
		if(flag) { // 중복이 없다면 true
			// DAO연결 조회수증가
			BoardDAO.getInstance().upHit(bno);
		}
		
		// 1. 마지막에 조회된 글 번호를 쿠키로 생성해서, 클라이언트 측으로 전송
		Cookie cookie = new Cookie(bno, bno); // 쿠키형식( 1:1 , 2:2 ).....
		cookie.setMaxAge(30); // 30초 수명설정
		response.addCookie(cookie);
	}

}
