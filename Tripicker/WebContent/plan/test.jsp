<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="contentWrap">
	   <section>
			



		<section id="conHead" class="openAPI">
			<div>
				<h1><img src="/static/images/title/titArea.png" alt="지역별 관광정보"></h1>
				<p id="location">
					<span class="first"><img src="/static/images/common/bg/bgHome.png" alt="홈"></span>
					<span>OpenAPI</span>
				<span>OpenAPI 가이드</span>
				<span class="current">지역별 관광정보</span>
				</p>
			</div>
		</section>
		 
		
		
		<section id="content">
			







<script type="text/javascript"> 
	
	var chkFlag = false;
	// 관광타입 선택 flag
	var chkTyFlag = false;

	$(document).ready(function(){
	
		if( "KOR" != null){
	
			$("input[name=rlangtype][value='KOR']").prop("checked",true);
			getContentTypeList("N");
		}else{
			getContentTypeList("N");		
			$("input[name=rlangtype][value='KOR']").prop("checked",true);
		}	
		$("input[name=rlangtype]").change(function(){
			$("input[name=langtype]").val($("input[name=rlangtype]:checked").val());
			getContentTypeList("N");
		});
		
		
		$("#search").click(function(){
			$("#searchForm").append("<input type='hidden' name='langtype' value='"+$("input[name=rlangtype]:checked").val()+"'/>");
			$("#searchForm input[name=arrange]").val($("#searchForm input[name=arrange]:selected").val());
			$("#searchForm input[name=pageNo]").val("1");				
			$("#searchForm").attr("action", "/guide/inforArea.do" );
			$("#searchForm").submit();
		});
		$("#arrview").click(function(){
			$("#searchForm").append("<input type='hidden' name='langtype' value='"+$("input[name=rlangtype]:checked").val()+"'/>");
			$("#searchForm input[name=arrange]").val($("#searchForm input[name=arrange]:selected").val());
			$("#searchForm input[name=pageNo]").val("1");				
			$("#searchForm").attr("action", "/guide/inforArea.do" );
			$("#searchForm").submit();
		});

	});	
	

	
	
function getContentTypeList(initFlag){	

	var formdata;			
	
	if(initFlag == "Y"){
		formdata = {"langtype":"KOR"};
	}else{
		
		formdata = $("#searchForm").serializeArray();			
			
		if ($("input[name=rlangtype]:checked").val() != undefined) {
			formdata.push(
				{						
					name : "langtype",
					value : $("input[name=rlangtype]:checked").val()
				}					
			);

		}else{
			formdata.push(
				{						
					name : "langtype",
					value : "KOR"
				}					
			);
		}
	
	}

$.ajax({
	url : "/guide/areaCommonAjax.do",
    type: "post",
    dataType: "html",
    data : formdata,
    success:function(data){	 
    	
    	$("#selectArea").html(data);

    		// 관광타입  selected		        		
    		$("select[name=contenttypeid] > option").each(function(){
    			if( $(this).val() == "12"){
    				
    				$(this).attr("selected","selected");
    			}	    			
    		});
    		
        		   		       
        	
        	$("select[name=cat1]:eq(0)").show();
			$("select[name=cat2]:eq(0)").show();
			$("select[name=cat3]:eq(0)").show();			        	
			
    			$("select[name=cat1]:eq(0) > option").each(function(){	    							    				
    			
    				if( $(this).val() == "A02"){

    					$(this).attr("selected","selected");	    		
    					getCat2List(	$(this).parent(), "N" ,"A0201", "");
    				}
    			});    			
    						    		
    		 
    		
    					        	
        	// 지역 selected	        	
    		$("select[name=areacode] > option").each(function(){
    			if( $(this).val() == "6"){
    				$(this).attr("selected","selected");
    				getSigunguList( $(this).val() , 'N');
    			}	    			
    		});

    } ,
	 error:function(request,status,error){
		   alert("areacommonAjax:request:"+request+"status:"+status+"error:"+error);
	  }
    });	


  }
