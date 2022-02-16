<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등급 변경 페이지</title>
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("select[name=changRank]").change(function(){
			var changeRank = $("select[name=changRank]").val();
			alert(changeRank);
		});
	});
</script>
</head>
<body>
   
      <%
     // 세션값 제어
     String id = (String)session.getAttribute("id");
      Integer rank = (Integer)session.getAttribute("rank");
   
     if(id == null || rank != 4){
    	 response.sendRedirect("./MemberLogin.me");
     }   
     
    %>
   ${rankID }
   
	
	<form action="./AdminMemberRankProAction.ad" method="post">
	<input type="hidden" name="rankID" value="${rankID } ">
		<select name=changeRank>
		<option value="1">1 : 일반</option>
		<option value="2">2 : 도우미</option>
		<option value="3">3 : 매니저</option>
		<option value="4">4 : 관리자</option>
		</select> 
	<input type="submit" value="변경">
	</form>
   
</body>
</html>