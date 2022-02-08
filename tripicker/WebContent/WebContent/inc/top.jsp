<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--/ Form Search Star /-->
<header>
<!-- 검색조건 -->
  <div class="click-closed"></div>
  <!--/ 검색 조건 /-->
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
  <!--/ 검색 조건 /-->

  <!--/ 메뉴바 /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="index.html">Trip<span class="color-b">Picker</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">코스짜기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="property-grid.html">여행장소</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="blog-grid.html">숙박/교통</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              커뮤니티
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">Property Single</a>
              <a class="dropdown-item" href="blog-single.html">Blog Single</a>
              <a class="dropdown-item" href="agents-grid.html">Agents Grid</a>
              <a class="dropdown-item" href="agent-single.html">Agent Single</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"href="#" id="navbarDropdown" role="button" data-toggle="dropdown">고객센터</a>
         	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="notice.jsp">공지사항</a>
              <a class="dropdown-item" href="faq.jsp">FAQ</a>
              <a class="dropdown-item" href="requestsEX.jsp">1:1 문의</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="loginForm.jsp"><i class="fa fa-user"></i> Login</a>
         </li>
        </ul>
      </div>
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>
  <!--/ 메뉴바 /-->
  </header>
  <!--/ Nav End /-->