<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>글작성</title>
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

  <!-- Main Stylesheet File -->
  <link href="./css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

	<%
		// 닉네임 세션값 가져오기
		String nickname = (String)session.getAttribute("nickname");
		if(nickname == null){	
	%>		
			<script>
			  alert("로그인이 필요한 서비스입니다");
			  location.href = "./UserLogin.us";
			</script>						
	<% 
		}	
	%>
		
  <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">글쓰기</h1>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">         
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ 글 작성 폼 /-->
  <section class="property-single nav-arrow-b">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mb-3">
        <form action="./BoardWriteAction.bo" enctype="multipart/form-data" method="post" name="ft" onsubmit="return checkBoardWrite();">
   		 <input type="hidden" name="nickname" value=${nickname }>
   		 <strong> 제목 </strong> <input type="text" class="form-control form-control-lg form-control-a" name="boardTitle"><br>  
   		 <textarea rows="10" cols="50" name="boardContent" class="form-control form-control-lg form-control-a" ></textarea>
   		 <br><br>
   		 <strong> 사진 </strong> <input type="file" multiple="multiple" name="upFile" id='btnAtt' accept=".jpg, .jpeg, .png"/>	 
   		 <div id="att_zone"></div><!-- <p>파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요</p> -->
   		 <input type="hidden" name="fileName" value="">
   		 <br>  	 
    	 <strong> 태그 </strong><input type="text" class="form-control form-control-lg form-control-a" name="tag" placeholder="제주도,가족여행,자연 " maxlength="50"><br>    	     	   	 
    	 <strong> 글비밀번호 </strong><input type="text" class="form-control form-control-lg form-control-a" name="boardPass" maxlength="4"><br>     	   	 	
      	 	<input type="button" value="취소" class="btn btn-a" onclick="history.back();">
      	 	<input type="submit" value="글쓰기" class="btn btn-a" id="write_btn">
      	 </form>
        </div>
      </div>
    </div>	
  </section>
  <!--/ 글 작성 폼 끝 /-->
  
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

  <!-- Contact Form JavaScript File -->
  <script src="./contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="./js/main.js"></script>


  <script type="text/javascript">  
  var files = null; // 업로드될 파일 리스트
  var fileName = "";  // 업로드될 파일 이름
      
  // 제목,비밀번호 공백 체크
  function checkBoardWrite() {	   
	  if(document.ft.boardTitle.value == ""){
		  alert("글 제목을 입력해주세요");
		  document.ft.boardTitle.focus();
		  return false;
	  }else if(document.ft.boardPass.value == ""){
		  alert("글 비밀번호를 입력해주세요");
		  document.ft.boardPass.focus();
		  return false;
	  }else{// 업로드될 파일명 -> fileName.value에 담기
		  var fileName = "";
		  for(var i=0; i< files.length; i++){
			  fileName += files[i].name;			   
		  }
		  document.ft.fileName.value = fileName;
		  alert(fileName);
		  //return false;
	  }
    }
	   
  
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
	 imageView = function imageView(att_zone, btn){
	   var sel_files = [];	
	   var attZone = document.getElementById(att_zone);
	   var btnAtt = document.getElementById(btn);	    	    
	   // 이미지와 체크 박스를 감싸고 있는 div 속성
	   var div_style = 'display:inline-block;position:relative;'
	                 + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
	   // 미리보기 이미지 속성
	   var img_style = 'width:100%;height:100%;z-index:none';
	   // 이미지안에 표시되는 체크박스의 속성
	   var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
	                 + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
	   
	   
	   /* 파일선택완료 or 취소 버튼 이벤트 */	    
	   btnAtt.onchange = function(e){
		  files = e.target.files; 		
		  delPrivew(sel_files);	

		  // 선택된 파일수만큼 div 생성
		  for(i=0; i < files.length; i++){			  	
			  imageLoader(files[i]);
		  }  
	   };
	   
		function delPrivew(files){
			var cell = document.getElementById("att_zone");
			var i = 0;
/* 			for(i=0; i<sel_files.length; i++){
				//console.log("삭제전:"+sel_files[i].name);
			  	//sel_files.splice(i, 1);
			  	//console.log("삭제후:"+sel_files[i].name);
			} */
			while( cell.hasChildNodes() ){
			 cell.removeChild( cell.firstChild );			    	
			}
		};		   
 	    
	    /* 탐색기에서 드래그앤 드롭 사용 */
	    attZone.addEventListener('dragenter', function(e){
	       e.preventDefault();
	       e.stopPropagation();
	    }, false);
	    
	    attZone.addEventListener('dragover', function(e){
	       e.preventDefault();
	       e.stopPropagation();
	      
	    }, false);
	  
	    attZone.addEventListener('drop', function(e){
	       var files = {};
	       e.preventDefault();
	       e.stopPropagation();
	       var dt = e.dataTransfer;
	       files = dt.files;
	       for(f of files){
	         imageLoader(f);
	       }	      
	     }, false); 
		    	    
	    	
   	    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
	    imageLoader = function(file){
   	       //sel_files = [];
	       //sel_files.push(file);
	       //sel_files = file;
	       console.log("이미지로더 실행");
	       sel_files.push(file);
	       var reader = new FileReader();
	       reader.onload = function(ee){
	         let img = document.createElement('img');
	         img.setAttribute('style', img_style);
	         img.src = ee.target.result;
	         attZone.appendChild(makeDiv(img, file));
	       };
	       reader.readAsDataURL(file);
	     };
	          
	     
	      
	    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
	    makeDiv = function(img, file){
	      var div = document.createElement('div');
	      var btn = document.createElement('input');	
	      div.setAttribute('style', div_style);	 	      
	      //div.setAttribute('name', 'preview');	 	      
	      
	      btn.setAttribute('type', 'button');
	      btn.setAttribute('value', 'x');
	      btn.setAttribute('delFile', file.name);
	      btn.setAttribute('style', chk_style);
	      
	      // 파일미리보기의 삭제버튼 -> 파일리스트에서 삭제
 	      btn.onclick = function(ev){
	        console.log("삭제버튼 실행");
		    var ele = ev.srcElement;
		    console.log("ele:"+ele);
		    var delFile = ele.getAttribute('delFile');	
		    console.log("delFile:"+delFile)
		    console.log("삭제전 sel_files.length"+sel_files.length);
	        for(var i = 0; i<sel_files.length+1;i++){
	          if(delFile== sel_files[i].name){
	        	  console.log("삭제될 delFile:"+delFile);
	        	 // console.log("삭제될 se_files[i]:"+sel_files[i].name);	        	  
	        	  sel_files.splice(i, 1);   
	        	  console.log("삭제후 sel_files.length"+sel_files.length);
	          }	               
	        };
	       	        
	       // DataTransfer -> 드래그앤 드롭 사용시 Data를 담는 메서드
	       dt = new DataTransfer();
	        for(f in sel_files) {
	          var file = sel_files[f];
	          dt.items.add(file);
	       }
	        btnAtt.files = dt.files;
	        var p = ele.parentNode;
	        attZone.removeChild(p);
	      };
	      div.appendChild(img);
	      div.appendChild(btn);		      
	      return div;
	    };
	  }
	)('att_zone', 'btnAtt');

  </script>
</body>
</html>
