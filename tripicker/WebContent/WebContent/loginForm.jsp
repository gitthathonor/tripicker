<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>로그인</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

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
  <link href="css/login.css" rel="stylesheet">	
  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

</head>

<body >
	 <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="inc/top.jsp"></jsp:include>
  <!-- header -->
  
   <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">로그인</h1>
          </div>
        </div>
        </div>
      </div>
  </section>
  <!--/ Intro Single End /-->
  
  <div class="grid">

    <form action="" method="POST" class="form login">
      <div class="form__field">
        <input id="login__username" type="text" name="id class="form__input" placeholder="아이디" required>
      </div>
      <div class="form__field">
		<input id="login__password" type="password" name="password" class="form__input" placeholder="비밀번호" required>
      </div>

      <div class="form__field">
        <input type="submit" value="로그인">
      </div>

    </form>
    <p class="text--center">계정이 없으신가요? <a href="joinForm.jsp">회원가입</a>      
      </p>

  </div>

 
<!-- footer -->
  	<jsp:include page="inc/bottom.jsp"/>
  <!-- footer -->
</body>
</html>