// 지역 
function getSigunguList(areacode , initFlag){    
	
	var langtype = $("input[name=rlangtype]:checked").val();			
    var params = {"areacode":areacode,"langtype":langtype};
    	    
    $.ajax({
    	url : "/search/signguCodeAjax.do",
        type: "post",
        dataType: "json",
        data : params,
        success:function(data){
        	
        	$("select[name=sigungucode]").empty();	        	
        	$("select[name=sigungucode]").append("<option value=''>시군구 선택</option>");
        	
        	for(var  i = 0;  i < data.list.length; i ++){	        		
        		$("select[name=sigungucode]").append("<option value="+data.list[i].signguCode+">"+ data.list[i].signguNm +"</option>");
        	}
        	
        	if( initFlag == "N") {
        		// 시군구 selected	        	
	    		$("select[name=sigungucode] > option").each(function(){
	    			if( $(this).val() == ""){
	    				$(this).attr("selected","selected");
	    			}	    			
	    		});
        	}
        	
        },
		error:function(args){
			//alert('error' + args);
		}
    });
}


</script>
<form id="searchForm" method="post" action="/guide/inforArea.do">
				<fieldset>
					<legend>지역별 관광정보 검색</legend>					
				
					<div class="tableWrap searchWrap mgNone">
				 	<table class="bbsSearch">
							<caption>검색 순서 1 – 관광데이터 검색을 위한 언어선택</caption>
							<colgroup>
								<col style="width:95px;">
								<col style="width:861px;">
							</colgroup>
							<tbody>
								<tr>
									<th class="wHacki8" scope="row">언어선택</th>
									<td>
										
											<input type="radio" name="rlangtype" title="한국어" value="KOR" id="rlangType_KOR"><label for="rlangType_KOR">한국어</label>
									
											<input type="radio" name="rlangtype" title="영어" value="ENG" id="rlangType_ENG"><label for="rlangType_ENG">영어</label>
									
											<input type="radio" name="rlangtype" title="일어" value="JPN" id="rlangType_JPN"><label for="rlangType_JPN">일어</label>
									
											<input type="radio" name="rlangtype" title="중국어(간체)" value="CHS" id="rlangType_CHS"><label for="rlangType_CHS">중국어(간체)</label>
									
											<input type="radio" name="rlangtype" title="중국어(번체)" value="CHT" id="rlangType_CHT"><label for="rlangType_CHT">중국어(번체)</label>
									
											<input type="radio" name="rlangtype" title="독일어" value="GER" id="rlangType_GER"><label for="rlangType_GER">독일어</label>
									
											<input type="radio" name="rlangtype" title="프랑스어" value="FRE" id="rlangType_FRE"><label for="rlangType_FRE">프랑스어</label>
									
											<input type="radio" name="rlangtype" title="스페인어" value="SPN" id="rlangType_SPN"><label for="rlangType_SPN">스페인어</label>
									
											<input type="radio" name="rlangtype" title="러시아어" value="RUS" id="rlangType_RUS"><label for="rlangType_RUS">러시아어</label>
																			
									</td>
								</tr>
							</tbody>
						</table>	
						<div id="selectArea">





