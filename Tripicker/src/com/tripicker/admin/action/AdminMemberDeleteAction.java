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


public class AdminMemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("A : AdminMemberDeleteAction_execute() 실행!");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");	
		
		//세션제어
		HttpSession session = request.getSession();
		String id= (String) session.getAttribute("id");
		String rank= session.getAttribute("rank")+"";
		
		ActionForward forward = new ActionForward();
		if(id==null || !rank.equals("1")){
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
		// delete 시키기
		String deleteID = request.getParameter("deleteID");
		System.out.println(deleteID);
		AdminDAO adao = new AdminDAO();
		adao.AdminMemberDelete(deleteID);
		//session.setAttribute("deleteID", deleteID);
		
		forward.setPath("./AdminMemberList.ad");
		forward.setRedirect(true);
		return forward;
	}
	
}
