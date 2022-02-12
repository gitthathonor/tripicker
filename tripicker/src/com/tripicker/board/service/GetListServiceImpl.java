package com.tripicker.board.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.board.model.BoardVO;
import com.tripicker.board.persistence.BoardDAO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> list = dao.getList();
		
		request.setAttribute("list", list);	
	}

}