<script src="/static/js/lib/jquery-migrate-1.1.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		
		$("select[name=areacode] > option").each(function(){
			if( $(this).val() == ""){
				$(this).attr("selected","selected");
			}	    			
		});

		$("select[name=contenttypeid] > option").each(function(){
			if( $(this).val() == ""){
				$(this).attr("selected","selected");
			}	    			
		});
		
		
	});
	//타입 변경-대분류
	function typeChange(contenttypeid,cat1Value){
		var index =$("select[name=contenttypeid]").index(contenttypeid);
		var typeid = $(contenttypeid).val();	
		var langtype = $("input[name=rlangtype]:checked").val();			
	    var params = {"contenttypeid":typeid ,"langtype":langtype};

	    $.ajax({
	    	url : "/guide/typeServiceCodeAjax.do",
	        type: "post",
	        dataType: "json",
	        data : params,
	        success:function(data){
	        	
	        	$("select[name=cat1]:eq("+index+")").empty();	        	
	        	$("select[name=cat1]:eq("+index+")").append("<option value=''>대분류</option>");
	        	
	        	for(var  i = 0;  i < data.list.length; i ++){	        		
	        		if(cat1Value == data.list[i].cat1){
	        			$("select[name=cat1]:eq("+index+")").append("<option value='"+data.list[i].cat1+"' selected>"+ data.list[i].catname1 +"</option>");
	        		}else{
	        			$("select[name=cat1]:eq("+index+")").append("<option value='"+data.list[i].cat1+"'>"+ data.list[i].catname1 +"</option>");
	        		}
	        	}
	    
	        },
			error:function(args){
				alert("dateserviceCodeAjax:error:"+request+"status:"+status+"error:"+error);
			}
	    });
	}
	// 서비스 분류 중분류
	function getCat2List(cat1 , initFlag, cat2Value, cat3Value){
		var index = $("select[name=cat1]").index(cat1);		
		var langtype = $("input[name=rlangtype]:checked").val();			
	    var params = {"cat1":$(cat1).val() ,"langtype":langtype};	    
	    
	    if( $(cat1).val() == ""){
	    	$("select[name=cat2]:eq("+index+")").empty();	        	
        	$("select[name=cat2]:eq("+index+")").append("<option value=''>중분류</option>");
        	
        	$("select[name=cat3]:eq("+index+")").empty();
        	$("select[name=cat3]:eq("+index+")").append("<option value=''>소분류</option>");
	    	return;
	    }
	    
	    $.ajax({
	    	url : "/guide/serviceCodeAjax.do",
	        type: "post",
	        dataType: "json",
	        data : params,
	        success:function(data){	        	
	        	
	        	$("select[name=cat2]:eq("+index+")").empty();	        	
	        	$("select[name=cat2]:eq("+index+")").append("<option value=''>중분류</option>");
	        	
	        	$("select[name=cat3]:eq("+index+")").empty();
	        	$("select[name=cat3]:eq("+index+")").append("<option value=''>소분류</option>");
	        	
	        	
	        	for(var  i = 0;  i < data.list.length; i ++){	        		
	        		if(cat2Value == data.list[i].cat2){
	        			$("select[name=cat2]:eq("+index+")").append("<option value='"+data.list[i].cat2+"' selected>"+ data.list[i].catname2 +"</option>");
	        		}else{
	        			$("select[name=cat2]:eq("+index+")").append("<option value='"+data.list[i].cat2+"'>"+ data.list[i].catname2 +"</option>");
	        		}
	        	}
	        		    
	        	if( initFlag == "N") {	        		
	        		
	        			
				    					    	
				    		getCat3List(	$("select[name=cat2]:eq("+index+")") , initFlag, cat3Value);
				    	
		    		
	        	}else{
	        		getCat3List(	$("select[name=cat2]:eq("+index+")") , initFlag, cat3Value);
	        	}
	        },
			error:function(args){
				   alert("serviceCodeAjax:error:"+request+"status:"+status+"error:"+error);
			}
	    });
	}
	
	// 서비스 분류 소분류
	function getCat3List(cat2, initFlag, selectedValue){
		
		var index = $("select[name=cat2]").index(cat2);
		var langtype = $("input[name=rlangtype]:checked").val();			
	    var params = {"cat2":$(cat2).val() ,"langtype":langtype};	    		
	    
	    if( $(cat2).val() == ""){        	
        	$("select[name=cat3]:eq("+index+")").empty();
        	$("select[name=cat3]:eq("+index+")").append("<option value=''>소분류</option>");
	    	return;
	    }
	    
	    $.ajax({
	    	url : "/guide/serviceCodeAjax.do",
	        type: "post",
	        dataType: "json",
	        data : params,
	        success:function(data){
	        	
	        	$("select[name=cat3]:eq("+index+")").empty();	        	
	        	$("select[name=cat3]:eq("+index+")").append("<option value=''>소분류</option>");
	        	
	        	for(var  i = 0;  i < data.list.length; i ++){	        		
	        		if(selectedValue == data.list[i].cat3){
	        			$("select[name=cat3]:eq("+index+")").append("<option value='"+data.list[i].cat3+"' selected>"+ data.list[i].catname3 +"</option>");
	        		}else{
	        			$("select[name=cat3]:eq("+index+")").append("<option value='"+data.list[i].cat3+"'>"+ data.list[i].catname3 +"</option>");
	        		}
	        	}
	        	
	        	if( initFlag == "N") {
		        	
	        	}else{
	        		$("select[name=cat3]:eq("+index+") > option").each(function(){	    				
	    				if( $(this).val() == selectedValue){
	    					$(this).attr("selected","selected");	    	
	    				}
	    			});	
	        	}	        	
	        },
			error:function(args){
				alert("serviceCodeAjax2:error:"+request+"status:"+status+"error:"+error);
			}
	    });
	}		
	// 지역 
	function getSigunguList(areacode , initFlag){    
		
		var langtype = $("input[name=rlangtype]:checked").val();			
	    var params = {"areacode":areacode,"langtype":langtype};
	    $.ajax({
	    	url : "/guide/signguCodeAjax.do",
	        type: "post",
	        dataType: "json",
	        data : params,
	        success:function(data){
	        	
	        	$("select[name=sigungucode]").empty();	        	
	        	$("select[name=sigungucode]").append("<option value=''>시군구 선택</option>");
	        	
	        	for(var  i = 0;  i < data.list.length; i ++){	        		
	        		$("select[name=sigungucode]").append("<option value="+data.list[i].signguCode+">"+ data.list[i].signguNm +"</option>");
	        	}
	        	
	        	if( initFlag == "N") {
	        		// 시군구 selected	        	
		    		$("select[name=sigungucode] > option").each(function(){
		    			if( $(this).val() == ""){
		    				$(this).attr("selected","selected");
		    			}	    			
		    		});
	        	};
	        	
	        },
			error:function(args){
				alert("signguCodeAjax:error:"+request+"status:"+status+"error:"+error);
			}
	    });
	   }

