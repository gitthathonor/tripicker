<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* $('select').click(function(){
			$("select[name=areacode]").val();
		}); */
		
	/* function f1() {
			alert('hello');
	} */
	});
	function f1() {
		$(document).ready(function(){
			alert($("select[name=areacode]").val());
			alert($("select[name=cat1]").val());
		});
	}

</script>
</head>
<body>
	<select name="areacode" onchange="f1();">
		<option value="1">서울</option>
		<option value="2">부산</option>
		<option value="3">대구</option>
	</select>
	<select name="cat1" onchange="f1();">
		<option value="A01">자연</option>
		<option value="A02">인문</option>
		<option value="A03">축제</option>
	</select>
	
	
</body>
</html>