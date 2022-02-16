package com.tripicker.plan.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.plan.db.PlanDAO;
import com.tripicker.plan.db.PlanDTO;

public class PlanDateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("A : PlanDateAction_execute() 호출!");
		
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
		
		System.out.println(request.getParameter("startDate"));
		System.out.println(request.getParameter("lastDate"));
		String startDateString = request.getParameter("startDate");
		String lastDateString = request.getParameter("lastDate");
		
		
		java.sql.Date  startDate = java.sql.Date.valueOf(startDateString);
		java.sql.Date  lastDate = java.sql.Date.valueOf(lastDateString);
		
		long periodDate = lastDate.getTime()-startDate.getTime();
		long periodRealDate = periodDate/(24*60*60*1000);
		System.out.println(periodRealDate);
		
		
		String period = periodRealDate+"박"+(periodRealDate+1)+"일";
		
		System.out.println(startDate);
		System.out.println(lastDate);
		
		PlanDTO pdto = new PlanDTO();
		
		pdto.setId(id);
		pdto.setStartDate(startDate);
		pdto.setLastDate(lastDate);
		pdto.setPeriod(period);
		
		//planSeqNum을 계산해서 setter에 넣는 계산필요
		//planSeqNum을 계산해서 setter에 넣는 계산필요
		
		PlanDAO pdao = new PlanDAO();
		pdao.insertDate(pdto, id);
		
		int tourDay = (int)periodRealDate+1;
		//System.out.println(tourDay);
		
		session = request.getSession();
		session.setAttribute("tourDay", tourDay);
		
		
//		String[] arrSpot = {"불국사","광화문","순천만","오죽헌","경복궁","광안대교"};
//		
//		request.setAttribute("arrSpot", arrSpot);
		
		
		
		forward.setPath("./PlanSpotInsert.pl");
		forward.setRedirect(true);
		return forward;
	}
	
}
