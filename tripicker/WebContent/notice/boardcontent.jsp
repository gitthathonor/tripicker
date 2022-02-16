<%@page import="com.tripicker.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//전달받은 정보를 저장
BoardDTO bdto = (BoardDTO) request.getAttribute("bdto"); //object -다운캐스팅-> BoardDTO
String pageNum = (String) request.getAttribute("pageNum"); //object -다운캐스팅-> String
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지작성</title>
  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
</head>
<body>

 <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->
  
<!-- 공지사항 작성 -->
<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">공지사항 작성</h1>
          </div>
        </div>
          
	 <section class="container">
        <div class="col-sm-12 section-t8">
          <div class="row">
            <div class="col-md-7">
              <form class="form-a contactForm">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-lg form-control-a" name="nNum"  value="<%=bdto.getnNum()%>">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                 	 <input type="text" class="form-control form-control-lg form-control-a"  name="nReadCount" value="<%=bdto.getnReadCount()%>">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-lg form-control-a"  >
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                 	 <input type="text" class="form-control form-control-lg form-control-a" name="nReg_date" value="<%=bdto.getnReg_date()%>" >
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <input class="form-control form-control-lg form-control-a" name="nTitle" value="<%=bdto.getnTitle()%>" >
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <textarea class="form-control" name="nContent" cols="45" rows="8" ><%=bdto.getnContent()%></textarea>
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12">
                   	<button type="button" class="btn btn-a" onclick="location.href='./BoardList.bo?pageNum=<%=pageNum%>'">목록</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-a" onclick="location.href='./BoardUpdate.bo?nNum=<%=bdto.getnNum()%>&pageNum=<%=pageNum%>'">수정</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-a" onclick="location.href='./BoardDelete.bo?nNum=<%=bdto.getnNum()%>&pageNum=<%=pageNum%>'">삭제</button>&nbsp;&nbsp;
                  </div>
                </div>
              </form>
            </div>         
  </section>
  

  
  
	<!-- 공지사항 작성 끝 -->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
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