</script>
<table class="bbsSearch" style="border:0px;">
	<caption>검색 순서 2 - 관광데이터 검색을 위한 관광타입선택, 서비스 분류 선택(대, 중, 소), 지역 선택</caption>
	<colgroup>
		<col style="width:95px;">
		<col width="width:861px !important;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">관광타입</th>
			<td>
			    <select title="타입 선택" name="contenttypeid" onchange="typeChange(this);">
					<option value="" selected="selected">타입선택</option>
					<option value="12" selected="selected">관광지</option><option value="14">문화시설</option><option value="15">축제공연행사</option><option value="25">여행코스</option><option value="28">레포츠</option><option value="32">숙박</option><option value="38">쇼핑</option><option value="39">음식점</option>		
				</select>
				
			</td>
		</tr>
	  
		<tr>
			<th scope="row">서비스분류</th>
			<td class="dataSearch">
				<div>
					<span>
						<select title="대분류" name="cat1" onchange="getCat2List(this);">
							<option value="">대분류</option>
							<option value="A01">자연</option><option value="A02" selected="selected">인문(문화/예술/역사)</option><option value="A03">레포츠</option><option value="A04">쇼핑</option><option value="A05">음식</option><option value="B02">숙박</option><option value="C01">추천코스</option>		
						</select>
						<select name="cat2" onchange="getCat3List(this);" title="중분류"><option value="">중분류</option><option value="A0201" selected="">역사관광지</option><option value="A0202">휴양관광지</option><option value="A0203">체험관광지</option><option value="A0204">산업관광지</option><option value="A0205">건축/조형물</option><option value="A0206">문화시설</option><option value="A0207">축제</option><option value="A0208">공연/행사</option></select>
						
						<select name="cat3" style="width:308px;" title="소분류"><option value="">소분류</option><option value="A02010100">고궁</option><option value="A02010200">성</option><option value="A02010300">문</option><option value="A02010400">고택</option><option value="A02010500">생가</option><option value="A02010600">민속마을</option><option value="A02010700">유적지/사적지</option><option value="A02010800">사찰</option><option value="A02010900">종교성지</option><option value="A02011000">안보관광</option></select>
					</span>
					<span>
						<select title="대분류" style="display:none" name="cat1" onchange="getCat2List(this);">
							<option value="">대분류</option>
							<option value="A01">자연</option><option value="A02">인문(문화/예술/역사)</option><option value="A03">레포츠</option><option value="A04">쇼핑</option><option value="A05">음식</option><option value="B02">숙박</option><option value="C01">추천코스</option>		
						</select>
						
						<select name="cat2" onchange="getCat3List(this);" style="display:none" title="중분류"> 
							<option value="">중분류</option>
						</select>
						
						<select name="cat3" style="display:none;width:308px;" title="소분류">
							<option value="">소분류</option>
						</select>
					</span>
					<span>
						<select title="대분류" style="display:none" name="cat1" onchange="getCat2List(this);">
							<option value="">대분류</option>
							<option value="A01">자연</option><option value="A02">인문(문화/예술/역사)</option><option value="A03">레포츠</option><option value="A04">쇼핑</option><option value="A05">음식</option><option value="B02">숙박</option><option value="C01">추천코스</option>		
						</select>
						
						<select name="cat2" onchange="getCat3List(this);" style="display:none" title="중분류"> 
							<option value="">중분류</option>
						</select>
						
						<select name="cat3" style="display:none;width:308px;" title="소분류">
							<option value="">소분류</option>
						</select>
					</span>
				</div>

			</td>
		</tr>
		<tr>
			<th scope="row">지역</th>
			<td>
				<select title="지역선택" name="areacode" onchange="getSigunguList(this.value);">
					<option value="" selected="selected">지역선택</option>
					<option value="1">서울</option><option value="2">인천</option><option value="3">대전</option><option value="4">대구</option><option value="5">광주</option><option value="6" selected="selected">부산</option><option value="7">울산</option><option value="8">세종특별자치시</option><option value="31">경기도</option><option value="32">강원도</option><option value="33">충청북도</option><option value="34">충청남도</option><option value="35">경상북도</option><option value="36">경상남도</option><option value="37">전라북도</option><option value="38">전라남도</option><option value="39">제주도</option>		
				</select>
			
				<select name="sigungucode" title="시군구선택"><option value="" selected="selected">시군구 선택</option><option value="1">강서구</option><option value="2">금정구</option><option value="3">기장군</option><option value="4">남구</option><option value="5">동구</option><option value="6">동래구</option><option value="7">부산진구</option><option value="8">북구</option><option value="9">사상구</option><option value="10">사하구</option><option value="11">서구</option><option value="12">수영구</option><option value="13">연제구</option><option value="14">영도구</option><option value="15">중구</option><option value="16">해운대구</option></select>
			</td>
			
		</tr>
	</tbody>
