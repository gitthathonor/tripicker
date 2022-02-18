<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
   
      <%
     // 세션값 제어
     //String rankID = (String)session.getAttribute("id");
   		String gradeID = request.getParameter("gradeID");
     //if(id == null){
    	// response.sendRedirect("./MemberLogin.me");
     
    %>
   
   
	
	<form action="./AdminMemberRankProAction.ad" method="post">
	<input type="hidden" name="gradeID" value="<%=gradeID %>">
		<select name=grade>
		<option value="1">1 : 일반</option>
		<option value="2">2 : 도우미</option>
		<option value="3">3 : 매니저</option>
		<option value="4">4 : 관리자</option>
		</select> 
	<input type="submit" value="변경">
	</form>
   
</body>
</html>