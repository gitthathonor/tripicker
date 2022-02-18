<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//1. 한글처리
request.setCharacterEncoding("UTF-8");

//2. 파라미터저장
int nNum = Integer.parseInt(request.getParameter("nNum"));
String pageNum = request.getParameter("pageNum");

%>
<fieldset>
	<legend>게시글 삭제</legend>
	<form action="./NoticeDeleteAction.no?pageNum=<%=pageNum %>" method="post">
		<input type="hidden" name="nNum" value="<%=nNum%>">
		비밀번호 : <input type="password" name="pw"><br>
		<input type="submit" value="글삭제하기" class="btn">
		<input type="button" value="뒤로가기" class="btn" onclick="history.back()">
	</form>
</fieldset>
</body>
</html>