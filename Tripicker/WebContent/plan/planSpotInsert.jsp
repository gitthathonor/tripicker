<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tripicker - 여행 계획 짜기(장소)</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- jquery & jquery UI 라이브러리  -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="js/jquery-ui.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.structure.css" rel="stylesheet"
	type="text/css">
<link href="css/jquery-ui.theme.css" rel="stylesheet" type="text/css">
<link href="css/plan/plan.css" rel="stylesheet" type="text/css">

<style type="text/css">
/* 검색창 form태그 css  */
#searchSpotForm {
	margin-left: 30%;
} 

/* 탭창의 p태그 css  */
.spotDayPlan {
	height: 500px;
}

/* 관광지 이미지 크기  */
.areaImage {
	width: 211px;
	height: 120px;
}

</style>

<!-- javscript 및 jquery 코드들 -->
<script type="text/javascript">
  		
	$(document).ready(function(){
	
		$("select[name=areacode] > option").each(function(){
			if( $(this).val() == ""){
				$(this).attr("selected","selected");
			}	    			
		});
	
		$("select[name=contentType] > option").each(function(){
			if( $(this).val() == ""){
				$(this).attr("selected","selected");
			}	    			
		});
	}); // 관광타입과 지역코드 초기화
  		
  		
  		//API 서비스 키
  		var servicekey = "YF2x%2FO1BlpMsxJQE9EcsZinR9%2FtVU8Ho4qbE9OTsA3eU19TPByqfFMTzVq4oP8WQLesJOA4G13m7qRYpx9KqXQ%3D%3D";
  		
  		
  		//tab 창 코드
  		/*$(document).ready(function(){
  			$("#insertSpotTab").tabs();
  		});*/
  		
  		
  			
  		// select 결과에 따른 검색결과 들고오기 //
  		
  		
  		// 타입 변경에 따른 대분류
		function getCat1List(contentType) {
  			contentType = $("select[name=contentType]").val();
  			
  			$(document).ready(function(){
  				$.ajax({
  					url : " http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&MobileOS=ETC&MobileApp=AppTesting",
  					data : {"contentType":contentType},		
  					success : function(data) {
  						
  						$("select[name=cat1]").empty();
  						$("select[name=cat1]").append("<option value=''>대분류</option>");
  						$(data).find("item").each(function(){
  							var cat1Code = $(this).find("code").text();
  							var cat1Name = $(this).find("name").text();
  							
  							if(cat1Name == "추천코스") {
  								return;
  							}
  							
  							$("select[name=cat1]").append("<option value="+cat1Code+">"+cat1Name+"</option>");
  							
  						}); 
  					} //success : function
  				}); //ajax
  			});
  		} // getCat1List
  		
  		
  		// 대분류 변경에 따른 중분류
  		function getCat2List(contentType, cat1) {
  			contentType = $("select[name=contentType]").val();
			cat1 = $("select[name=cat1]").val();
			
			
			if(cat1 == "") {
				$("select[name=cat2]").empty();
				$("select[name=cat2]").append("<option value=''>중분류</option>");
				
				$("select[name=cat3]").empty();
				$("select[name=cat3]").append("<option value=''>소분류</option>");
			}
			
			//alert(cat1);
			
  			$(document).ready(function(){
  				$.ajax({
  					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&cat1="+cat1+"&MobileOS=ETC&MobileApp=AppTesting",		
  					success : function(data) {
							//console.log(data);
							//alert(data)
							if(cat1 == "") {
  	  								return;
  	  						} 
							
							$("select[name=cat2]").empty();
							$("select[name=cat2]").append("<option value=''>중분류</option>");
							
							$(data).find("item").each(function(){
								var cat2Code = $(this).find("code").text();
	  							var cat2Name = $(this).find("name").text();
								
								$("select[name=cat2]").append("<option value="+cat2Code+">"+cat2Name+"</option>");
							});
							
							var cat2 = $("select[name=cat2]").val();
							
							if(cat2 == "") {
								$("select[name=cat3]").empty();
								$("select[name=cat3]").append("<option value=''>소분류</option>");
							} 
  					} //success : function
  					
  				}); //ajax
  				
  			});
  		} //getCat2List()
  		
  		
  		// 대분류, 중분류의 변경에 따른 소분류 지정
  		function getCat3List(contentType, cat1, cat2) {
  			contentType = $("select[name=contentType]").val();
  			cat1 = $("select[name=cat1]").val();
  			cat2 = $("select[name=cat2]").val();
  			
  			$(document).ready(function(){
  				$.ajax({
  					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&cat1="+cat1+"&cat2="+cat2+"&MobileOS=ETC&MobileApp=AppTesting",		
  					success : function(data) {
  							$("select[name=cat3]").empty();
  							$("select[name=cat3]").append("<option value=''>소분류</option>");
							var totalcount = $(data).find("totalCount").text();
							totalcount *= 1;
							
							$.ajax({
								url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&numOfRows="+totalcount+"&contentTypeId="+contentType+"&cat1="+cat1+"&cat2="+cat2+"&MobileOS=ETC&MobileApp=AppTesting",
								success : function(data) {
									
									//console.log(data);
									if(cat2 == "") {
	  	  								return;
	  	  							} 
									$("select[name=cat3]").empty();
		  							$("select[name=cat3]").append("<option value=''>소분류</option>");
		  							
		  							$(data).find("item").each(function(){
		  								var cat3Code = $(this).find("code").text();
		  								var cat3Name = $(this).find("name").text();
		  								
		  								$("select[name=cat3]").append("<option value="+cat3Code+">"+cat3Name+"</option>");
		  							});
									
								}
								
								}); //두번째 ajax 
							}
							
							
  					}); //첫번째 ajax
  					
  				});
  			
  		} //getCat3List(cat2)
  		
  		
  		
  		// 지역이 바뀔 때, 시군구 코드도 해당 지역에 맞게 들고오도록 만드는 메서드 
  		function getSigunguList(areacode) {
  			var areacode = $('select[name=areacode]').val();
  			
  			//alert(areacode);
  			
  			$(document).ready(function(){
  				$.ajax({
  	  				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey="+servicekey+"&MobileOS=ETC&MobileApp=AppTest&areaCode="+areacode,
  	  				data : {"areacode":areacode},
  	  				success : function(data) {
  	  					$("select[name=sigungucode]").empty();
						$("select[name=sigungucode]").append("<option value=''>시군구 선택</option>")
  	  					var totalcount = $(data).find('totalCount').text();
  	  					totalcount *= 1;
  	  					//alert(typeof totalcount);
  	  					
  	  					$.ajax({
  	  						url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey="+servicekey+"&numOfRows="+totalcount+"&MobileOS=ETC&MobileApp=AppTest&areaCode="+areacode,
  	  						data : {"areacode":areacode},
  	  						success : function(data) {
  	  							if(areacode == "") {
  	  								return;
  	  							} 
  	  							
  	  							$(data).find('item').each(function(){
  	  								
  	  								var sigunguname = $(this).find('name').text();
  	  								var sigungucode = $(this).find('code').text();
  	  								
  	  								$("select[name=sigungucode]").append("<option value="+sigungucode+">"+sigunguname+"</option>");
  	  							
  	  							});
  	  						} 
  	  					}); //두번째 ajax
  	  				}
  	  				
  	  			}); // 첫번째 ajax
  			}); 
  		} // getSigunguList
  		
  		
  		
  		// 검색 결과 나오게 하기
  		/* $(document).ready(function(){
  			$("#searchSpotBtn").click(function(){
  				$("#spotInfo > ul").empty();
  				
  				var contentType = $("select[name=contentType]").val();
  				var cat1 = $("select[name=cat1]").val();
  				var cat2 = $("select[name=cat2]").val();
  				var cat3 = $("select[name=cat3]").val();
  				var areacode = $("select[name=areacode]").val();
  				var sigungucode = $("select[name=sigungucode]").val();
  				var spotPageNum = 1;
  				
  				
  				$.ajax({
  					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?serviceKey="+servicekey+"&pageNo=1&numOfRows=10&MobileApp=AppTest&MobileOS=ETC&cat1"+cat1+"&contentTypeId="+contentType+"&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat2"+cat2+"&cat3"+cat3+"&listYN=N",
  					success : function(data) {
  						// console.lot(data);
  						var totalcount = $(data).find("totalCount").text();
  						alert(totalcount);
  						pageNo = parseInt(totalcount/10)+1;
  						alert(pageNo);
  						
  						for(var i=1; i<=pageNo; i++) {
	  						$.ajax({
	  							url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?serviceKey="+servicekey+"&pageNo="+i+"&numOfRows=10&MobileApp=AppTest&MobileOS=ETC&cat1"+cat1+"&contentTypeId="+contentType+"&areaCode="+areacode+"&sigunguCode="+sigungucode+"&cat2"+cat2+"&cat3"+cat3+"&listYN=Y",
	  							success : function(data) {
	  								console.log(data);
	  								$(data).find("item").each(function(){
	  									var spotCode = $(this).find("contentid").text();
	  									var spotName = $(this).find("title").text();
	  									
	  									$("#spotInfo > ul").append("<li value="+spotCode+">"+spotName+"</li>");
	  									
	  								});
	  							}
	  						}); //두번재 ajax
  						}// for문
  					}
  				}); // 첫번째 ajax
  			});
  		}); */
 		
  		
  		
  		
  		//검색 결과 나오게 하기(xml 파싱 이용 - 데이터 값 넘기기 이용) 
  		/* function searchSpot(contentType,cat1,cat2,cat3,areacode,sigungucode) {
			$(document).ready(function(){
				contentType = $("select[name=contentType]").val();
				cat1 = $("select[name=cat1]").val();
				cat2 = $("select[name=cat2]").val();
				cat3 = $("select[name=cat3]").val();
				areacode = $("select[name=areacode]").val();
				sigungucode = $("select[name=sigungucode]").val();
				
				$.ajax({
					url:"./PlanSpotInsertAction.pl",
					type:"GET",
					data:{contentType:contentType,cat1:cat1,cat2:cat2,cat3:cat3,areacode:areacode,sigungucode:sigungucode},
					success:function(data) {
						alert(data);
						console.log(data);
						alert(data.length);
					}
					
				}); //ajax
			});
		} //searchSpot() */
  		
		
		var noImage = "https://api.visitkorea.or.kr/static/images/common/noImage.gif";
  		
  		
  		// 검색 결과 나오게 하기 (ajax로 곧바로 주소 호출)
  		function searchSpot(contentType,cat1,cat2,cat3,areacode,sigungucode, pageNo) {
			$(document).ready(function(){
				
				$("#spotInfo > ul").empty();
				$("#areaPage").empty();
				
				contentType = $("select[name=contentType]").val();
				cat1 = $("select[name=cat1]").val();
				cat2 = $("select[name=cat2]").val();
				cat3 = $("select[name=cat3]").val();
				areacode = $("select[name=areacode]").val();
				sigungucode = $("select[name=sigungucode]").val();
				
				alert(contentType);
				alert(cat1);
				alert(cat2);
				alert(cat3);
				alert(areacode);
				alert(sigungucode);
				
				pageNo = 1;
				
				alert(pageNo);
				
				var a = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?serviceKey="+servicekey+"&numOfRows=10&MobileApp=AppTest&MobileOS=ETC&arrange=A&pageNo="+pageNo;
				if(contentType != "") {
					a += "&contentTypeId="+contentType;
				}
				if(cat1 != "") {
					a += "&cat1="+cat1;
				}
				if(cat2 != "") {
					a += "&cat2="+cat2;
				}
				if(cat3 != "") {
					a += "&cat3="+cat3;
				}
				if(areacode != "") {
					a += "&areaCode="+areacode;
				}
				if(sigungucode != "") {
					a += "&sigunguCode="+sigungucode;
				}
				
				console.log(a);
				
				
				$.ajax({
					url:a+"&listYN=N",
					success:function(data) {
						//console.log(data);
						var totalcount = $(data).find("totalCount").text();
						totalcount *= 1;
						alert(totalcount);
						
						$.ajax({
							url:a+"&listYN=Y",
							success:function(data){
									$(data).find("item").each(function(){
										var areaname = $(this).find("title").text();
										var imgUrl = $(this).find("firstimage").text();
										
										if(typeof imgUrl === 'undefined') {
											imgUrl = "https://api.visitkorea.or.kr/static/images/common/noImage.gif";
										}
										
										$("#spotInfo > ul").append("<li value="+areaname+" name='spotList' class='areaInfo' onclick='addSpot();'><img src="+imgUrl+" class='areaImage'><p>"+areaname+"</p></li>");
										
									});
									
									var pagetotalNum = totalcount/10;
									if(totalcount%10 != 0) {
										pagetotalNum += 1;
									}
									
									var pageBlock = 5; //한 페이지에 출력되는 페이지 갯수
									var startPage = pageNo + pageBlock; //한 페이지의 첫 시작 페이지
									var lastPage = 0;//한 페이지의 마지막 페이지
									var pageSize = 10; //한 페이지 내의 출력되는 내용물 갯수
									
									for(var i=1; i<=pageBlock; i++) {
										$("#areaPage").append("<input type='button' name = 'pageNum' class='areaInfoList' value="+i+" onclick='searchSpots(this);'>&nbsp&nbsp");
									}
							}
						}); // 2중 ajax
					}
				}); //첫번째 ajax
			}); //jquery 전체
		} //searchSpot()
		
		
		function searchSpots() {
				alert("hello");
				
		}// 페이지 이동에 따른 검색 결과들
		
		
		// 목록을 클릭하면, 옆에 계획표에 다시 담기게 만들기
		function addSpot() {
			alert(this.value);
		}
		
  </script>


