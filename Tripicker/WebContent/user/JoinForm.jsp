<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Join page</title>
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

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

  <div class="click-closed"></div>
  <!--/ Form Search Star /-->
  <div class="box-collapse">
    <div class="title-box-d">
      <h3 class="title-d">Search Property</h3>
    </div>
    <span class="close-box-collapse right-boxed ion-ios-close"></span>
    <div class="box-collapse-wrap form">
      <form class="form-a">
        <div class="row">
          <div class="col-md-12 mb-2">
            <div class="form-group">
              <label for="Type">Keyword</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="Type">Type</label>
              <select class="form-control form-control-lg form-control-a" id="Type">
                <option>All Type</option>
                <option>For Rent</option>
                <option>For Sale</option>
                <option>Open House</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="city">City</label>
              <select class="form-control form-control-lg form-control-a" id="city">
                <option>All City</option>
                <option>Alabama</option>
                <option>Arizona</option>
                <option>California</option>
                <option>Colorado</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="bedrooms">Bedrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bedrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="garages">Garages</label>
              <select class="form-control form-control-lg form-control-a" id="garages">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="bathrooms">Bathrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bathrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="price">Min Price</label>
              <select class="form-control form-control-lg form-control-a" id="price">
                <option>Unlimite</option>
                <option>$50,000</option>
                <option>$100,000</option>
                <option>$150,000</option>
                <option>$200,000</option>
              </select>
            </div>
          </div>
          <div class="col-md-12">
            <button type="submit" class="btn btn-b">Search Property</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!--/ Form Search End /-->

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="index.html">Estate<span class="color-b">Agency</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="property-grid.html">Property</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="blog-grid.html">Blog</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Pages
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item active" href="property-single.html">Property Single</a>
              <a class="dropdown-item" href="blog-single.html">Blog Single</a>
              <a class="dropdown-item" href="agents-grid.html">Agents Grid</a>
              <a class="dropdown-item" href="agent-single.html">Agent Single</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
        </ul>
      </div>
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">회원가입</h1>
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

  <!--/ Property Single Star /-->
  <section class="property-single nav-arrow-b">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mb-3">
        <form action="./UserJoinAction.us" method="post" name="fr" onsubmit="return checkJoin();">
   		 <strong>* 아이디 </strong> <input type="text" class="form-control form-control-lg form-control-a" width="10" name="id" id="input_id" placeholder="4~10자리">
   		 <!-- <input type="button" class="btn btn-b" value="중복확인" id="id_overlap_button" ><br> -->
   		 <font id="id_check_msg"></font><br><br> 		 
   		 <strong>* 비밀번호 </strong><input type="password" class="form-control form-control-lg form-control-a" name="pass" id="input_pass" placeholder="6~12자리">
    	 <font id="pass_check_msg"></font><br><br> 
    	 <strong>* 비밀번호 확인 </strong><input type="password" class="form-control form-control-lg form-control-a" name="checkPass" id="input_same_pass">
    	 <font id="pass_same_check_msg"></font><br><br>     	   	 
    	 <strong>* 이름 : </strong><input type="text" class="form-control form-control-lg form-control-a" name="name" id="input_name" maxlength="15">
    	 <span id="name_check_msg"></span><br><br>    	 
    	 <strong>* 닉네임 </strong> <input type="text" class="form-control form-control-lg form-control-a" name="nickname" id="input_nickname" placeholder="2~8자리">
    	 	<!-- <input type="button" class="btn btn-b" value="중복확인"><br> -->
    	 <font id="nickname_check_msg"></font><br><br> 
    	 <strong>* 나이 </strong> 
	    	 			<select name="age" id="sel_age" >
						   <option value="noSel">연령대 선택</option>
						   <option value="10">10대</option>
						   <option value="20">20대</option>
						   <option value="30">30대</option>
						   <option value="40">40대</option>
						   <option value="50">50대</option>
						   <option value="60">60대</option>
						 </select><br>
		 <font id="age_check_msg"></font><br><br>     	    								
    	 <strong>* 성별 </strong> <input type="radio" class="form-control form-control-lg form-control-a" name="gender" id="check_gender_m" value="M" checked> 남
    	 						  <input type="radio" class="form-control form-control-lg form-control-a" name="gender" id="check_gender_f" value="F"> 여<br>
      	 <font id="gender_check_msg"></font><br><br>       	 
      	 <strong>* 이메일 </strong> <input type="text" class="form-control form-control-lg form-control-a" name="email" id="input_email">
      	 	<!-- <input type="button" class="btn btn-b" value="중복확인"> -->
      	 	<font id="email_check_msg"></font><br><br>  
      	 <strong>주소(선택) </strong> <input type="text" class="form-control form-control-lg form-control-a" name="addr" placeholder="주소찾기를 이용해주세요" readonly >
      	 	<input type="button" class="btn btn-b" onclick="return findAddr();" value="주소찾기"><br>
      	 <strong>상세주소</strong><input type="text" class="form-control form-control-lg form-control-a" name="detailAddr"><br>	
      	 	<input type="submit" value="취소" class="btn btn-a" id="join_btn" onclick="history.back();">
      	 	<input type="button" value="회원가입" class="btn btn-a" id="join_btn" >
      	 </form>
