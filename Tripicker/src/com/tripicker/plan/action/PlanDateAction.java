package com.tripicker.plan.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.plan.db.PlanDAO;
import com.tripicker.plan.db.PlanDTO;

public class PlanDateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-mm-dd");
		java.sql.Date startDate = (java.sql.Date) sdf.parse(request.getParameter("startDate"));
		java.sql.Date lastDate = (java.sql.Date) sdf.parse(request.getParameter("lastDate"));
		
		
		PlanDTO pdto = new PlanDTO();
		
		pdto.setStartDate(startDate);
		pdto.setLastDate(lastDate);
		
		PlanDAO pdao = new PlanDAO();
		pdao.insertDate(pdto);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./PlanCityInsert.pl");
		forward.setRedirect(true);
		return forward;
	}
	
}
