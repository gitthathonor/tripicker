<%@page import="com.tripicker.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>여행 후기</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="./img/favicon.png" rel="icon">
  <link href="./img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="./lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="./lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="./lib/animate/animate.min.css" rel="stylesheet">
  <link href="./lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="./lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="./css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

	<%
		// 한글깨짐 방지
		request.setCharacterEncoding("UTF-8");
		// 닉네임 세션값 가져오기
		String nickname = (String)session.getAttribute("nickname");	
		String fileName = (String)request.getAttribute("fileName");
	%>
		
  <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">여행 후기</h1>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">         
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ 글 정보 폼 /-->
  <section class="property-single nav-arrow-b">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mb-3">
        <form action="./BoardModify.bo?boardNum=${content.boardNum }" enctype="multipart/form-data" method="post" name="ft">
        
        <!-- 글번호, 글비밀번호, 로그인중인 닉네임, 글쓴이 -->
        <input type="hidden" name="boardNum" value="${content.boardNum }">
        <input type="hidden" name="boardPass" value="${content.boardPass}">
        <input type="hidden" name="writer" value="${content.nickname }">
        <input type="hidden" name="nickname" value="<%=nickname %>">
        <!-- /글번호, 글비밀번호, 로그인중인 닉네임, 글쓴이 -->
        
   		 <strong> 제목 </strong> <input type="text" id="" class="form-control form-control-lg form-control-a" name="boardTitle" value="${content.boardTitle }" readonly><br>  
   		 <textarea rows="10" cols="50" name="boardContent" class="form-control form-control-lg form-control-a" readonly>${content.boardContent }</textarea>
   		 <br><br>
   		 <strong> 사진 </strong> 
   		 <c:set var="requestboardFile" value="${content.boardFile }"/>
   		 <c:choose>
   		 	<c:when test="${!empty requestboardFile }">
   		 		<%-- <a href="${content.boardFile }">${fileName }</a> --%>
   		 		<img class="img-fluid" src="./save/<%=fileName %>" id="boardFile">
   		 	</c:when>
	   		<c:otherwise>
	   			<a>첨부파일 없음</a>
	   		</c:otherwise>	   		 	
   		 </c:choose>
   		 <div id="att_zone"></div>  		   		   		 
   		 <input type="hidden" name="fileName" value="">
   		 <br>  	 
    	 <strong> 태그 </strong><input type="text" class="form-control form-control-lg form-control-a" name="tag" value="${content.tag }" maxlength="50" readonly><br>    	     	   	     	      	   	 			 
		 <div id="input_boardPass" style="display:none">
		 <strong> 글비밀번호 </strong><input type="text" class="form-control form-control-lg form-control-a" name="inputBoardPass" value="" maxlength="4"><br>
		 </div>
		 <input type="button" value="목록으로" class="btn btn-a" onclick="history.back();">						
	
	     <!-- 로그인된 회원의 닉네임과 글쓴이가 일치시, 글 수정/삭제 버튼 보이게 -->	
		 <div id="modify_btn" style="display:none"><input type="submit" value="수정" class="btn btn-a" ></div>		
      	 <div id="delete_btn" style="display:none"><input type="button" value="삭제" class="btn btn-a" onclick="return checkDelBoard();"></div>			
	
      	 </form>
        </div>
      </div>
    </div>	
  </section>
  <!--/ 글 정보 폼 끝 /-->
  
  
<%--   <!-- 댓글 페이지 -->
  	<jsp:include page="commentForm.jsp">
  		<jsp:param value="${content.boardNum }" name="boardNum"/>
  		<jsp:param value="${content.nickname }" name="nickname"/> 	
  	</jsp:include>
  <!-- 댓글 페이지 --> --%>
  
  
  <!-- footer -->
  	<jsp:include page="../inc/bottom.jsp"/>
  <!-- footer -->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="./lib/jquery/jquery.min.js"></script>
  <script src="./lib/jquery/jquery-migrate.min.js"></script>
  <script src="./lib/popper/popper.min.js"></script>
  <script src="./lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="./lib/easing/easing.min.js"></script>
  <script src="./lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="./lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="./contactform/contactform.js"></script>
  <!-- Template Main Javascript File -->
  <script src="./js/main.js"></script>



  <script type="text/javascript">
  
  // 수정,삭제 버튼 보여주기
  $(document).ready(function(){
	  if( $("input[name='nickname']").val() === $("input[name='writer']").val() ){
		  $('#modify_btn').css('display','inline');
		  $('#delete_btn').css('display','inline');
		  $('#input_boardPass').css('display','inline');
	  }
  });
		  

  // 글비밀번호 확인
  function checkDelBoard(){
	  
	  var inputBoardPass = document.ft.inputBoardPass.value;
	  if(inputBoardPass === ""){
		  alert('비밀번호를 입력해주세요');
		  document.ft.inputBoardPass.focus();
		  return false;
	  }else if(inputBoardPass != document.ft.boardPass.value){
		  alert('맞지 않는 비밀번호입니다');
		  document.ft.inputBoardPass.focus();
		  return false;		  
	  }else{ //비밀번호 일치
		  location.href = "./BoardDeleteAction.bo?boardNum="+${content.boardNum};
	  }
	  
  }
    
  
  </script>
</body>
</html>
