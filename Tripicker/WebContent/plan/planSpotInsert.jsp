<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tripicker - 여행 계획 짜기(Main)</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- jquery & jquery UI 라이브러리  -->
<script src="./js/jquery-3.6.0.js"></script>
<script src="./js/jquery-ui.js"></script>
<link href="./css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="./css/jquery-ui.structure.css" rel="stylesheet"
	type="text/css">
<link href="./css/jquery-ui.theme.css" rel="stylesheet" type="text/css">
<link href="./css/plan/plan.css" rel="stylesheet" type="text/css">

<style type="text/css">
/* 검색창 form태그 css  */
#searchSpotForm {
	margin-left: 30%;
} 

/* 탭창의 p태그 css  */
.spotDayPlan {
	height: 500px;
}

</style>

<!-- javscript 및 jquery 코드들 -->
<script type="text/javascript">
  	$(document).ready(function(){
  		
  		// 관광지 타입 정하기
  		
  		/* $('#contentTypeSelect').select()
  		var contentType = $('#contentTypeSelect').val();
  		alert(contentType); */
  		
  		
  		$("#insertSpotTab").tabs(function(){
  			
  		}); //tab 창 코드
  		
  		
  	}); //jquery 전체 구문
  </script>


<!-- Favicons -->
<link href="./img/favicon.png" rel="icon">
<link href="./img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="./lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="./lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="./lib/animate/animate.min.css" rel="stylesheet">
<link href="./lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="./lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

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
		int tourDay = Integer.parseInt(request.getParameter("tourDay"));
	%>

	<div class="click-closed"></div>

	<!-- header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- header -->

	<!-- 인트로 -->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">어디로 여행을 떠나고 싶으신가요?</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 인트로 -->

	<!-- 지역 및 관광지 검색 창 -->
	<section class="section-about">
		<fieldset>
			<form id="searchSpotForm" method="post" action="./searchSpotAction.pl">
			<table>
				<tr>
					<td>
						<select name="contentTypeId" id="contentTypeSelect">
							<option value="관광타입" selected="selected">관광타입</option>
							<option value="12">관광지</option>
							<option value="14">문화시설</option>
							<option value="15">축제공연행사</option>
							<option value="28">레포츠</option>
							<option value="32">숙박</option>
							<option value="38">쇼핑</option>
							<option value="39">음식점</option>
						</select> 
					</td>
				</tr>
					<tr>
						<td>
							<div>
								<span>
									<select name="cat1" title="대분류" onchange="getCat2List(this)">
										<option value="">대분류</option>
										<option value="A01">자연</option>
										<option value="A02">인문(문화/예술/역사)</option>
										<option value="A03">레포츠</option>
										<option value="B02">숙박</option>
										<option value="A04">쇼핑</option>
										<option value="A05">음식</option>
									</select>
									<select name="cat2" title="중분류" onchange="getCat3List(this)">
										<option value="">중분류</option>
									</select>
									<select name="cat3" title="소분류">
										<option value="">소분류</option>
									</select>
								</span>
								<span>
									<select name="cat1" title="대분류" style="display: none;" onchange="getCat2List(this)">
										<option value="">대분류</option>
										<option value="A01">자연</option>
										<option value="A02">인문(문화/예술/역사)</option>
										<option value="A03">레포츠</option>
										<option value="B02">숙박</option>
										<option value="A04">쇼핑</option>
										<option value="A05">음식</option>
									</select>
									<select name="cat2" title="중분류" style="display: none;" onchange="getCat3List(this)">
										<option value="">중분류</option>
									</select>
									<select name="cat3" style="display: none; width:308px;" title="소분류">
										<option value="">소분류</option>
									</select>
								</span>
								<span>
									<select name="cat1" title="대분류" style="display: none;" onchange="getCat2List(this)">
										<option value="">대분류</option>
										<option value="A01">자연</option>
										<option value="A02">인문(문화/예술/역사)</option>
										<option value="A03">레포츠</option>
										<option value="B02">숙박</option>
										<option value="A04">쇼핑</option>
										<option value="A05">음식</option>
									</select>
									<select name="cat2" title="중분류" style="display: none;" onchange="getCat3List(this)">
										<option value="">중분류</option>
									</select>
									<select name="cat3" style="display: none; width:308px;" title="소분류">
										<option value="">소분류</option>
									</select>
								</span>
							</div>
						</td>
				</tr>
				<tr>
					<td>
						<select id="areaCode">
						</select>
					</td>
					<td>
						<select id="sigunguCode">
						</select>
					</td>
				</tr>
			</table>
			</form>
		</fieldset>
	</section>
	
	<!-- 지역 및 관광지 검색 창 -->

	<!-- 데이터 출력 창 -->
	<section>
		<div id="spotInfo" style="width: 50%" class="spotInfo">
			<ul>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<a href="">1</a>&nbsp;&nbsp;<a href="">2</a>
		</div>

		<div id="insertSpotTab" style="height: 300px;"> <!-- style="margin-left: 50%; margin-bottom: 70%; height: auto;" class="spotInfo" -->
			<ul>
				<li><a href="#tabs-1"></a></li>
			</ul>
			<div id="tabs-1">
				<p class="spotDayPlan"></p>
			</div>
			<div id="tabs-2">
				<p class="spotDayPlan"></p>
			</div>
			<div id="tabs-3">
				<p class="spotDayPlan"></p>
			</div>
		</div>
	</section>

	<!-- 데이터 출력 창 -->

	<!-- 페이징 처리 -->
	<div>
		<a></a>
	</div>
	<!-- 페이징 처리 -->









	<!-- footer -->
	<jsp:include page="../inc/bottom.jsp" />
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
