package com.tripicker.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.admin.db.AdminDAO;
import com.tripicker.admin.db.AdminDTO;
import com.tripicker.city.db.CityDAO;
import com.tripicker.city.db.CityDTO;


public class AdminMemberRankAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("A : AdminMemberRankAction_execute() 실행!");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");	
		
		//세션제어
		HttpSession session = request.getSession();
		String id= (String) session.getAttribute("id");
		
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
		
		String gradeID = request.getParameter("gradeID");
		System.out.println(gradeID);
		request.setAttribute("gradeID", gradeID);		
		forward.setPath("./admin/AdminMemberRank.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
