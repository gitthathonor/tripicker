<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>EstateAgency Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../img/favicon.png" rel="icon">
  <link href="../img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="../lib/animate/animate.min.css" rel="stylesheet">
  <link href="../lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../css/style.css" rel="stylesheet">

</head>

<body>

  <div class="click-closed"></div>
  
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->
  
  <!--/ 타이틀 /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"> 관광지명 </h1>
           </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ 타이틀 끝 /-->

	<!--/ 본문 /-->
	<section class="property-single nav-arrow-b">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">


				<!-- 탭 내비게이션바  -->
				<div class="card card-primary card-tabs">
					<div class="card-header p-0 pt-1">
						<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="custom-tabs-one-home-tab" data-toggle="pill"
								href="#custom-tabs-one-home" role="tab"
								aria-controls="custom-tabs-one-home" aria-selected="false">정보</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								id="custom-tabs-one-profile-tab" data-toggle="pill"
								href="#custom-tabs-one-profile" role="tab"
								aria-controls="custom-tabs-one-profile" aria-selected="false">추천코스</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								id="custom-tabs-one-messages-tab" data-toggle="pill"
								href="#custom-tabs-one-messages" role="tab"
								aria-controls="custom-tabs-one-messages" aria-selected="false">유명명소</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								id="custom-tabs-one-settings-tab" data-toggle="pill"
								href="#custom-tabs-one-settings" role="tab"
								aria-controls="custom-tabs-one-settings" aria-selected="true">축제나 지도등</a>
							</li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content" id="custom-tabs-one-tabContent">
							<!-- 정보 탭 -->
							<div class="tab-pane fade active show" id="custom-tabs-one-home"
								role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

								<div class="row">
									<div class="col-md-7">
										<div class="agent-avatar-box">
											<img src="../img/testimonial-1.jpg" alt=""
												class="agent-avatar img-fluid" >
										</div>
									</div>
									<div class="col-md-5 section-md-t3">
										<div class="agent-info-box">
											<div class="agent-title">
												<div class="title-box-d">
													<h3>
														날<br>
														씨<br>
														자<br>
														리<br>
														
													</h3>
												</div>
											</div>
											<div class="agent-content mb-3">
												<p class="content-d color-text-a">
													<b>지역정보 설명</b><br>
													빼어난 자연경관으로 유명한 강원도. 래프팅, 패러글라이딩, 라이딩, 스키 등 계절마다 자연을 누리며 각종 레저스포츠를 즐길 수 있다. 그뿐만 아니라, 연말연시가 되면 가장 먼저 떠오르는 정동진은 해돋이 명소로 손꼽히며, 배를 타고 들어가야 하는 남이섬 곳곳에는 운치 있는 메타세콰이어길이 있어 데이트 코스로도 유명하다. 호수를 둘러싼 자전거 길을 따라 느긋하게 춘천을 둘러보는 여행도 추천한다.
												
												</p>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 정보 탭 끝 -->
							<div class="tab-pane fade" id="custom-tabs-one-profile"
								role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
								추천코스 자리</div>
							<div class="tab-pane fade" id="custom-tabs-one-messages"
								role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
								유명명소 자리</div>
							<div class="tab-pane fade"
								id="custom-tabs-one-settings" role="tabpanel"
								aria-labelledby="custom-tabs-one-settings-tab">
								?????
							</div>
						</div>
					</div>

				</div>
				<!-- 탭 내비게이션바  -->

			</div>
		</div>
	</div>
	</section>
	<!--/ 본문 /-->

	<!-- footer -->
  	<jsp:include page="../inc/bottom.jsp"/>
  <!-- footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="../lib/jquery/jquery.min.js"></script>
  <script src="../lib/jquery/jquery-migrate.min.js"></script>
  <script src="../lib/popper/popper.min.js"></script>
  <script src="../lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="../lib/easing/easing.min.js"></script>
  <script src="../lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="../contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../js/main.js"></script>

</body>
</html>
