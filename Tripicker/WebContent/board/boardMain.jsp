<%@page import="com.tripicker.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>커뮤니티</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="./img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
    <!-- Libraries Stylesheet -->
    <link href="./lib/animate/animate.min.css" rel="stylesheet">
    <link href="./lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="./css/likebutton.css" rel="stylesheet">
	<link href="./css/community.css" rel="stylesheet">
	
    <!-- Customized Bootstrap Stylesheet -->
    <link href="./css/community_bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
    <style type="text/css">
    body {
    background-color: #ffffff;
    }
    
    .col-lg-4 col-md-6 wow fadeInUp{
    display: inline;
    }
    .property-item rounded overflow-hidden{
    display: inline;
    }
    
    #page_table{
    margin: 0 auto;
    font-size: 23px;
    }
    
    </style>
</head>

<body>

  <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->
        <!-- Property List Start -->
        
        <div class="intro-single">
            <div class="container">       
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                            <h1 class="mb-3">인기글</h1>
                            <p>여행후기 게시판은 인제를 여행하며 느꼈던 좋았던 점이나 아쉬웠던 경험들을 올리는 공간입니다.<br/>글 작성 시 광고, 허위, 비방글 등에 해당하는 내용은 제한되니 유의 바랍니다.</p>
                        </div>
                    </div>
                    
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">추천순</a>
                            </li>
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">조회순</a>
                            </li>
                            <li class="nav-item me-0">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-3">최신순</a>
                            </li>
                        </ul>
                    </div>
                </div>            
                <div class="tab-content">                             
                   <div id="tab-1" class="tab-pane fade show p-0 active">
                      
                        <div class="row g-4">
                        <c:forEach items="${list }" var="dto">
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">                         
                               
                                <div class="property-item rounded overflow-hidden" style="display:inilne">
                                    <div class="position-relative overflow-hidden">                                    	                                 														
                                        <a href="./BoardContent.bo?boardNum=${dto.boardNum }">
                                        <!-- <img class="img-fluid" src="./img/property-1.jpg" alt=""></a>    -->                             														
                                        <img class="img-fluid" src="${dto.boardFile }" id="boardFile"></a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">${dto.boardNum }</div>
                                    </div>                                   
	                                    <div class="p-4 pb-0">   
	                                        <a class="d-block h5 mb-2" href="./BoardContent.bo?boardNum=${dto.boardNum }">${dto.boardTitle }</a>
	                                        <p><i class="fa fa-user text-primary me-2" ></i>${dto.nickname }</p>
	                                    </div>
	                                    <div class="d-flex border-top">
	                                        <small class="flex-fill text-center border-end py-2">${dto.readCount }<i class="fa fa-eye  text-primary me-2"></i></small>
	                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${dto.tag}</small>
	                                        <small class="flex-fill text-center py-2"><a href="#" class="like-button">
											<?xml version="1.0" encoding="utf-8"?>
											<svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
											</a> ${dto.likeCount } </small>
	                                    </div>
	                                </div>
	                                </div>    
	                                </c:forEach>                       
	                            </div>                            
                         	<!-- </div> -->
                         	
                       		<!-- 페이징 부분 -->
                       		<table id="page_table">
								<tr>
									<td colspan="4" align="center">										
										<c:forEach items="${pageList }" var="page">
											<a href="./BoardMain.bo?page=${page }">${page}</a>
										</c:forEach>
									</td>
								</tr>				
							</table>
                       		<!-- 페이징 부분 -->       
                            <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s" style="margin-top:10px">
                                <a class="btn btn-primary py-3 px-5" href="./BoardWrite.bo">여행후기 작성하기</a>
                            </div>               
                        </div>
                    </div>
                    </div>                   
        <!-- Property List End -->




        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    
	<!-- footer -->
  	<jsp:include page="../inc/bottom.jsp"/>
 	 <!-- footer -->
 	 
<!-- like button -->  
<script type="text/javascript">
//new scrollReveal();
let button = document.querySelector(".like-button");
button.addEventListener("click", function(e) {
  e.preventDefault();
  this.classList.toggle("active");
  this.classList.add("animated");
  generateClones(this);
});
function generateClones(button) {
  let clones = randomInt(2, 4);
  for (let it = 1; it <= clones; it++) {
    let clone = button.querySelector("svg").cloneNode(true),
      size = randomInt(5, 16);
    button.appendChild(clone);
    clone.setAttribute("width", size);
    clone.setAttribute("height", size);
    clone.style.position = "absolute";
    clone.style.transition =
      "transform 0.5s cubic-bezier(0.12, 0.74, 0.58, 0.99) 0.3s, opacity 1s ease-out .5s";
    let animTimeout = setTimeout(function() {
      clearTimeout(animTimeout);
      clone.style.transform =
        "translate3d(" +
        (plusOrMinus() * randomInt(10, 25)) +
        "px," +
        (plusOrMinus() * randomInt(10, 25)) +
        "px,0)";
      clone.style.opacity = 0;
    }, 1);
    let removeNodeTimeout = setTimeout(function() {
      clone.parentNode.removeChild(clone);
      clearTimeout(removeNodeTimeout);
    }, 900);
    let removeClassTimeout = setTimeout( function() {
      button.classList.remove("animated")
    }, 600);
  }
}
function plusOrMinus() {
  return Math.random() < 0.5 ? -1 : 1;
}
function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}
</script>
<!-- like button -->  

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./lib/wow/wow.min.js"></script>
    <script src="./lib/easing/easing.min.js"></script>
    <script src="./lib/waypoints/waypoints.min.js"></script>
    <script src="./lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="./js/main.js"></script>
</body>

</html>