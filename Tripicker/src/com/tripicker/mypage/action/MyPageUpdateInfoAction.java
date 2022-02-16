package com.tripicker.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.mypage.db.MyPageDAO;
import com.tripicker.mypage.db.MyPageDTO;

public class MyPageUpdateInfoAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyPage: MyPageUpdateInfoAction_execute()");
		
		// 세션체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./UserLogin.us");
			forward.setRedirect(true);
			return forward;
		}
		
		MyPageDAO dao = new MyPageDAO();
		MyPageDTO dto = dao.getUser(id);
		request.setAttribute("dto", dto);
		
		forward.setPath("./mypage/updateInfo.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
	
	
}
