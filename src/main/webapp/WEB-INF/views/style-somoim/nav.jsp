<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
   MegaCorp by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>SOMOIM </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="${pageContext.request.contextPath}/resources/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/animated.headline.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${pageContext.request.contextPath}/resources/js/contact.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
   </head>

   <body>
       
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <p>『somoim』</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
       <div class="header-area header-transparrent ">
            <div class="main-header header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-2 col-lg-2 col-md-1">
                            <div class="logo">
                                <a href="/controller"><h1>somoim</h1></a>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-3">
                            
                        </div>
                        <div class="col-xl-8 col-lg-8 col-md-8">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav> 
                                    <ul id="navigation">  
                                  	  <c:choose>
										<c:when test="${sessionScope.m_email eq null }">  
                                       	    <li><a href="joinForm">회원가입</a></li>
											<li><a href="loginForm">로그인</a></li>
										</c:when>
									  <c:otherwise>
                                        <c:if test="${sessionScope.m_nickname=='관리자'}">
											<li><a href="masterpage">관리자 페이지</a>
												<ul class="submenu">
													<li><a href="memberList">회원 목록</a></li>
													<li><a href="somoimList">게시물 목록</a></li>
													<li><a href="categoryList">메인 카테고리 목록</a></li>
													<li><a href="subcategory">서브 카테고리 목록</a></li>
													<li><a href="masmessageList">메세지 목록</a></li>
													<li><a href="masapplyList">신청 목록</a></li>
												</ul>
											</li>
										</c:if>
                                        <li><a href="#">모임목록</a>
                                            <ul class="submenu">
                                                <li><a href="boardWriteForm?">모임글쓰기</a></li>
												<li><a href="boardList">모임목록</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">내정보</a>
                                            <ul class="submenu">
                                                <li><a href="memberView?m_email=${sessionScope.m_email}">내정보</a></li>
                                                <li><a href="MyboardList?b_memail=${sessionScope.m_email}">내가 만든 모임</a></li>
												<li><a href="MyapplyList?a_memail=${sessionScope.m_email}">내가 가입한 모임</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="memberLogout">로그아웃</a></li>
                                        </c:otherwise>
								    	</c:choose>    
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
       <main>
