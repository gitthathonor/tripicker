<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function checkJoin(){
	  var id = document.fr.id.value;
	  var pass = document.fr.pass.value;
	  var nickname = document.fr.nickname.value;
	  
	  //alert(id+pass);
	  // 아이디 자리수 체크
	  if( !(4 <= id.length && id.length <= 10) ) {
		  alert("아이디는 4~10자리로 입력해주세요");
		  document.fr.id.focus();
		  return false;
	  }
	  
	  // 비밀번호 자리수 체크
	  if( !(8 <= pass.length && pass.length <= 16) ){
		  alert("비밀번호는 6~18자리로 입력해주세요");
		  document.fr.pass.focus();
		  return false;
	  }
	  
	  // 비밀번호 확인  체크
	  if(!(document.fr.checkPass.value === pass)) {
		  alert("비밀번호를 일치하게 입력해주세요");
		  document.fr.checkPass.focus();
		  return false;
	  }
	  
	  // 닉네임 자리수 체크
	  if(!(2 <= nickname.length && nickname.length <= 8)){
		  alert("닉네임은 2~8자리로 입력해주세요");
		  document.fr.nickname.focus();
		  return false;		  
	  }
	  
	  // 나이 선택유무 체크
	  if(document.fr.age.value == "noSel"){
		  alert("연령대를 선택해주세요")
		  document.fr.age.focus();
		  return false;
	  }
	  
	  // 성별 선택유무 체크
	  if(document.fr.gender.value == ""){
		  alert("성별을 선택해주세요")
		  document.fr.gender[0].focus();
		  return false;
	  }
	  
	  // 이메일 형식 체크
	  //alert(document.fr.email.value);
	  //이메일 정규식(계정@도메인.최상위 도메인) , 아이디맨앞 특수문자x(. - _ 가능)
	  var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/ 
	  if(!reg.test(document.fr.email.value)){
		  alert("유효한 이메일 형식이 아닙니다");
		  document.fr.email.focus();
		  return false;
	  }
	  
	  
	  
	  
  }

</script>
</head>
<body>
	<!-- 회원가입 페이지 -->
	<fieldset>
		<form action="/MemberJoinAction.tripicker" method="post" name="fr" onsubmit="return checkJoin();">
			* ID : <input type="text" name="id"><br>
			* PW : <input type="password" name="pass"><br>
			* PW확인 : <input type="password" name="checkPass"><br>
			* 닉네임 : <input type="text" name="nickname"><br>
			* 나이 : <select name="age">
					   <option value="noSel">연령대 선택</option>
					   <option value="10">10대</option>
					   <option value="10">20대</option>
					   <option value="10">30대</option>
					   <option value="10">40대</option>
					   <option value="10">50대</option>
					   <option value="10">60대</option>
					 </select><br>
			* 성별 : <input type="radio" name="gender">남
				     <input type="radio" name="gender">여<br>
			* 이메일 : <input type="text" name="email"><br>
			주소 : <input type="text" name="addr"><br>
			
			<button><span>취소</span></button>
			<button type="submit"><span>가입</span></button>
		</form>
	</fieldset>
</body>
</html>