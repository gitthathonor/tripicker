<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API 검색 후 호출 방식 테스트</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("select[name=areacode] > option").each(function(){
		if( $(this).val() == ""){
			$(this).attr("selected","selected");
		}	    			
	});

	$("select[name=contentType] > option").each(function(){
		if( $(this).val() == ""){
			$(this).attr("selected","selected");
		}	    			
	});
}); // 관광타입과 지역코드 초기화
		
		
		//API 서비스 키
		var servicekey = "YF2x%2FO1BlpMsxJQE9EcsZinR9%2FtVU8Ho4qbE9OTsA3eU19TPByqfFMTzVq4oP8WQLesJOA4G13m7qRYpx9KqXQ%3D%3D";
		
		// 타입 변경에 따른 대분류
	function getCat1List(contentType) {
			var contentType = $("select[name=contentType]").val();
			
			$(document).ready(function(){
				$.ajax({
					url : " http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&MobileOS=ETC&MobileApp=AppTesting",
					data : {"contentType":contentType},		
					success : function(data) {
						
						$("select[name=cat1]").empty();
						$("select[name=cat1]").append("<option value=''>대분류</option>");
						$(data).find("item").each(function(){
							var cat1Code = $(this).find("code").text();
							var cat1Name = $(this).find("name").text();
							
							if(cat1Name == "추천코스") {
								return;
							}
							
							$("select[name=cat1]").append("<option value="+cat1Code+">"+cat1Name+"</option>");
							
						}); 
					} //success : function
				}); //ajax
			});
		} // getCat1List
		
		
		// 대분류 변경에 따른 중분류
		function getCat2List(cat1) {
			var contentType = $("select[name=contentType]").val();
		var cat1 = $("select[name=cat1]").val();
		
		
		if(cat1 == "") {
			$("select[name=cat2]").empty();
			$("select[name=cat2]").append("<option value=''>중분류</option>");
			
			$("select[name=cat3]").empty();
			$("select[name=cat3]").append("<option value=''>소분류</option>");
		}
		
		//alert(cat1);
		
			$(document).ready(function(){
				$.ajax({
					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&cat1="+cat1+"&MobileOS=ETC&MobileApp=AppTesting",		
					success : function(data) {
						//console.log(data);
						//alert(data)
						if(cat1 == "") {
	  								return;
	  						} 
						
						$("select[name=cat2]").empty();
						$("select[name=cat2]").append("<option value=''>중분류</option>");
						
						$(data).find("item").each(function(){
							var cat2Code = $(this).find("code").text();
  							var cat2Name = $(this).find("name").text();
							
							$("select[name=cat2]").append("<option value="+cat2Code+">"+cat2Name+"</option>");
						});
						
						var cat2 = $("select[name=cat2]").val();
						
						if(cat2 == "") {
							$("select[name=cat3]").empty();
							$("select[name=cat3]").append("<option value=''>소분류</option>");
						} 
					} //success : function
					
				}); //ajax
				
			});
		} //getCat2List()
		
		
		// 대분류, 중분류의 변경에 따른 소분류 지정
		function getCat3List(cat2) {
			var contentType = $("select[name=contentType]").val();
			var cat1 = $("select[name=cat1]").val();
			var cat2 = $("select[name=cat2]").val();
			
			$(document).ready(function(){
				$.ajax({
					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&contentTypeId="+contentType+"&cat1="+cat1+"&cat2="+cat2+"&MobileOS=ETC&MobileApp=AppTesting",		
					success : function(data) {
							$("select[name=cat3]").empty();
							$("select[name=cat3]").append("<option value=''>소분류</option>");
						var totalcount = $(data).find("totalCount").text();
						totalcount *= 1;
						
						$.ajax({
							url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+servicekey+"&numOfRows="+totalcount+"&contentTypeId="+contentType+"&cat1="+cat1+"&cat2="+cat2+"&MobileOS=ETC&MobileApp=AppTesting",
							success : function(data) {
								
								//console.log(data);
								if(cat2 == "") {
  	  								return;
  	  							} 
								$("select[name=cat3]").empty();
	  							$("select[name=cat3]").append("<option value=''>소분류</option>");
	  							
	  							$(data).find("item").each(function(){
	  								var cat3Code = $(this).find("code").text();
	  								var cat3Name = $(this).find("name").text();
	  								
	  								$("select[name=cat3]").append("<option value="+cat3Code+">"+cat3Name+"</option>");
	  							});
								
							}
							
							}); //두번째 ajax 
						}
						
						
					}); //첫번째 ajax
					
				});
			
		} //getCat3List(cat2)
		
		
		
		// 지역이 바뀔 때, 시군구 코드도 해당 지역에 맞게 들고오도록 만드는 메서드 
		function getSigunguList(areacode) {
			var areacode = $('select[name=areacode]').val();
			
			//alert(areacode);
			
			$(document).ready(function(){
				$.ajax({
	  				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey="+servicekey+"&MobileOS=ETC&MobileApp=AppTest&areaCode="+areacode,
	  				data : {"areacode":areacode},
	  				success : function(data) {
	  					$("select[name=sigungucode]").empty();
					$("select[name=sigungucode]").append("<option value=''>시군구 선택</option>")
	  					var totalcount = $(data).find('totalCount').text();
	  					totalcount *= 1;
	  					//alert(typeof totalcount);
	  					
	  					$.ajax({
	  						url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey="+servicekey+"&numOfRows="+totalcount+"&MobileOS=ETC&MobileApp=AppTest&areaCode="+areacode,
	  						data : {"areacode":areacode},
	  						success : function(data) {
	  							if(areacode == "") {
	  								return;
	  							} 
	  							
	  							$(data).find('item').each(function(){
	  								
	  								var sigunguname = $(this).find('name').text();
	  								var sigungucode = $(this).find('code').text();
	  								
	  								$("select[name=sigungucode]").append("<option value="+sigungucode+">"+sigunguname+"</option>");
	  							
	  							});
	  						} 
	  					}); //두번째 ajax
	  				}
	  				
	  			}); // 첫번째 ajax
			}); 
		} // getSigunguList
		
		
		// 검색 클릭 시 API로 정보들 출력되도록 하기(페이징 처리도 같이 되면 좋다 - 한 페이지에 10개씩 등장!) 
		
		function searchSpot(contentType,cat1,cat2,cat3,areacode,sigungucode) {
			$(document).ready(function(){
				contentType = $("select[name=contentType]").val();
				cat1 = $("select[name=cat1]").val();
				cat2 = $("select[name=cat2]").val();
				cat3 = $("select[name=cat3]").val();
				areacode = $("select[name=areacode]").val();
				sigungucode = $("select[name=sigungucode]").val();
				
				$.ajax({
					url:"/PlanSpotInsertAction2.pl",
					data:{contentType:contentType,cat1:cat1,cat2:cat2,cat3:cat3,areacode:areacode,sigungucode:sigungucode},
					method:"GET",
					success:function(data) {
						
					}
					
				});
			});
		}
			
			
		
		
		
		
