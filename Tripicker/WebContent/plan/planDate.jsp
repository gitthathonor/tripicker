<%@page import="com.tripicker.ActionForward"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Tripicker - 여행 계획 짜기(기간)</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  
  <!-- jquery & jquery UI 라이브러리  -->
  <script src="./js/jquery-3.6.0.js"></script>
  <script src="./js/jquery-ui.js"></script>
  <link href="./css/jquery-ui.css" rel="stylesheet" type="text/css">
  <link href="./css/jquery-ui.structure.css" rel="stylesheet" type="text/css">
  <link href="./css/jquery-ui.theme.css" rel="stylesheet" type="text/css">
  <link href="./css/plan/plan.css" rel="stylesheet" type="text/css">
  
  <!-- javscript 및 jquery 코드들 -->
  <script type="text/javascript">
  	$(document).ready(function(){
  		
  		$("#startDate").datepicker({
  			showOn: "both",
  			buttonText: "날짜선택",
  			dateFormat: "yy-mm-dd",
  			changeMonth: true,
  			minDate: 0,
  			onClose: function(selectedDate) {
  				$("#lastDate").datepicker("option","minDate",selectedDate);
  			}
  			 
  		}); //시작날짜 선택
  		
  		$("#lastDate").datepicker({
  			showOn: "both",
  			buttonText: "날짜선택",
  			dateFormat: "yy-mm-dd",
  			changeMonth: true,
  			minDate: 0,
  			onClose: function(selectedDate) {
  				$("#startDate").datepicker("option", "maxDate", selectedDate);
  			}
  		}); //도착날짜 선택
  		
  		
  	}); //jquery 전체 구문
  	
  	
  </script>
	
	
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
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
	
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("./UserLogin.us");
		}
		
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
            <h1 class="title-single">언제 여행을 떠나실 예정이신가요?</h1>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ About Star /-->
  <section class="section-about">
  	<fieldset>
  		<form action="./PlanDateAction.pl" method="post" id="selectDate">
  			<input type="text" name="startDate" id="startDate" autocomplete="off"> 
  			 <input type="text" name="lastDate" id="lastDate" autocomplete="off"> 
  			 <input type="submit" value="날짜 전송" id="submitDate">
  		</form>
  	</fieldset>
  </section>
  <!--/ About End /-->

  <!--/ Team Star /-->
  <section class="section-agents section-t8">
    
  </section>
  <!--/ Team End /-->

  <!-- footer -->
  	<jsp:include page="../inc/bottom.jsp"/>
  <!-- footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <!-- <script src="./lib/jquery/jquery.min.js"></script>
  <script src="./lib/jquery/jquery-migrate.min.js"></script> -->
  <script src="./lib/popper/popper.min.js"></script>
  <script src="./lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="./lib/easing/easing.min.js"></script>
  <script src="./lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="./lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="./contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="./js/main.js"></script>
  
</body>
</html>
