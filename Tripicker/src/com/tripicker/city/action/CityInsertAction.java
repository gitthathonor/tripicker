package com.tripicker.city.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.city.db.CityDAO;
import com.tripicker.city.db.CityDTO;


public class CityInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("A : CityInsertAction_execute() 실행!");
		
		request.setCharacterEncoding("UTF-8");
		
		CityDTO cdto = new CityDTO();
		CityDAO cdao = new CityDAO();
		
		cdao.insertCityInfo(cdto);
		System.out.println("A : 도시정보 저장 완료!");
		
		cdto = cdao.getCity(3);
		System.out.println("A : cityDTO 정보 들고오기 완료!");
		
		request.setAttribute("cdto", cdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/CityInsert.ci");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
