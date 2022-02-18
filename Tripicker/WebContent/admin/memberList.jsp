 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>회원정보</title>
  <script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function checkDel() {
		var result = confirm("회원을 강제 탈퇴 시키시겠습니까?");
		
		if(result){
			  alert("강제 탈퇴 처리 되었습니다");
		  }else{
			  alert("취소되었습니다");
			  return false;
		  }
	}
</script>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

<style type="text/css">
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;

}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

</style>
</head>

<body>

 <div class="click-closed"></div>
  <!-- header -->
  	<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- header -->
  
  <!-- 회원정보 -->	
<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">회원정보</h1>
          </div>
        </div>
        </div>
        </div>
   
  <!-- 회원정보 -->
  
<%
     // 세션제어 (로그인X,관리자X)
   	String id = (String)session.getAttribute("id");
	Integer rank = (Integer)session.getAttribute("rank");
   	
    
     
   %>
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">아이디</th>
                    <th scope="col" class="th-num">이름</th>
                    <th scope="col" class="th-num">닉네임</th>
                    <th scope="col" class="th-title">주소</th>
                    <th scope="col" class="th-readcount">이메일</th>
                    <th scope="col" class="th-num">회원가입일</th>
                    <th scope="col" class="th-num">등급</th>
                    <th scope="col" class="th-num">등급변경</th>
                    <th scope="col" class="th-date">강제탈퇴</th>
                </tr>
                </thead>
                
                <tbody>
                
		<c:forEach var="adto" items="${memberList }">
                <tr>
                    <td>${adto.id }</td>
	       <td>${adto.name }</td>
	       <td>${adto.nickname }</td>
	       <td>${adto.addr }</td>
	       <td>${adto.email }</td>
	       <td>${adto.reg_date }</td>
	       <td>${adto.grade }</td>
	       <td><form action="./AdminMemberRankAction.ad">
	       <input type="hidden" name="changeGrade" value="${adto.grade }">
	       <input type="hidden" name="gradeID" value="${adto.id }">
	       <input type="submit" value="등급변경"></form></td>
	       <td><form action="./AdminMemberDeleteAction.ad" onsubmit="return checkDel();">
	       <input type="hidden" name="deleteID" value="${adto.id }">
	       <input type="submit" value="강제탈퇴" id="deleteForm"></form></td>
	     </tr>
     </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	 
<div class="clear"></div>
	<div id="page_control">
		<% Integer startPage = (Integer)session.getAttribute("startPage");
	 	Integer pageBlock = (Integer)session.getAttribute("pageBlock");
	 	Integer endPage = (Integer)session.getAttribute("endPage");
	 	Integer pageCount = (Integer)session.getAttribute("pageCount");
	 	 if(startPage>pageBlock){ %>
			<a href="./AdminMemberList.ad?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<% } %>
		
		<% for(int i=startPage;i<=endPage;i++){ %>
			<a href="./AdminMemberList.ad?pageNum=<%=i%>"><%=i %></a>
		<% }%>
		
		<% if(endPage < pageCount){%>
			<a href="./AdminMemberList.ad?pageNum=<%=startPage+pageBlock%>">Next</a>
		<% }%>
	</div>
</section>


 
  <!-- footer -->
  	<jsp:include page="../inc/bottom.jsp"/>
  <!-- footer -->
 


  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/popper/popper.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
  
</body>
</html>