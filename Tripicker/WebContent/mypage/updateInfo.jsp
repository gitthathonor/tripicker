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
	
    request.setCharacterEncoding("utf-8");
   
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
            <h1 class="title-single">내정보 수정</h1>
          </div>
        </div>
       </div>
      </div> 
   </section>    
  <!--/ 제목 /-->

  <!-- 정보 수정 -->
		
		<div id="board-list">
		<div class="container">
			<form action="./MyPageUpdateInfoProAction.my" method="post" name="fr" onsubmit="">
			<table class="board-table">
				<tr>
					<th class="th-title">아이디</th>
					<td>${dto.id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><div class="row" style="padding-left: 15px;"><input type="text" name="name" id="input_name" class="form-control col-3" value="${dto.name}" > &nbsp;&nbsp;&nbsp;<span id="name_check_msg"></span></div></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><div class="row" style="padding-left: 15px;"><input type="password" name="pass" id="input_pass" class="form-control col-3" value="" >&nbsp;&nbsp;&nbsp;<font>회원정보 수정을 위해 비밀번호를 입력해주세요</font></div></td>
				</tr>
				<!-- <tr>
					<th>새 비밀번호</th>
					<td><input type="password" name="new_pass" id="input_new_pass" class="form-control col-3" value="" ><font id="new_pass_check_msg"></font></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><div class="row" style="padding-left: 15px;"><input type="password" name="new_same_pass" id="input_new_same_pass" class="form-control col-3" value="" >&nbsp;&nbsp;&nbsp;<font id="new_pass_same_check_msg"></font></div></td>
				</tr> -->
				<tr>
					<th>닉네임</th>
					<td><div class="row" style="padding-left: 15px;"><input type="text" name="nickname" id="input_nickname" class="form-control col-3" value="${dto.nickname}" >&nbsp;&nbsp;&nbsp;<font id="nickname_check_msg"></font></div> </td>
				</tr>
				<tr>
					<th>나이</th>
					<td><div class="row" style="padding-left: 15px;"><select name="age" id="sel_age" class="form-control col-3">
							<option value="noSel">연령대 선택</option>
							<option value="10" <%if (dto.getAge() == 10) {%>
								selected="selected" <%}%>>10대</option>
							<option value="20" <%if (dto.getAge() == 20) {%>
								selected="selected" <%}%>>20대</option>
							<option value="30" <%if (dto.getAge() == 30) {%>
								selected="selected" <%}%>>30대</option>
							<option value="40" <%if (dto.getAge() == 40) {%>
								selected="selected" <%}%>>40대</option>
							<option value="50" <%if (dto.getAge() == 50) {%>
								selected="selected" <%}%>>50대</option>
							<option value="60" <%if (dto.getAge() == 60) {%>
								selected="selected" <%}%>>60대</option>
					</select><font id="age_check_msg"></font></div></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="M"
							<%if (dto.getGender().equals("M")) {%> checked <%}%>>남 <input
							type="radio" name="gender" value="F"
							<%if (dto.getGender().equals("F")) {%> checked <%}%>> 여
						<font id="gender_check_msg"></font>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><div class="row" style="padding-left: 15px;"><input type="email" name="email" class="form-control col-4" id="input_email" value="${dto.email}">&nbsp;&nbsp;&nbsp;<font id="email_check_msg"></font></div></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><b>현재 주소: ${dto.addr}</b>
						<div class="row" style="padding-left: 15px;">

							<input type="text"
								class="form-control form-control-lg form-control-a col-3"
								name="addr" placeholder="주소찾기를 이용해주세요" readonly
								style="font-size: medium;">&nbsp; <input type="button"
								class="btn btn-b-n col-2" onclick="return findAddr();"
								value="주소찾기" style="color: #000000; border-radius: 5px;"><br>
						</div>
						<div>
							<input type="text"
								class="form-control form-control-lg form-control-a col-5"
								name="detailAddr" placeholder="상세주소를 입력해주세요">
						</div></td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${dto.grade }</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td>${dto.reg_date }</td>
				</tr>
				
			</table>
			<br>
				<input type="submit" class="btn btn-b"  value="수정하기" id="update_btn"
					style="float: right; font-size: small;">
				</form>
			<br><br>
		</div>
	</div>
		
		
  <!--/ 정보 수정 /-->
 
 
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
  <!-- 주소찾기 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="./contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="./js/main.js"></script>
 
 <!-- 회원가입 정보 체크 스크립트 -->
 <script type="text/javascript">
  
  //findAddr() 주소값 저장 
  function findAddr(){
	 new daum.Postcode({
	 	oncomplete: function(data){	
	 		var extraAddr = ""; //참고항목 변수
	 		
	 		if(data.userSelectedType === "R"){ //도로명 주소 선택시
	 			document.fr.addr.value = data.roadAddress;
	 		}else{ //지번 주소 선택시
	 			document.fr.addr.value = data.jibunAddress;
	 		}
	 		
 	 		// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === "R"){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== "" && data.apartment === "Y"){
                    extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드(상세주소)에 넣는다.
                document.fr.detailAddr.value = extraAddr;            
            } else {
                document.fr.detailAddr.value = "";
            } 	 		           	 		
	  		document.fr.detailAddr.focus();//상세주소 입력칸으로 이동
	 	}
	 }).open();
	 return false;
  }//findAddr() 
   
  $(document).ready(function(){
	   
   	  var passFlag = false;
   	  var passChFlag = false;
   	  var nameFlag = false;
   	  var nicknameFlag = false;
   	  var ageFlag = false;
   	  //var genderFlag = false;
   	  var emailFlag = false;
	  
   	  // 입력받을 시 이벤트 	  				    
	    
	  $('#input_pass').on("propertychange change keyup paste input", function(){
	  	  checkPass();
	  });	  	  
	  $('#input_same_pass').on("propertychange change keyup paste input", function(){		  
		  checkPassSame();
	  });	  	  
	  $('#input_name').on("propertychange change keyup paste input", function(){
		  checkName();
	  });	  	  
	  $('#sel_age').change(function(){
		  checkAge();
	  });
	  $('#input_nickname').on("propertychange change keyup paste input", function(){
		  checkNickname();
	  });	
	  $('#input_email').on("propertychange change keyup paste input", function(){
		  checkEmail();
	  });	
	  
	  	  
	  //수정하기 버튼(sbumit) 클릭 이벤트
 	  $('#update_btn').click(function(event){
		  if(!passFlag){
			  checkPass();
			  $('#input_pass').focus();
			  return false;
		  }else if(!passChFlag){
			  checkPassSame();
			  $('#input_same_pass').focus();
			  return false;
		  }else if(!nameFlag){
			  checkName();
			  $('#input_name').focus();
			  return false;
		  }else if(!nicknameFlag){
			  checkNickname();
			  $('#input_nickname').focus();
			  return false;
		  }else if(!ageFlag){
			  checkAge();
			  $('#sel_age').focus();
			  return false;
		  }else if(!emailFlag){
			  checkEmail();
			  $('#input_email').focus();
			  return false;
		  }		  
	  });//수정하기 버튼(sbumit) 클릭 이벤트
	  
	  
		  
	    
	  /* //checkPass()
	  function checkPass(){
		  var pass = $('#input_pass').val();	
		  var checkPass = $('#input_same_pass').val();		  
		  if( pass === "" ){
			  $('#pass_check_msg').attr('color','black');
			  $('#pass_check_msg').html("비밀번호를 입력해주세요");
			  $('#pass_check_msg').show();
			  passFlag = false;
		  }		  
		  //비밀번호 수정시, 비밀번호 확인 상태도 변경
		  //checkPassSame();
	  }//checkPass() */
	  	  
	  /* //checkPassSame()
	  function checkPassSame(){
		  var checkPass = $('#input_same_pass').val();
		 if( checkPass === "" || checkPass !== $('#input_pass').val() ){
			  $('#pass_same_check_msg').attr('color','red');
			  $('#pass_same_check_msg').html("같은 비밀번호를 입력해주세요");
			  passChFlag = false;
		  }else if( checkPass === $('#input_pass').val()){
			  //비밀번호 확인이 공백이 아니고 같을때 확인메세지 출력
			  $('#pass_same_check_msg').attr('color','#054D95');
			  $('#pass_same_check_msg').html("비밀번호가 일치합니다!");
			  passChFlag = true;
		  }		  
	  }//checkPassSame() */
	  
	  //checkName()
	  function checkName(){
		  var name = $('#input_name').val();
		  if( name === "" ){
			  //console.log("input_name if문 들어옴");
			  $('#name_check_msg').css('color','red');
			  $('#name_check_msg').html("이름을 입력해주세요");
			  $('#name_check_msg').show();
			  nameFlag = false;
		  }else{
			  $('#name_check_msg').hide();			
			  nameFlag = true;
		  }			  
	  }//checkName()
	  
	  //checkAge()	  
	  function checkAge(){
		  //console.log("checkAge호출");
		  var age = $('#sel_age option:selected').val();
		  if(age === "noSel"){
			  $('#age_check_msg').css('color','red');
			  $('#age_check_msg').html("연령을 선택해주세요");
			  ageFlag = false
		  }else{
			  $('#age_check_msg').html("");
			  ageFlag = true;
		  }
	  }//checkAge()
	  	  
	  //checkNickname()
	  function checkNickname(){
		  var nickname = $('#input_nickname').val();
		  $.ajax({
			  url:'./UserNicknameCheckAction.us',
			  type:'post',
			  data: {nickname : nickname},
			  dateType: 'json',
			  success:function(result){			 
				 console.log(result); 
				if( !(2 <= nickname.length && nickname.length <= 8) ){
					//console.log("nickname if문 들어옴");
					$('#nickname_check_msg').attr('color','red');
					$('#nickname_check_msg').html("닉네임은 2~8자리로 입력해주세요");
					nicknameFlag = false;
				}else if(result === "ok"){ //닉네임 중복안됨
					$('#nickname_check_msg').attr('color','#054D95');
					$('#nickname_check_msg').html("사용가능한 닉네임 입니다!");
					$('#input_nickname').removeAttr('required');
					nicknameFlag = true;
				 }else{ //닉네임 중복됨
					$('#nickname_check_msg').attr('color','red');
					$('#nickname_check_msg').html("이미 사용중인 닉네임 입니다");
					nicknameFlag = false;			  
				  }
			  },//success
			  error:function(){
				  alert("에러");
			  }
		  });
	  }//checkNickname() 
	  
	  //checkEmail()
	  function checkEmail(){
		  var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
		  var email = $('#input_email').val();
		  $.ajax({
			  url:'./UserEmailCheckAction.us',
			  type:'post',
			  data: {email : email},
			  dateType: 'json',
			  success:function(result){			 
				 console.log(result);
				if(email === ""){
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("이메일 주소를 입력해주세요");
					emailFlag = false;
				}else if( !(reg.test(email)) ){
					//console.log("email if문 들어옴");
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("올바른 이메일 주소를 입력해주세요");
					emailFlag = false;
				}else if(result === "ok"){ //이메일 중복안됨
					$('#email_check_msg').attr('color','#054D95');
					$('#email_check_msg').html("사용가능한 이메일 입니다!");
					$('#email_check_msg').removeAttr('required');
					emailFlag = true;
				 }else{ //이메일 중복됨
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("이미 사용중인 이메일 입니다");
					emailFlag = false;			  
				  } 
				
			  },//success
			  error:function(){
				  alert("에러");
			  }
		  });
	  }//checkEmail() 
	  
  });
 
  
</script>
</body>
</html>