</table></div>
					 			
						<table class="bbsSearch">
							<caption>검색 순서 3  - 검색버튼을 클릭(엔터)하면 관광데이터 검색 결과를 확인할 수 있음</caption>
							<colgroup>
								<col style="width:95px;">
								<col style="width:861px;">
							</colgroup>
							<tbody>				
								<tr>
									<th class="last wHacki8" scope="row">검색</th>
									<td class="last">
									    <input type="hidden" name="mode" value="listOk">
										<input type="image" id="search" src="/static/images/common/btn/btnSearch_Blue.gif" alt="검색">
									</td>
								</tr>
							</tbody>
						</table>
					
					</div>
				</fieldset>	
				<div class="searchUtill">
				<p><strong>총 데이터 수</strong>63개</p>
				<div>

					  <select name="arrange" id="arran" title="정렬방법">
						<option value="A" selected="">제목순</option>
						<option value="B">인기순</option>
						<option value="C">최근수정순</option>
						<option value="D">등록순</option>
						<option value="O">제목순(이미지)</option>
					    <option value="P">인기순(이미지)</option>
						<option value="Q">최근수정순(이미지)</option>
						<option value="R">등록순(이미지)</option>
								
					</select>
	             <input type="image" id="arrview" src="/static/images/common/btn/btnSearch_gray.gif" alt="검색">
					
				</div>
			</div>
			</form>
			<!-- searchArea -->
			
			<!-- //utill -->
			
			<!-- galleryList -->
	 		
	 
	
			<div class="listWrap">
			
					
				<ul class="galleryList">
				 
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=294452&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/83/1561883_image2_1.jpg" alt="">
							<p>감천사(부산)</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
			    
					 
					  
					   <li>
						<a href="/guide/tourDetail.do?contentId=1942348&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="/static/images/common/noImage.gif" alt="">
							<p>관수옥과 초량왜관 터</p>
						</a>
					</li>
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=2785265&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/07/2790707_image2_1.JPG" alt="">
							<p>관음사</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=298099&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/69/1570969_image2_1.jpg" alt="">
							<p>국청사(부산)</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=1607440&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/12/1571912_image2_1.jpg" alt="">
							<p>금강사(부산)</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
			    
					 
					  
					   <li>
						<a href="/guide/tourDetail.do?contentId=1607163&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="/static/images/common/noImage.gif" alt="">
							<p>금강암(부산)</p>
						</a>
					</li>
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=298111&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/43/2690243_image2_1.jpg" alt="">
							<p>금수사(부산)</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
			    
					 
					  
					   <li>
						<a href="/guide/tourDetail.do?contentId=298112&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="/static/images/common/noImage.gif" alt="">
							<p>금용암(부산)</p>
						</a>
					</li>
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=126196&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/44/1605344_image2_1.jpg" alt="">
							<p>금정산성</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=298114&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/72/2480172_image2_1.jpg" alt="">
							<p>금정선원</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
				  
				   
			    
					 
					  
					   <li>
						<a href="/guide/tourDetail.do?contentId=1953936&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="/static/images/common/noImage.gif" alt="">
							<p>기장향교</p>
						</a>
					</li>
					  
					
				
				  
				   
					  <li>
						<a href="/guide/tourDetail.do?contentId=1942299&amp;langtype=KOR&amp;typeid=12&amp;oper=area&amp;burl=&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/98/2718798_image2_1.jpg" alt="">
							<p>남선창고터</p>
						</a>
					</li>
					  
			    
					 
					  
					
				
			</ul>
			</div>
	   		<!-- paging -->
			<div class="pageNavi">
			 	<a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=1"><img src="/static/images/common/btn/btnPageFirst.gif" alt="첫페이지"></a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=1"><img src="/static/images/common/btn/btnPagePrev.gif" alt="이전 리스트"></a><span><strong>1</strong><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=2">2</a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=3">3</a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=4">4</a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=5">5</a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=6">6</a></span><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=6"><img src="/static/images/common/btn/btnPageNext.gif" alt="다음 리스트"></a><a href="?langtype=KOR&amp;arrange=A&amp;areacode=6&amp;cat1=A02&amp;cat2=A0201&amp;contenttypeid=12&amp;mode=listOk&amp;pageNo=6"><img src="/static/images/common/btn/btnPageLast.gif" alt="마지막페이지"></a>
 
			</div> 
			<!-- //paging -->
			 <!-- Listwrap -->
			
			
				

		 

			<!-- debug -->
			<div class="debugCon">
				<p class="tit">요청 URL</p>
				<div>
			   http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=인증키&amp;contentTypeId=12&amp;areaCode=6&amp;sigunguCode=&amp;cat1=A02&amp;cat2=A0201&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1
				</div>
				<p class="tit"><img src="/static/images/openAPI/titXml.gif" alt="응답XML"></p>
				<textarea rows="15" title="xml데이터 펼쳐보기">&lt;?xml version="1.0" encoding="UTF-8" standalone="yes"?&gt;
