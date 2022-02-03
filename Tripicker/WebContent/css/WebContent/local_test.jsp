<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script
	src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
	$.ajax({    // 요청방식
		  method: "GET",     // 요청방식 확인 -> 관광 api는 get 방식
		  url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode",     // 전송주소 
		  data: { numOfRows:10,
			  		MobileOS:"ETC",
			  		MobileApp:"AppTest",
			  		ServiceKey:"LQe%2FX9wDTk7q3%2B4VjCaRfKxxL4BD1E2e1m92MDYlfI3yx4159V0T0A%2FW1ttBotwwA1NMkCYnaRh7FKn95Kbbwg%3D%3D"
		  }     // 전송에 포함될 데이터 정보
		})
		  .done(function( msg ) {     // 응답으로 처리 코드
		    alert( "Data Saved: " + msg );
		  });
	</script>
</body>
</html>