<!--           <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property"> -->
<!--             <div class="carousel-item-b"> -->
<!--               <img src="img/slide-2.jpg" alt=""> -->
<!--             </div> -->
<!--             <div class="carousel-item-b"> -->
<!--               <img src="img/slide-3.jpg" alt=""> -->
<!--             </div> -->
<!--             <div class="carousel-item-b"> -->
<!--               <img src="img/slide-1.jpg" alt=""> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row justify-content-between"> -->
<!--             <div class="col-md-5 col-lg-4"> -->
<!--               <div class="property-price d-flex justify-content-center foo"> -->
<!--                 <div class="card-header-c d-flex"> -->
<!--                   <div class="card-box-ico"> -->
<!--                     <span class="ion-money">$</span> -->
<!--                   </div> -->
<!--                   <div class="card-title-c align-self-center"> -->
<!--                     <h5 class="title-c">15000</h5> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="property-summary"> -->
<!--                 <div class="row"> -->
<!--                   <div class="col-sm-12"> -->
<!--                     <div class="title-box-d section-t4"> -->
<!--                       <h3 class="title-d">Quick Summary</h3> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="summary-list"> -->
<!--                   <ul class="list"> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Property ID:</strong> -->
<!--                       <span>1134</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Location:</strong> -->
<!--                       <span>Chicago, IL 606543</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Property Type:</strong> -->
<!--                       <span>House</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Status:</strong> -->
<!--                       <span>Sale</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Area:</strong> -->
<!--                       <span>340m -->
<!--                         <sup>2</sup> -->
<!--                       </span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Beds:</strong> -->
<!--                       <span>4</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Baths:</strong> -->
<!--                       <span>2</span> -->
<!--                     </li> -->
<!--                     <li class="d-flex justify-content-between"> -->
<!--                       <strong>Garage:</strong> -->
<!--                       <span>1</span> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-md-7 col-lg-7 section-md-t3"> -->
<!--               <div class="row"> -->
<!--                 <div class="col-sm-12"> -->
<!--                   <div class="title-box-d"> -->
<!--                     <h3 class="title-d">Property Description</h3> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="property-description"> -->
<!--                 <p class="description color-text-a"> -->
<!--                   Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit -->
<!--                   neque, auctor sit amet -->
<!--                   aliquam vel, ullamcorper sit amet ligula. Cras ultricies ligula sed magna dictum porta. -->
<!--                   Curabitur aliquet quam id dui posuere blandit. Mauris blandit aliquet elit, eget tincidunt -->
<!--                   nibh pulvinar quam id dui posuere blandit. -->
<!--                 </p> -->
<!--                 <p class="description color-text-a no-margin"> -->
<!--                   Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget -->
<!--                   malesuada. Quisque velit nisi, -->
<!--                   pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada. -->
<!--                 </p> -->
<!--               </div> -->
<!--               <div class="row section-t3"> -->
<!--                 <div class="col-sm-12"> -->
<!--                   <div class="title-box-d"> -->
<!--                     <h3 class="title-d">Amenities</h3> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="amenities-list color-text-a"> -->
<!--                 <ul class="list-a no-margin"> -->
<!--                   <li>Balcony</li> -->
<!--                   <li>Outdoor Kitchen</li> -->
<!--                   <li>Cable Tv</li> -->
<!--                   <li>Deck</li> -->
<!--                   <li>Tennis Courts</li> -->
<!--                   <li>Internet</li> -->
<!--                   <li>Parking</li> -->
<!--                   <li>Sun Room</li> -->
<!--                   <li>Concrete Flooring</li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-md-10 offset-md-1"> -->
<!--           <ul class="nav nav-pills-a nav-pills mb-3 section-t3" id="pills-tab" role="tablist"> -->
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link active" id="pills-video-tab" data-toggle="pill" href="#pills-video" role="tab" -->
<!--                 aria-controls="pills-video" aria-selected="true">Video</a> -->
<!--             </li> -->
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link" id="pills-plans-tab" data-toggle="pill" href="#pills-plans" role="tab" aria-controls="pills-plans" -->
<!--                 aria-selected="false">Floor Plans</a> -->
<!--             </li> -->
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link" id="pills-map-tab" data-toggle="pill" href="#pills-map" role="tab" aria-controls="pills-map" -->
<!--                 aria-selected="false">Ubication</a> -->
<!--             </li> -->
<!--           </ul> -->
<!--           <div class="tab-content" id="pills-tabContent"> -->
<!--             <div class="tab-pane fade show active" id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab"> -->
<!--               <iframe src="https://player.vimeo.com/video/73221098" width="100%" height="460" frameborder="0" -->
<!--                 webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> -->
<!--             </div> -->
<!--             <div class="tab-pane fade" id="pills-plans" role="tabpanel" aria-labelledby="pills-plans-tab"> -->
<!--               <img src="img/plan2.jpg" alt="" class="img-fluid"> -->
<!--             </div> -->
<!--             <div class="tab-pane fade" id="pills-map" role="tabpanel" aria-labelledby="pills-map-tab"> -->
<!--               <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.1422937950147!2d-73.98731968482413!3d40.75889497932681!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25855c6480299%3A0x55194ec5a1ae072e!2sTimes+Square!5e0!3m2!1ses-419!2sve!4v1510329142834" -->
<!--                 width="100%" height="460" frameborder="0" style="border:0" allowfullscreen></iframe> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-md-12"> -->
<!--           <div class="row section-t3"> -->
<!--             <div class="col-sm-12"> -->
<!--               <div class="title-box-d"> -->
<!--                 <h3 class="title-d">Contact Agent</h3> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row"> -->
<!--             <div class="col-md-6 col-lg-4"> -->
<!--               <img src="img/agent-4.jpg" alt="" class="img-fluid"> -->
<!--             </div> -->
<!--             <div class="col-md-6 col-lg-4"> -->
<!--               <div class="property-agent"> -->
<!--                 <h4 class="title-agent">Anabella Geller</h4> -->
<!--                 <p class="color-text-a"> -->
<!--                   Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet -->
<!--                   dui. Quisque velit nisi, -->
<!--                   pretium ut lacinia in, elementum id enim. -->
<!--                 </p> -->
<!--                 <ul class="list-unstyled"> -->
<!--                   <li class="d-flex justify-content-between"> -->
<!--                     <strong>Phone:</strong> -->
<!--                     <span class="color-text-a">(222) 4568932</span> -->
<!--                   </li> -->
<!--                   <li class="d-flex justify-content-between"> -->
<!--                     <strong>Mobile:</strong> -->
<!--                     <span class="color-text-a">777 287 378 737</span> -->
<!--                   </li> -->
<!--                   <li class="d-flex justify-content-between"> -->
<!--                     <strong>Email:</strong> -->
<!--                     <span class="color-text-a">annabella@example.com</span> -->
<!--                   </li> -->
<!--                   <li class="d-flex justify-content-between"> -->
<!--                     <strong>Skype:</strong> -->
<!--                     <span class="color-text-a">Annabela.ge</span> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--                 <div class="socials-a"> -->
<!--                   <ul class="list-inline"> -->
<!--                     <li class="list-inline-item"> -->
<!--                       <a href="#"> -->
<!--                         <i class="fa fa-facebook" aria-hidden="true"></i> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item"> -->
<!--                       <a href="#"> -->
<!--                         <i class="fa fa-twitter" aria-hidden="true"></i> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item"> -->
<!--                       <a href="#"> -->
<!--                         <i class="fa fa-instagram" aria-hidden="true"></i> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item"> -->
<!--                       <a href="#"> -->
<!--                         <i class="fa fa-pinterest-p" aria-hidden="true"></i> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                     <li class="list-inline-item"> -->
<!--                       <a href="#"> -->
<!--                         <i class="fa fa-dribbble" aria-hidden="true"></i> -->
<!--                       </a> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-md-12 col-lg-4"> -->
<!--               <div class="property-contact"> -->
<!--                 <form class="form-a"> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-12 mb-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <input type="text" class="form-control form-control-lg form-control-a" id="inputName" -->
<!--                           placeholder="Name *" required> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-12 mb-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <input type="email" class="form-control form-control-lg form-control-a" id="inputEmail1" -->
<!--                           placeholder="Email *" required> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-12 mb-1"> -->
<!--                       <div class="form-group"> -->
<!--                         <textarea id="textMessage" class="form-control" placeholder="Comment *" name="message" cols="45" -->
<!--                           rows="8" required></textarea> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-12"> -->
<!--                       <button type="submit" class="btn btn-a">Send Message</button> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </form> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
        </div>
      </div>
    </div>
	
  </section>
  <!--/ Property Single End /-->

  <!--/ footer Star /-->
  <section class="section-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-4">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">EstateAgency</h3>
            </div>
            <div class="w-body-a">
              <p class="w-text-a color-text-a">
                Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat duis
                sed aute irure.
              </p>
            </div>
            <div class="w-footer-a">
              <ul class="list-unstyled">
                <li class="color-a">
                  <span class="color-text-a">Phone .</span> contact@example.com</li>
                <li class="color-a">
                  <span class="color-text-a">Email .</span> +54 356 945234</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-4 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">The Company</h3>
            </div>
            <div class="w-body-a">
              <div class="w-body-a">
                <ul class="list-unstyled">
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Site Map</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Legal</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Agent Admin</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Careers</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Affiliate</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Privacy Policy</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-4 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">International sites</h3>
            </div>
            <div class="w-body-a">
              <ul class="list-unstyled">
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Venezuela</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">China</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Hong Kong</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Argentina</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Singapore</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Philippines</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Property</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Blog</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
            </ul>
          </nav>
          <div class="socials-a">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-dribbble" aria-hidden="true"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; Copyright
              <span class="color-a">EstateAgency</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!--/ Footer End /-->

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
  <!-- <script src="js/jquery-3.6.0.min.js"></script> -->
  <!-- 주소찾기 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
 
 <!-- 회원가입 정보 체크 스크립트 -->
 <script type="text/javascript">
  
  // checkJoin() 회원가입전 입력된 정보들 체크
  /* function checkJoin(){
	  var id = document.fr.id.value;
	  var pass = document.fr.pass.value;
	  var nickname = document.fr.nickname.value;
	  
	  //alert(id+pass);
	  // 아이디 자리수 체크
	  if( !(4 <= id.length && id.length <= 10) ) {
		  alert("아이디는 4~10자리로 입력해주세요");
		  document.fr.id.focus();
		  return false;
	  }
	  
	  // 비밀번호 자리수 체크
	  if( !(6 <= pass.length && pass.length <= 12) ){
		  alert("비밀번호는 6~12자리로 입력해주세요");
		  document.fr.pass.focus();
		  return false;
	  }
	  
	  // 비밀번호 확인 체크
	  if(!(document.fr.checkPass.value === pass)) {
		  alert("비밀번호를 일치하게 입력해주세요");
		  document.fr.checkPass.focus();
		  return false;
	  }
	  
	  // 이름 입력유무 체크
	  if(document.fr.name.value === ""){
		  alert("이름을 입력해주세요");
		  document.fr.name.focus();
		  return false;	
	  }
	  
	  // 닉네임 자리수 체크
	  if(!(2 <= nickname.length && nickname.length <= 8)){
		  alert("닉네임은 2~8자리로 입력해주세요");
		  document.fr.nickname.focus();
		  return false;		  
	  }
	  
	  // 나이 선택유무 체크
	  if(document.fr.age.value === "noSel"){
		  alert("연령대를 선택해주세요")
		  document.fr.age.focus();
		  return false;
	  }
	  
	  // 성별 선택유무 체크
	  if(document.fr.gender.value === ""){
		  alert("성별을 선택해주세요")
		  document.fr.gender[0].focus();
		  return false;
	  }
	  
	  // 이메일 형식 체크
	  //이메일 정규식(계정@도메인.최상위 도메인) , 아이디맨앞 특수문자x(. - _ 가능)
	  var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
	  if(document.fr.email.value === ""){
		  alert("이메일을 입력해주세요");
		  return false;
	  }else if(!reg.test(document.fr.email.value)){
		  alert("올바른 이메일 주소를 입력해주세요");
		  document.fr.email.focus();
		  return false;
		}
	  
	  // 상세주소 입력 체크
	  if(document.fr.addr.value === ""){
		  alert("주소를 입력해주세요");
		  return false;
	  }else if(document.fr.detailAddr.value === ""){
		  alert("상세주소를 입력해주세요");
		  return false;
	  }	  
  }//checkJoin() 
 */
  //findAddr() 주소값 저장 
  function findAddr(){
	 new daum.Postcode({
	 	oncomplete: function(data){	
	 		var extraAddr = ""; //참고항목 변수
	 		
	 		if(data.userSelectedType === "R"){ //도로명 주소 선택시
	 			document.fr.addr.value = data.roadAddress;
	 		}else{ //지번 주소 선택시
	 			document.fr.addr.value = data.jibunAddress;
	 		}
	 		
 	 		// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === "R"){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== "" && data.apartment === "Y"){
                    extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드(상세주소)에 넣는다.
                document.fr.detailAddr.value = extraAddr;            
            } else {
                document.fr.detailAddr.value = "";
            } 	 		           	 		
	  		document.fr.detailAddr.focus();//상세주소 입력칸으로 이동
	 	}
	 }).open();
	 return false;
  }//findAddr() 
 
 
  
   
   $(document).ready(function(){
	   
   	  var idFlag = false;
   	  var passFlag = false;
   	  var passChFlag = false;
   	  var nameFlag = false;
   	  var nicknameFlag = false;
   	  var ageFlag = false;
   	  //var genderFlag = false;
   	  var emailFlag = false;
	  
   	  // 입력받을 시 이벤트 	  				    
	  $('#input_id').on("propertychange change keyup paste input", function(){
		  checkId();	    //입력값이 바뀔때마다 실시간 감지
	  });	  
	  $('#input_pass').on("propertychange change keyup paste input", function(){
	  	  checkPass();
	  });	  	  
	  $('#input_same_pass').on("propertychange change keyup paste input", function(){		  
		  checkPassSame();
	  });	  	  
	  $('#input_name').on("propertychange change keyup paste input", function(){
		  checkName();
	  });	  	  
	  $('#sel_age').change(function(){
		  checkAge();
	  });
	  $('#input_nickname').on("propertychange change keyup paste input", function(){
		  checkNickname();
	  });	
	  $('#input_email').on("propertychange change keyup paste input", function(){
		  checkEmail();
	  });	
	  
	  	  
	  //회원가입 버튼(sbumit) 클릭 이벤트
 	  $('#join_btn').click(function(event){
		  if(!idFlag){
			  checkId();
			  $('#input_id').focus();
			  return false;
		  }else if(!passFlag){
			  checkPass();
			  $('#input_pass').focus();
			  return false;
		  }else if(!passChFlag){
			  checkPassSame();
			  $('#input_same_pass').focus();
			  return false;
		  }else if(!nameFlag){
			  checkName();
			  $('#input_name').focus();
			  return false;
		  }else if(!nicknameFlag){
			  checkNickname();
			  $('#input_nickname').focus();
			  return false;
		  }else if(!ageFlag){
			  checkAge();
			  $('#sel_age').focus();
			  return false;
		  }else if(!emailFlag){
			  checkEmail();
			  $('#input_email').focus();
			  return false;
		  }		  
	  });//회원가입 버튼(sbumit) 클릭 이벤트
	  
	  
	  //checkId()
	  function checkId(){
		  var id = $('#input_id').val();

		  $.ajax({
			  url:'./UserIdCheckAction.us',
			  type:'post',
			  data: {id : id},
			  dateType: 'json',
			  success:function(result){			 
				 // console.log(result); 
				if( !(4 <= id.length && id.length <= 10) ){
					//console.log("id if문 들어옴");
					$('#id_check_msg').attr('color','red');
					$('#id_check_msg').html("아이디는 4~10자리로 입력해주세요");
					idFlag = false;
				}else if(result === "ok"){ //아이디 중복안됨
					//console.log("사용가능한 아이디");
					$('#id_check_msg').attr('color','#054D95');
					$('#id_check_msg').html("사용가능한 아이디 입니다!");
					$('#input_id').removeAttr('required');
					idFlag = true;
				 }else{ //아이디 중복됨
					$('#id_check_msg').attr('color','red');
					$('#id_check_msg').html("이미 사용중인 아이디 입니다");
					idFlag = false;
					//$('#join_btn').prop("disabled", false);				  
				  }
			  },//success
			  error:function(){
				  alert("에러");
			  }
		  });
	  }//checkId()	  
	    
	  //checkPass()
	  function checkPass(){
		  var pass = $('#input_pass').val();	
		  var checkPass = $('#input_same_pass').val();
		  
		  if( !(6 <= pass.length && pass.length <= 12) ){
			  $('#pass_check_msg').attr('color','red');
			  $('#pass_check_msg').html("비밀번호는 6~12자리로 입력해주세요");
			  passFlag = false;
		  }else{
			  $('#pass_check_msg').attr('color','#054D95');
			  $('#pass_check_msg').html("사용가능한 비밀번호 입니다!");
			  passFlag = true;
		  }
		  
		  //비밀번호 수정시, 비밀번호 확인 상태도 변경
		  if(pass !== checkPass){
			  $('#pass_same_check_msg').attr('color','red');
			  $('#pass_same_check_msg').html("같은 비밀번호를 입력해주세요");
			  passChFlag = false;
		  }
	  }//checkPass()
	  	  
	  //checkPassSame()
	  function checkPassSame(){
		  var checkPass = $('#input_same_pass').val();
		  if( checkPass !== $('#input_pass').val() ){
			  $('#pass_same_check_msg').attr('color','red');
			  $('#pass_same_check_msg').html("같은 비밀번호를 입력해주세요");
			  passChFlag = false;
		  }else{
			  $('#pass_same_check_msg').attr('color','#054D95');
			  $('#pass_same_check_msg').html("비밀번호가 일치합니다!");
			  passChFlag = true;
		  }
	  }//checkPassSame()
	  
	  //checkName()
	  function checkName(){
		  var name = $('#input_name').val();
		  if( name === "" ){
			  //console.log("input_name if문 들어옴");
			  $('#name_check_msg').css('color','red');
			  $('#name_check_msg').html("이름을 입력해주세요");
			  $('#name_check_msg').show();
			  nameFlag = false;
		  }else{
			  $('#name_check_msg').hide();			
			  nameFlag = true;
		  }			  
	  }//checkName()
	  
	  //checkAge()	  
	  function checkAge(){
		  var age = $('#sel_age option:selected').val();
		  if(age === "noSel"){
			  $('#age_check_msg').css('color','red');
			  $('#age_check_msg').html("연령을 선택해주세요");
			  ageFlag = false
		  }else{
			  $('#age_check_msg').html("");
			  ageFlag = true;
		  }
	  }//checkAge()
	  	  
	  //checkNickname()
	  function checkNickname(){
		  var nickname = $('#input_nickname').val();
		  $.ajax({
			  url:'./UserNicknameCheckAction.us',
			  type:'post',
			  data: {nickname : nickname},
			  dateType: 'json',
			  success:function(result){			 
				 console.log(result); 
				if( !(2 <= nickname.length && nickname.length <= 8) ){
					//console.log("nickname if문 들어옴");
					$('#nickname_check_msg').attr('color','red');
					$('#nickname_check_msg').html("닉네임은 2~8자리로 입력해주세요");
					nicknameFlag = false;
				}else if(result === "ok"){ //닉네임 중복안됨
					$('#nickname_check_msg').attr('color','#054D95');
					$('#nickname_check_msg').html("사용가능한 닉네임 입니다!");
					$('#input_nickname').removeAttr('required');
					nicknameFlag = true;
				 }else{ //닉네임 중복됨
					$('#nickname_check_msg').attr('color','red');
					$('#nickname_check_msg').html("이미 사용중인 닉네임 입니다");
					nicknameFlag = false;			  
				  }
			  },//success
			  error:function(){
				  alert("에러");
			  }
		  });
	  }//checkNickname() 
	  
	  //checkEmail()
	  function checkEmail(){
		  var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
		  var email = $('#input_email').val();
		  $.ajax({
			  url:'./UserEmailCheckAction.us',
			  type:'post',
			  data: {email : email},
			  dateType: 'json',
			  success:function(result){			 
				 console.log(result);
				if(email === ""){
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("이메일 주소를 입력해주세요");
					emailFlag = false;
				}else if( !(reg.test(email)) ){
					//console.log("email if문 들어옴");
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("올바른 이메일 주소를 입력해주세요");
					emailFlag = false;
				}else if(result === "ok"){ //이메일 중복안됨
					$('#email_check_msg').attr('color','#054D95');
					$('#email_check_msg').html("사용가능한 이메일 입니다!");
					$('#email_check_msg').removeAttr('required');
					emailFlag = true;
				 }else{ //이메일 중복됨
					$('#email_check_msg').attr('color','red');
					$('#email_check_msg').html("이미 사용중인 이메일 입니다");
					emailFlag = false;			  
				  } 
				
			  },//success
			  error:function(){
				  alert("에러");
			  }
		  });
	  }//checkEmail() 
	  
  });
  
</script>
</body>
</html>
