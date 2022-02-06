<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>회원가입</title>
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
  <link href="css/join.css" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
<style type="text/css">
.section-footer {
	margin-top: 950px;
}
</style>
</head>

<body>

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
            <h1 class="title-single">회원가입</h1>
          </div>
        </div>
        </div>
      </div>
  </section>
  <!--/ Intro Single End /-->

<!-- 회원가입 -->
  
	<form action="joinPro.jsp"  method="post" name="fr" onsubmit="return sendIt();">

            <div id="content">
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="id" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="idError"></span>
                </div>  
                <div>
                    <h3 class="join_title"><label for="pass">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pass" name="pass" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="img/icon_check_.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box" id="pass1Error"></span>
                </div>
                <div>
                    <h3 class="join_title"><label for="pass2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pass2" name="pass2" class="int" maxlength="20">
                        <img src="img/icon_check_.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box" id="pass2Error"></span>
                </div>      
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="nameError"></span>
                </div>  
                <div>
                    <h3 class="join_title"><label for="nickname">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="nickname" name="nickname" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="nameError"></span>
                </div>   
                <div>
                    <h3 class="join_title"><label for="age">나이</label></h3>
                    <span class="box int_age">
                        <input type="text" id="age" name="age" class="int" maxlength="2">
                    </span>
                    <span class="error_next_box" id="ageError"></span>
                </div>
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" name ="gender" class="sel">
                            <option>성별</option>
                            <option value="남"> 남자</option>
                            <option value="여"> 여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box" id="genderError">필수 정보입니다.</span>
                </div>
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="email" id="email" name="email" class="int" maxlength="100" placeholder="선택입력"></input>
                    </span>
                    <span class="error_next_box" id="emailError">이메일 주소를 다시 확인해주세요.</span>    
                </div>
                <div class="btn_area">
                    <input type="submit" value="가입하기" id="btnJoin" class="nav-link">
                </div>
            </div> 
        </div>                                                                                    
	</form> 
</div>

<!-- 회원가입 끝 -->	
 

  <!-- footer -->
  	<jsp:include page="inc/bottom.jsp"/>
  <!-- footer -->

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
