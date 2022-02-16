<%@page import="com.tripicker.board.db.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.tripicker.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

 
<%
//request 영역에 boardList 저장
ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList"); //캐스팅
int cnt = (int)request.getAttribute("cnt");

//페이징 정보 저장
String pageNum = (String)request.getAttribute("pageNum");
int pageCount = (Integer)request.getAttribute("pageCount");
int pageBlock = (Integer)request.getAttribute("pageBlock");
int startPage = (Integer)request.getAttribute("startPage");
int endPage = (Integer)request.getAttribute("endPage"); 

//6. 게시판 모든 내용을  화면에 출력
String id = (String) session.getAttribute("id");
%>







<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>공지사항</title>
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
  
  <!-- 공지사항 -->	
<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">공지사항</h1>
            <span class="color-text-a">문의사항은 고객센터의 1:1문의와 자주묻는 질문 (FAQ)를 이용해주세요.</span>
          </div>
        </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>            
                    </div>
                </form>
            </div>
        </div>
    </div>
   <fieldset>
   <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
            </select>
  <!-- 공지사항 끝 -->
  

    <div id="board">
        <div class="container">
            <table class="board-table" id="bList">
             <thead>
                <tr>
                    <th scope="nNum" class="th-nNum">번호</th>               
                    <th scope="col" class="th-nTitle">제목</th>
                    <th scope="col" class="th-nReadCount">조회수</th>
                    <th scope="col" class="th-nReg_date">등록일</th>
                </tr>
                </thead>
                <tbody>

             	
				  <%
				 
					 // 다른 페이지 이동 버튼
					 if(cnt != 0){
					
				  for(int i=0;i<boardList.size(); i++){
				  //ArrayList 한칸의 정보 ->BoardBean 객체 하나로 이동
				  BoardDTO bb = (BoardDTO)boardList.get(i);
	
					%>

					<tr>
						<td><%=bb.getnNum() %></td>
						<td>
						<%
					//답글일때만 이미지넣기 
					//변수 wid를 이용하여 들여쓰기 처리 
					int wid = 0;
					if(bb.getRe_lev() > 0){
						wid= 10 * bb.getRe_lev(); //레벨값의 10을 곱한 값만큼 이미지 가로길이를 길게해줌
					%>
					<img src="./notice/level.gif" width="<%=wid%>" height="15">
					<img src="./notice/re.gif">
					<% } %>
						<a href="./BoardContent.bo?nNum=<%=bb.getnNum()%>&pageNum=<%=pageNum%>"><%=bb.getnTitle() %></a></td>	
						<td><%=bb.getnReadCount() %></td>
						<td><%=bb.getnReg_date() %></td>
					</tr>
				<%
				}   
				  }else {%>
				<tr>
				  <td colspan="5">
				      게시판에 글이 없습니다.<br>
				  </td> 
				</tr>
				<%} %>
			
			
				</table>
			</div>
		</fieldset>
				
					<div id="pageBlock">
						<ul class="pagination">
							<%
							 // 이전
							 if(startPage > pageBlock){
								 %>
									<li class="page-item"><a  class="page-link" href="./BoardList.bo?pageNum=<%=startPage-pageBlock%>" ><span aria-hidden="true">이전</span></a></li>
								 <%
							 }
							 // 숫자 (1...10/11...20/.....)
							 for(int i=startPage;i<=endPage;i++){
								 %>
								  <li class="page-item"> <a class="page-link"   href="./BoardList.bo?pageNum=<%=i%>"><%=i %></a></li>
								 <%
							 }
							 // 다음
							 if(endPage < pageCount){
								 %>
								   <li class="page-item"><a  class="page-link"  href="./BoardList.bo?pageNum=<%=startPage+pageBlock%>"><span aria-hidden="true">다음</span></a></li>
								 </ul>
								 <%
							 }
							%>
						</div>
						
				<%
				if(id != null){
				%>
				 <div class="col-md-12">
				<input type="button" class="btn btn-a"  value="공지작성" onclick="location.href='./BoardWrite.bo'">
				</div>
				<%}%>
		

	 <!--  <div class="col-md-12" style="text-align: center; ">
                      <button class="btn btn-a"><a href="noticeWrite.jsp">공지사항 작성</a></button>
                    </div> -->
<div class="clear"></div>
	<div id="page_control">
	
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