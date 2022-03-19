<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="list">
				
				
		                
		       <!-- 댓글 폼 -->
				<tr>
		            <form id="updateCommentForm" name="updateCommentForm" method="post">
		           	 	<input type="hidden" name="command" value="board_comment">
		           	 	<input type="hidden" name="comment_id" value="${nickname}">
		                <input type="hidden" name="board_num" value="${comment.boardNum}">
		                <!--닉네임-->
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
		                    	<input type="button" value="댓글 수정" onclick="location.href='./CommentUpdate.co';"> 
		                    	
		                    	
		                    </div>
		                </td>
		            </form>
	            </tr>
					
			
				
				
			<tr></tr>
			</table>
</body>
</html>