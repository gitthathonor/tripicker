<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  <!--/ 제목 /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"> 도 / 시선택 </h1>
          </div>
        </div>
        
      </div>
    </div>
  </section>
  <!--/ 제목 끝 /-->

  <!--/ 지역 선택 /-->
  <section class="news-grid grid">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="card-box-b card-shadow news-box">
            <div class="img-box-b">
              <img src="../img/post-1.jpg" alt="" class="img-b img-fluid">
            </div>
            <div class="card-overlay" style="padding: 50px;">
              <div class="card-header-b" style="padding-bottom: 90px; padding-left: 50px;">
                 <div class="card-title-b">
                  <h2 class="title-2">
                    <b><a href="./CityInfo.ci"> 서울 </a></b>
                  </h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
  </section>
  <!--/ 지역 선택 끝 /-->

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