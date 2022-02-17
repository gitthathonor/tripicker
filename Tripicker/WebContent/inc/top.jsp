<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--/ Form Search Star /-->
<header>
<%
	String id = null;
	String rank = null;
	// 세션 정보 저장
	if(session != null){
		id = (String)session.getAttribute("id");
		rank = session.getAttribute("rank")+"";
	}
%>
<!--  보류!
  검색조건
  <div class="click-closed"></div>
  / 검색 조건 /
  <div class="box-collapse">
    <div class="title-box-d">
      <h3 class="title-d">여행 조건</h3>
    </div>
    <span class="close-box-collapse right-boxed ion-ios-close"></span>
    <div class="box-collapse-wrap form">
      <form class="form-a">
        <div class="row">
          <div class="col-md-12 mb-2">
            <div class="form-group">
              <label for="Type">키워드</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="키워드">
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="Type">지역</label>
              <select class="form-control form-control-lg form-control-a" id="Type">
                <option>서울</option>
                <option>부산</option>
                <option>대구</option>
                <option>인천</option>
                <option>광주</option>
                <option>대전</option>
                <option>울산</option>
                <option>경기</option>
                <option>강원</option>
                <option>충북</option>
                <option>충남</option>
                <option>전북</option>
                <option>전남</option>
                <option>경북</option>
                <option>경남</option>
                <option>제주</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="city">여행일</label>
              <select class="form-control form-control-lg form-control-a" id="city">
                <option>1-3일</option>
                <option>4-6일</option>
                <option>7-10일</option>
                <option>11-15일</option>
                <option>15일이상</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="bedrooms">여행시기</label>
              <select class="form-control form-control-lg form-control-a" id="bedrooms">
                <option>봄</option>
                <option>여름</option>
                <option>가을</option>
                <option>겨울</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="garages">여행테마</label>
              <select class="form-control form-control-lg form-control-a" id="garages">
                <option>가족여행</option>
                <option>나홀로여행</option>
                <option>커플여행</option>
                <option>친구와함께</option>
                <option>비즈니스여행</option>
              </select>
            </div>
          </div>
          <div class="col-md-12">
            <button type="submit" class="btn btn-b">검색</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  / 검색 조건 /
 -->  

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="./Main.tr">Trip<span class="color-b">Picker</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">          
          <li class="nav-item">
            <a class="nav-link" href="./PlanMain.pl">코스짜기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="CityChoice.ci">여행장소</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="property-grid.jsp">숙박/교통</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">커뮤니티</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              고객센터</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="./NoticeAction.no">공지사항</a>
              <a class="dropdown-item" href="./FAQAction.no">FAQ</a>
              <a class="dropdown-item" href="requestsEX.jsp">1:1문의</a>
            </div>
          </li>
          
        </ul>
      </div>     
		<%
 			if(id == null){
 		%>
      	  <!-- 로그인 전 메뉴 -->
      	  <input type="button" class="btn btn-b-n" onclick="location.href='./UserLogin.us';" value="로그인" style="border-radius: 5px;">&nbsp;
      	  <input type="button" class="btn btn-a-n" onclick="location.href='./UserJoin.us';" value="회원가입" style="border-radius: 5px;">
      	  
 		<% 	
 			}else{
		%>
       	  <!-- 로그인 후 메뉴 -->
       	  <div>
       	  <%=id %>님 환영합니다! &nbsp;&nbsp;&nbsp;
       	  <input type="button" class="btn btn-b-n" onclick="location.href='./MyPageInfo.my';" value="마이페이지" style="border-radius: 5px;">&nbsp;
      	  <input type="button" class="btn" onclick="location.href='./UserLogout.us';" value="로그아웃" style="border-radius: 5px;">
      	  
      	  </div>
 		<%
 			}
		 %>

<!-- 검색버튼 일단 보류 -->		 
<!-- 		 <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse" -->
<!--         data-target="#navbarTogglerDemo01" aria-expanded="false"> -->
<!--         <span class="fa fa-search" aria-hidden="true"></span> -->
<!--       </button> -->
		 
    </div>
  </nav>
  </header>
  <!--/ Nav End /-->