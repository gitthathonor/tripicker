package com.tripicker.city.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.city.db.CityDAO;
import com.tripicker.city.db.CityDTO;

public class CityChoice2Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		CityDTO cdto = new CityDTO();
		CityDAO cdao = new CityDAO();
		
		
		
		return null;
	}
	
}
