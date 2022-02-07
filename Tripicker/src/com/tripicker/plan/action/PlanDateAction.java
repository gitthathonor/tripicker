package com.tripicker.plan.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

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
		
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println(request.getParameter("startDate"));
		System.out.println(request.getParameter("lastDate"));
		String startDateString = request.getParameter("startDate");
		String lastDateString = request.getParameter("lastDate");
		/*System.out.println(startDateString.substring(5,7));
		int startMonth = Integer.parseInt(startDateString.substring(5, 7))+1;
		
		System.out.println(startMonth);
		int lastMonth = Integer.parseInt(lastDateString.substring(5, 7))+1;
		System.out.println(lastMonth);*/
		
//		java.util.Date startUtilDate = sdf.parse(request.getParameter("startDate"));
//		java.util.Date lastUtilDate = sdf.parse(request.getParameter("lastDate"));
//		System.out.println(startUtilDate);
//		System.out.println(lastUtilDate);
//		startUtilDate.setMonth(startUtilDate.getMonth()+1);
//		lastUtilDate.setMonth(lastUtilDate.getMonth()+1);
		
		
		java.sql.Date  startDate = java.sql.Date.valueOf(startDateString);
		java.sql.Date  lastDate = java.sql.Date.valueOf(lastDateString);
		
		long periodDate = lastDate.getTime()-startDate.getTime();
		long periodRealDate = periodDate/(24*60*60*1000);
		System.out.println(periodRealDate);
		
		
		String period = periodRealDate+"박"+(periodRealDate+1)+"일";
		
		System.out.println(startDate);
		System.out.println(lastDate);
		
		PlanDTO pdto = new PlanDTO();
		
		pdto.setStartDate(startDate);
		pdto.setLastDate(lastDate);
		pdto.setPeriod(period);
		
		//planSeqNum을 계산해서 setter에 넣는 계산필요
		//planSeqNum을 계산해서 setter에 넣는 계산필요
		
		PlanDAO pdao = new PlanDAO();
		pdao.insertDate(pdto);
		
		int tourDay = (int)periodRealDate + 1;
		
		request.setAttribute("tourDay", tourDay);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./PlanSpotInsert.pl");
		forward.setRedirect(true);
		return forward;
	}
	
}