</script>
</head>
<body>


	<div id="selectArea">
		<fieldset>
			<form id="searchSpotForm" method="post" action="./PlanSpotInsertAction2.pl">
			<table>
				<tr>
					<td>
						<select name="contentType" onchange="getCat1List(this);">
							<option value="" selected="selected">관광타입</option>
							<option value="12">관광지</option>
							<option value="14">문화시설</option>
							<option value="15">축제공연행사</option>
							<option value="28">레포츠</option>
							<option value="32">숙박</option>
							<option value="38">쇼핑</option>
							<option value="39">음식점</option>
						</select> 
					</td>
				</tr>
					<tr>
						<td>
							<div>
								<span>
									<select name="cat1" title="대분류" style="width:150px;" onchange="getCat2List(this)">
										<option value="">대분류</option>
										<option value="A01">자연</option>
										<option value="A02">인문(문화/예술/역사)</option>
										<option value="A03">레포츠</option>
										<option value="B02">숙박</option>
										<option value="A04">쇼핑</option>
										<option value="A05">음식</option>
									</select>
									<select name="cat2" title="중분류" style="width:120px;" onchange="getCat3List(this)">
										<option value="">중분류</option>
									</select>
									<select name="cat3" title="소분류" style="width:120px;">
										<option value="">소분류</option>
									</select>
								</span>
							</div>
						</td>
				</tr>
				<tr>
					<td>
						<select name="areacode" title="지역선택" onchange="getSigunguList(this.value);">
							<option value="" selected="selected">지역선택</option>
							<option value="1">서울</option>
							<option value="2">인천</option>
							<option value="3">대전</option>
							<option value="4">대구</option>
							<option value="5">광주</option>
							<option value="6">부산</option>
							<option value="7">울산</option>
							<option value="8">세종특별자치시</option>
							<option value="31">경기도</option>
							<option value="32">강원도</option>
							<option value="33">충청북도</option>
							<option value="34">충청남도</option>
							<option value="35">경상북도</option>
							<option value="36">경상남도</option>
							<option value="37">전라북도</option>
							<option value="38">전라남도</option>
							<option value="39">제주도</option>	
						</select>
					</td>
					<td>
						<select name="sigungucode" title="시군구선택">
							<option value="" selected="selected">시군구 선택</option>
						</select>
					</td>
				</tr>
			</table>
				<table class="bbsSearch">
							<colgroup>
								<col style="width:95px;">
								<col style="width:861px;">
							</colgroup>
							<tbody>				
								<tr>
									<th class="last wHacki8" scope="row">
									<input type="button" id="searchSpotBtn" value="검색" onclick="searchSpot()">
									</th>
									<td class="last">
									    <input type="hidden" name="mode" value="listOk">
									</td>
								</tr>
							</tbody>
						</table>			
			</form>
		</fieldset>
		</div>
</body>
</html>