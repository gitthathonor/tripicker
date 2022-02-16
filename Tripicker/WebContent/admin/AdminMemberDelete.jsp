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
     String id = (String)session.getAttribute("id");
   
     if(id == null){
    	 response.sendRedirect("./AdminMemberList.ad");
     }   
   
   %>
	<!-- <script type="text/javascript">
		  var result = confirm("회원을 강제 탈퇴 시키시겠습니까?");
		   
		  if(result){
			  alert("강제 탈퇴 처리 되었습니다");
			  response.sendRedirect("./AdminMemberDeleteProAction.ad");
		  }else{
			  alert("취소되었습니다");
		  }

</script> -->
   
</body>
</html>