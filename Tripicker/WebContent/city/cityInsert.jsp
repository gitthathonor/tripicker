<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시들 DB에 저장하기</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
		
		$.ajax({
			url : './CityInsertAction.ci',
			success : function(data) {
				$('body').append
			}
		})
		
	}); */
</script>
</head>
<body>
	<input type="button" value="정보 보고싶음" onclick="location.href='./CityInsertAction.ci'">
	
	도시 정보(1) <br>
	도시 코드 : ${cdto.cityCode } <br>
	도시 이름 : ${cdto.cityName } <br>
	도시 영문명 : ${cdto.cityEngName} <br>
	도시  설명 : ${cdto.cityInfo } <br>
	도시 이미지 : <img src="${cdto.cityImgUrl}"> 
	
</body>
</html>