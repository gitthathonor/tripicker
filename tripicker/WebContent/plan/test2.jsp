<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
    			if( $(this).val() == ""){
    				
    				$(this).attr("selected","selected");
    			}	    			
    		});
    		
        					    		
    		 
    		
    					        	
        	// 지역 selected	        	
    		$("select[name=areacode] > option").each(function(){
    			if( $(this).val() == ""){
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
					<option value="12">관광지</option><option value="14">문화시설</option><option value="15">축제공연행사</option><option value="25">여행코스</option><option value="28">레포츠</option><option value="32">숙박</option><option value="38">쇼핑</option><option value="39">음식점</option>		
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
							<option value="A01">자연</option><option value="A02">인문(문화/예술/역사)</option><option value="A03">레포츠</option><option value="A04">쇼핑</option><option value="A05">음식</option><option value="B02">숙박</option><option value="C01">추천코스</option>		
						</select>
						<select name="cat2" onchange="getCat3List(this);" title="중분류"> 
							<option value="">중분류</option>
						</select>
						
						<select name="cat3" style="width:308px;" title="소분류">
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
					<option value="1">서울</option><option value="2">인천</option><option value="3">대전</option><option value="4">대구</option><option value="5">광주</option><option value="6">부산</option><option value="7">울산</option><option value="8">세종특별자치시</option><option value="31">경기도</option><option value="32">강원도</option><option value="33">충청북도</option><option value="34">충청남도</option><option value="35">경상북도</option><option value="36">경상남도</option><option value="37">전라북도</option><option value="38">전라남도</option><option value="39">제주도</option>		
				</select>
			
				<select name="sigungucode" title="시군구선택"><option value="" selected="selected">시군구 선택</option><option value="1">강서구</option><option value="1">중구</option><option value="1">괴산군</option><option value="1">광산구</option><option value="1">강릉시</option><option value="1">강진군</option><option value="1">거제시</option><option value="1">가평군</option><option value="1">공주시</option><option value="1">강화군</option><option value="1">고창군</option><option value="1">남제주군</option><option value="1">대덕구</option><option value="1">세종특별자치시</option><option value="1">남구</option><option value="1">경산시</option><option value="1">강남구</option><option value="2">거창군</option><option value="2">북제주군</option><option value="2">금산군</option><option value="2">군산시</option><option value="2">단양군</option><option value="2">경주시</option><option value="2">동구</option><option value="2">계양구</option><option value="2">남구</option><option value="2">달서구</option><option value="2">고성군</option><option value="2">강동구</option><option value="2">고양시</option><option value="2">고흥군</option><option value="2">금정구</option><option value="3">미추홀구</option><option value="3">서구</option><option value="3">서귀포시</option><option value="3">강북구</option><option value="3">고령군</option><option value="3">동해시</option><option value="3">달성군</option><option value="3">기장군</option><option value="3">논산시</option><option value="3">김제시</option><option value="3">고성군</option><option value="3">보은군</option><option value="3">동구</option><option value="3">곡성군</option><option value="3">과천시</option><option value="4">구미시</option><option value="4">당진시</option><option value="4">유성구</option><option value="4">강서구</option><option value="4">영동군</option><option value="4">남구</option><option value="4">북구</option><option value="4">광양시</option><option value="4">남동구</option><option value="4">제주시</option><option value="4">남원시</option><option value="4">광명시</option><option value="4">동구</option><option value="4">김해시</option><option value="4">삼척시</option><option value="5">동구</option><option value="5">관악구</option><option value="5">보령시</option><option value="5">군위군</option><option value="5">남해군</option><option value="5">옥천군</option><option value="5">울주군</option><option value="5">구례군</option><option value="5">속초시</option><option value="5">서구</option><option value="5">중구</option><option value="5">북구</option><option value="5">무주군</option><option value="5">광주시</option><option value="6">동래구</option><option value="6">구리시</option><option value="6">김천시</option><option value="6">광진구</option><option value="6">마산시</option><option value="6">나주시</option><option value="6">부평구</option><option value="6">음성군</option><option value="6">양구군</option><option value="6">서구</option><option value="6">부안군</option><option value="6">부여군</option><option value="7">구로구</option><option value="7">담양군</option><option value="7">군포시</option><option value="7">수성구</option><option value="7">서산시</option><option value="7">부산진구</option><option value="7">문경시</option><option value="7">서구</option><option value="7">밀양시</option><option value="7">제천시</option><option value="7">순창군</option><option value="7">양양군</option><option value="8">금천구</option><option value="8">서천군</option><option value="8">사천시</option><option value="8">영월군</option><option value="8">봉화군</option><option value="8">중구</option><option value="8">목포시</option><option value="8">완주군</option><option value="8">김포시</option><option value="8">연수구</option><option value="8">진천군</option><option value="8">북구</option><option value="9">원주시</option><option value="9">상주시</option><option value="9">아산시</option><option value="9">사상구</option><option value="9">산청군</option><option value="9">무안군</option><option value="9">남양주시</option><option value="9">노원구</option><option value="9">청원군</option><option value="9">옹진군</option><option value="9">익산시</option><option value="10">청주시</option><option value="10">동두천시</option><option value="10">보성군</option><option value="10">양산시</option><option value="10">성주군</option><option value="10">임실군</option><option value="10">중구</option><option value="10">인제군</option><option value="10">도봉구</option><option value="10">사하구</option><option value="11">부천시</option><option value="11">장수군</option><option value="11">예산군</option><option value="11">안동시</option><option value="11">정선군</option><option value="11">서구</option><option value="11">순천시</option><option value="11">동대문구</option><option value="11">충주시</option><option value="12">천안시</option><option value="12">성남시</option><option value="12">동작구</option><option value="12">철원군</option><option value="12">수영구</option><option value="12">영덕군</option><option value="12">신안군</option><option value="12">의령군</option><option value="12">전주시</option><option value="12">증평군</option><option value="13">정읍시</option><option value="13">진주시</option><option value="13">수원시</option><option value="13">청양군</option><option value="13">마포구</option><option value="13">영양군</option><option value="13">연제구</option><option value="13">춘천시</option><option value="13">여수시</option><option value="14">서대문구</option><option value="14">태안군</option><option value="14">영도구</option><option value="14">시흥시</option><option value="14">영주시</option><option value="14">진안군</option><option value="14">태백시</option><option value="14">진해시</option><option value="15">창녕군</option><option value="15">중구</option><option value="15">홍성군</option><option value="15">서초구</option><option value="15">영천시</option><option value="15">안산시</option><option value="15">평창군</option><option value="16">안성시</option><option value="16">영광군</option><option value="16">홍천군</option><option value="16">예천군</option><option value="16">해운대구</option><option value="16">성동구</option><option value="16">창원시</option><option value="16">계룡시</option><option value="17">화천군</option><option value="17">통영시</option><option value="17">성북구</option><option value="17">울릉군</option><option value="17">안양시</option><option value="17">영암군</option><option value="18">하동군</option><option value="18">양주시</option><option value="18">울진군</option><option value="18">송파구</option><option value="18">횡성군</option><option value="18">완도군</option><option value="19">의성군</option><option value="19">함안군</option><option value="19">양천구</option><option value="19">장성군</option><option value="19">양평군</option><option value="20">함양군</option><option value="20">장흥군</option><option value="20">영등포구</option><option value="20">여주시</option><option value="20">청도군</option><option value="21">연천군</option><option value="21">용산구</option><option value="21">진도군</option><option value="21">청송군</option><option value="21">합천군</option><option value="22">오산시</option><option value="22">은평구</option><option value="22">칠곡군</option><option value="22">함평군</option><option value="23">용인시</option><option value="23">해남군</option><option value="23">종로구</option><option value="23">포항시</option><option value="24">화순군</option><option value="24">중구</option><option value="24">의왕시</option><option value="25">중랑구</option><option value="25">의정부시</option><option value="26">이천시</option><option value="27">파주시</option><option value="28">평택시</option><option value="29">포천시</option><option value="30">하남시</option><option value="31">화성시</option></select>
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
				<p><strong>총 데이터 수</strong>0개</p>
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
	 

			<!-- debug -->
			<div class="debugCon">
				<p class="tit">요청 URL</p>
				<div>
			   
				</div>
				<p class="tit"><img src="/static/images/openAPI/titXml.gif" alt="응답XML"></p>
				<textarea rows="15" title="xml데이터 펼쳐보기"></textarea>
			</div>
			<!-- //debug -->

		</section>
		<!-- //content -->
	</section>
</body>
</html>