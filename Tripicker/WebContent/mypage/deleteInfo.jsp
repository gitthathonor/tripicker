<%@page import="com.tripicker.mypage.db.MyPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>TripPicker</title>
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
  <link href="./css/board.css" rel="stylesheet">
  
  <!-- Main Stylesheet File -->
  <link href="./css/style.css" rel="stylesheet">
  

</head>

<body>
  <div class="click-closed"></div>

  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->
  
  <%
  	String id = (String) session.getAttribute("id");
  
  	if(id == null){
  		response.sendRedirect("./UserLogin.us");
  	}
  
  	MyPageDTO dto = (MyPageDTO) request.getAttribute("dto");
  
  %>



  <!--/ 제목 /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">회원탈퇴</h1>
            <h6>회원탈퇴를 위해 비밀번호를 입력해 주세요</h6>
          </div>
        </div>
       </div>
      </div> 
   </section>    
  <!--/ 제목 /-->


  <!-- 내정보 출력 -->
	
		<div class="container">
		
			<div style="margin-left: 40%; margin-bottom: 10%;">
				<form action="./MyPageDeleteInfoAction.my" method="post" name="fr" onsubmit="return del();">
					<input type="hidden" name="id" value="${sessionScope.id }">
					비밀번호
					<input type="password" name="pass" id="input_pass" class="form-control col-4" value="" >
				   
			</div>
		
		<input type="submit" class="btn btn-a" value="탈퇴하기"
			style="float: right; font-size: small;">
		</form>
		<br><br><br><br>
		
	</div>

	<!-- 내정보 출력 -->

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
 
 <!-- 회원가입 정보 체크 스크립트 -->
 <script type="text/javascript">
 function del() {
		alert("정말 탈퇴하시겠습니까?");				
	}
  
</script>
</body>
</html>
