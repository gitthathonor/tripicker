<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%			
		request.setCharacterEncoding("UTF-8");
		String nickname = request.getParameter("nickname");	
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	%>
	<table id="list">
				<!-- 댓글 list -->
				<c:forEach var="comment" items="${comment.list }">
					<tr class="record">
						<td align="center">${comment.nickname}</td>
						<td>${comment.content} </td>
						<td>${comment.writedate}</td>
						<input type="button" value="댓글 수정" onclick="location.href='./CommentUpdate.co';"> 
		                <input type="button" value="댓글 삭제" onclick="location.href='./CommentDelete.co';"> 
					</tr>
				</c:forEach>
				
				
				<!-- 댓글 폼 -->
				<tr>
		            <form id="writeCommentForm" name="writeCommentForm" method="post">
		           	 	<input type="hidden" name="command" value="board_comment">
		           	 	<input type="hidden" name="comment_id" value=<%=nickname%>>
		           	 	<h3><%=nickname%></h3>
		                <input type="hidden" name="board_num" value=<%=request.getParameter("boardNum") %>>
		                <h3><%=request.getParameter("boardNum")%></h3>
		                <!-- 아이디-->
		                <td width="150" >
		                    <div align="center">
		                        ${nickname }
		                    </div>
		                </td>
		                <!-- 본문 작성-->
		                <td width="550">
		                    <div>
		                        <textarea name="comment_content" id="comment_content" rows="4" cols="70" ></textarea>
		                    </div>
		                </td>
		                <!-- 댓글 등록 버튼 -->
		                <td width="10">
		                    <div id="btn" style="text-align:center;">
		                    	<input type="button" value="댓글 등록" onclick="location.href='./CommentInsert.co';"> 
		                    	
		                    	
		                    </div>
		                </td>
		            </form>
	            </tr>
	
			<tr></tr>
			</table>
</body>
</html>