&lt;response&gt;
&lt;header&gt;
&lt;resultCode&gt;0000&lt;/resultCode&gt;
&lt;resultMsg&gt;OK&lt;/resultMsg&gt;
&lt;/header&gt;
&lt;body&gt;
&lt;items&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 연제구 묘봉산로 40&lt;/addr1&gt;
&lt;addr2&gt;(연산동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;294452&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20071126162214&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/83/1561883_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/83/1561883_image3_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0912632411&lt;/mapx&gt;
&lt;mapy&gt;35.1833036953&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210322165510&lt;/modifiedtime&gt;
&lt;readcount&gt;22523&lt;/readcount&gt;
&lt;sigungucode&gt;13&lt;/sigungucode&gt;
&lt;title&gt;감천사(부산)&lt;/title&gt;
&lt;zipcode&gt;47582&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 중구 용두산길 37-55&lt;/addr1&gt;
&lt;addr2&gt;(광복동2가)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010700&lt;/cat3&gt;
&lt;contentid&gt;1942348&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20140819162210&lt;/createdtime&gt;
&lt;mapx&gt;129.0327483723&lt;/mapx&gt;
&lt;mapy&gt;35.1005396593&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210111171008&lt;/modifiedtime&gt;
&lt;readcount&gt;5819&lt;/readcount&gt;
&lt;sigungucode&gt;15&lt;/sigungucode&gt;
&lt;title&gt;관수옥과 초량왜관 터&lt;/title&gt;
&lt;zipcode&gt;48950&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 사하구 제석로79번길 33&lt;/addr1&gt;
&lt;addr2&gt;(당리동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;2785265&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20211202132942&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/07/2790707_image2_1.JPG&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/07/2790707_image2_1.JPG&lt;/firstimage2&gt;
&lt;mapx&gt;128.9758058697&lt;/mapx&gt;
&lt;mapy&gt;35.1091043203&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20211209144154&lt;/modifiedtime&gt;
&lt;readcount&gt;0&lt;/readcount&gt;
&lt;sigungucode&gt;10&lt;/sigungucode&gt;
&lt;title&gt;관음사&lt;/title&gt;
&lt;zipcode&gt;49316&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 금정구 북문로 42&lt;/addr1&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;298099&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20071127132106&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/69/1570969_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/69/1570969_image3_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0549922383&lt;/mapx&gt;
&lt;mapy&gt;35.2538895578&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20211020113410&lt;/modifiedtime&gt;
&lt;readcount&gt;20873&lt;/readcount&gt;
&lt;sigungucode&gt;2&lt;/sigungucode&gt;
&lt;title&gt;국청사(부산)&lt;/title&gt;
&lt;zipcode&gt;46237&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 동래구 우장춘로 211&lt;/addr1&gt;
&lt;addr2&gt;(온천동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;1607440&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20120419143913&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/12/1571912_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/12/1571912_image3_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0771855435&lt;/mapx&gt;
&lt;mapy&gt;35.2250098725&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210224171015&lt;/modifiedtime&gt;
&lt;readcount&gt;19911&lt;/readcount&gt;
&lt;sigungucode&gt;6&lt;/sigungucode&gt;
&lt;title&gt;금강사(부산)&lt;/title&gt;
&lt;zipcode&gt;47700&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 금정구 범어사로 254&lt;/addr1&gt;
&lt;addr2&gt;(청룡동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;1607163&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20120419105226&lt;/createdtime&gt;
&lt;mapx&gt;129.0652933488&lt;/mapx&gt;
&lt;mapy&gt;35.2818532794&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210311151646&lt;/modifiedtime&gt;
&lt;readcount&gt;18295&lt;/readcount&gt;
&lt;sigungucode&gt;2&lt;/sigungucode&gt;
&lt;title&gt;금강암(부산)&lt;/title&gt;
&lt;zipcode&gt;46200&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 동구 망양로 533-1&lt;/addr1&gt;
&lt;addr2&gt;(초량동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;298111&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20071127142620&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/43/2690243_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/43/2690243_image3_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0296786530&lt;/mapx&gt;
&lt;mapy&gt;35.1204207111&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210715105341&lt;/modifiedtime&gt;
&lt;readcount&gt;23338&lt;/readcount&gt;
&lt;sigungucode&gt;5&lt;/sigungucode&gt;
&lt;title&gt;금수사(부산)&lt;/title&gt;
&lt;zipcode&gt;48717&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 연제구 성지곡로 111&lt;/addr1&gt;
&lt;addr2&gt;(거제동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;298112&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20071127142951&lt;/createdtime&gt;
&lt;mapx&gt;129.0496638560&lt;/mapx&gt;
&lt;mapy&gt;35.1916075512&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210225164920&lt;/modifiedtime&gt;
&lt;readcount&gt;24008&lt;/readcount&gt;
&lt;sigungucode&gt;13&lt;/sigungucode&gt;
&lt;title&gt;금용암(부산)&lt;/title&gt;
&lt;zipcode&gt;47500&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 금정구 북문로 78-5&lt;/addr1&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010200&lt;/cat3&gt;
&lt;contentid&gt;126196&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20030826000000&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/44/1605344_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/44/1605344_image3_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0559836837&lt;/mapx&gt;
&lt;mapy&gt;35.2587890268&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210728175830&lt;/modifiedtime&gt;
&lt;readcount&gt;28350&lt;/readcount&gt;
&lt;sigungucode&gt;2&lt;/sigungucode&gt;
&lt;title&gt;금정산성&lt;/title&gt;
&lt;zipcode&gt;46237&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 동래구 우장춘로 157-59&lt;/addr1&gt;
&lt;addr2&gt;(온천동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010800&lt;/cat3&gt;
&lt;contentid&gt;298114&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20071127152243&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/72/2480172_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/72/2480172_image2_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0741053488&lt;/mapx&gt;
&lt;mapy&gt;35.2216351938&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210316143715&lt;/modifiedtime&gt;
&lt;readcount&gt;20553&lt;/readcount&gt;
&lt;sigungucode&gt;6&lt;/sigungucode&gt;
&lt;title&gt;금정선원&lt;/title&gt;
&lt;zipcode&gt;47700&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 기장군 기장읍 차성로417번길 35&lt;/addr1&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010700&lt;/cat3&gt;
&lt;contentid&gt;1953936&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20141006095120&lt;/createdtime&gt;
&lt;mapx&gt;129.2158836772&lt;/mapx&gt;
&lt;mapy&gt;35.2578421006&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210825182711&lt;/modifiedtime&gt;
&lt;readcount&gt;5361&lt;/readcount&gt;
&lt;sigungucode&gt;3&lt;/sigungucode&gt;
&lt;title&gt;기장향교&lt;/title&gt;
&lt;zipcode&gt;46053&lt;/zipcode&gt;
&lt;/item&gt;
&lt;item&gt;
&lt;addr1&gt;부산광역시 동구 초량로13번길 53&lt;/addr1&gt;
&lt;addr2&gt;(초량동)&lt;/addr2&gt;
&lt;areacode&gt;6&lt;/areacode&gt;
&lt;cat1&gt;A02&lt;/cat1&gt;
&lt;cat2&gt;A0201&lt;/cat2&gt;
&lt;cat3&gt;A02010700&lt;/cat3&gt;
&lt;contentid&gt;1942299&lt;/contentid&gt;
&lt;contenttypeid&gt;12&lt;/contenttypeid&gt;
&lt;createdtime&gt;20140819153247&lt;/createdtime&gt;
&lt;firstimage&gt;http://tong.visitkorea.or.kr/cms/resource/98/2718798_image2_1.jpg&lt;/firstimage&gt;
&lt;firstimage2&gt;http://tong.visitkorea.or.kr/cms/resource/98/2718798_image2_1.jpg&lt;/firstimage2&gt;
&lt;mapx&gt;129.0395112298&lt;/mapx&gt;
&lt;mapy&gt;35.1167962983&lt;/mapy&gt;
&lt;mlevel&gt;6&lt;/mlevel&gt;
&lt;modifiedtime&gt;20210527174829&lt;/modifiedtime&gt;
&lt;readcount&gt;4697&lt;/readcount&gt;
&lt;sigungucode&gt;5&lt;/sigungucode&gt;
&lt;title&gt;남선창고터&lt;/title&gt;
&lt;zipcode&gt;48816&lt;/zipcode&gt;
&lt;/item&gt;
&lt;/items&gt;
&lt;numOfRows&gt;12&lt;/numOfRows&gt;
&lt;pageNo&gt;1&lt;/pageNo&gt;
&lt;totalCount&gt;63&lt;/totalCount&gt;
&lt;/body&gt;
&lt;/response&gt;</textarea>
			</div>
			<!-- //debug -->

		</section>
		<!-- //content -->
	</section>
	</div>

</body>
</html>