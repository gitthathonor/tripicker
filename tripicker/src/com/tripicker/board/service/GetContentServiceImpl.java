package com.tripicker.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.board.model.BoardVO;
import com.tripicker.board.persistence.BoardDAO;

public class GetContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bno = request.getParameter("bno");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardVO vo = dao.getContent(bno);
		
		request.setAttribute("vo", vo);
	}

}