<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String a = String.valueOf(session.getAttribute("tourDay"));
		//System.out.println(a);
		
		int tourDay = Integer.parseInt(a);
		
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("./UserLogin.us");
		}
		
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
		<div id="selectArea">
		<fieldset>
			<form id="searchSpotForm" method="post" action="./PlanSpotInsertAction.pl">
			<table>
				<tr>
					<td>
						<select name="contentType" onchange="getCat1List(this);">
							<option value="" selected="selected">관광타입</option>
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
									<select name="cat1" title="대분류" style="width:150px;" onchange="getCat2List(this)">
										<option value="">대분류</option>
										<option value="A01">자연</option>
										<option value="A02">인문(문화/예술/역사)</option>
										<option value="A03">레포츠</option>
										<option value="B02">숙박</option>
										<option value="A04">쇼핑</option>
										<option value="A05">음식</option>
									</select>
									<select name="cat2" title="중분류" style="width:120px;" onchange="getCat3List(this)">
										<option value="">중분류</option>
									</select>
									<select name="cat3" title="소분류" style="width:120px;">
										<option value="">소분류</option>
									</select>
								</span>
							</div>
						</td>
				</tr>
				<tr>
					<td>
						<select name="areacode" title="지역선택" onchange="getSigunguList(this.value);">
							<option value="" selected="selected">지역선택</option>
							<option value="1">서울</option>
							<option value="2">인천</option>
							<option value="3">대전</option>
							<option value="4">대구</option>
							<option value="5">광주</option>
							<option value="6">부산</option>
							<option value="7">울산</option>
							<option value="8">세종특별자치시</option>
							<option value="31">경기도</option>
							<option value="32">강원도</option>
							<option value="33">충청북도</option>
							<option value="34">충청남도</option>
							<option value="35">경상북도</option>
							<option value="36">경상남도</option>
							<option value="37">전라북도</option>
							<option value="38">전라남도</option>
							<option value="39">제주도</option>	
						</select>
					</td>
					<td>
						<select name="sigungucode" title="시군구선택">
							<option value="" selected="selected">시군구 선택</option>
						</select>
					</td>
				</tr>
			</table>
				<table class="bbsSearch">
							<colgroup>
								<col style="width:95px;">
								<col style="width:861px;">
							</colgroup>
							<tbody>				
								<tr>
									<th class="last wHacki8" scope="row">
									<input type="button" id="searchSpotBtn" value="검색" onclick="searchSpot();">
									</th>
									<td class="last">
									    <input type="hidden" name="mode" value="listOk">
									</td>
								</tr>
							</tbody>
						</table>			
			</form>
		</fieldset>
		</div>
	</section>
	
	<!-- 지역 및 관광지 검색 창 -->
	
	
	
	<!-- <img src="https://api.visitkorea.or.kr/static/images/common/noImage.gif"> -->
	
	<!-- 데이터 출력 창 -->
	<section style="display:inline-block;">
			<%-- <div id="insertSpotTab" style="height: 500px; width: 600px; float:right; margin-left:400px; "> 
			<ul>
			<%for(int i=1; i<=tourDay; i++) {%>
				<li><a href="#tabs-<%=i%>">Day<%=i%></a></li>
			<%}%>
			</ul>
			<%for(int i=1; i<=tourDay; i++) {%>
			<div id="tabs-<%=i%>" class="spotDayTab">
				<p class="spotDayPlan" style="height: 500px; width: 500px; padding: 0.5em; float: left; margin: 10px;">관광지를 넣어주세요!</p>
			</div>
			<%}%>
		</div> --%>
		<div id="insertSpotTab" style="height: 500px; width: 600px; float:right; margin-left:400px;">
			<table>
			<%for(int i=1; i<=tourDay; i++) { %>
				<tr>
					<th>Day<%=i%></th>
					<td></td>
				</tr>
			<% } %>
			</table>
		</div>
		
		<div id="spotInfo" style="width: 500px; float:left; " class="spotInfo">
			<form action="./" method="post">
			<ul style="list-style: none; display: inline-block;">
				<li id="areaInfo">관광지들</li>
			</ul>
			<div>
				<span id="areaPage" style="margin: 1em 25%;"></span>
			</div>
			<input type="submit" value="관광지 선택">
			</form>
		</div>
		
	</section>
	
	<!-- 데이터 출력 창 -->
	
	<!-- footer -->
	<div style="clear:both;"></div>
	<jsp:include page="../inc/bottom.jsp" />
	<!-- footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

	<!-- JavaScript Libraries -->
	<!-- <script src="lib/jquery/jquery.min.js"></script> -->
  	<!-- <script src="lib/jquery/jquery-migrate.min.js"></script> -->
	<script src="lib/popper/popper.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/scrollreveal/scrollreveal.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
