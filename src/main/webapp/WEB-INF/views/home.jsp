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
                                                <li><a href="memberView?m_email=${sessionScope.m_email}">프로필</a></li>
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

        <!-- Slider Area Start-->
        <div class="slider-area ">
            <div class="slider-active">
                <div class="single-slider slider-height d-flex align-items-center" data-background="assets/img/hero/h1_hero.png">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-7 col-md-9 ">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay=".4s" style="text-align:center">어떤모임을<br>찾으시나요?</h1><br>
                                    	<div style="width:370px; height:185px; margin:0 auto;">
                                    	<form action="searchinfo" method="post">
											<div class="form-group">
												<div class="input-group mb-3">
													<input type="text" class="form-control" placeholder="어떤 모임을 찾으시나요?" onfocus="this.placeholder = ''"
														class="searchbarinput" type="text" name="keyWord" onblur="this.placeholder = '어떤 모임을 찾으시나요?'"
														style="height:59px;">
													<div class="input-group-append">
														<button class="genric-btn info" type="submit" style="height:59px;">
															<i class="ti-search"></i>
														</button>
													</div>
												</div>
											</div>
											<button
												class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
												type="submit">Search</button>
										</form>
										</div>
									
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="hero__img d-none d-lg-block" data-animation="fadeInRight" data-delay="1s">
                                    <img src="${pageContext.request.contextPath}/resources/img/hero/hero_right.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <c:choose>
				<c:when test="${sessionScope.m_email eq null }">  
                <div class="single-slider slider-height d-flex align-items-center" data-background="${pageContext.request.contextPath}/resources/img/hero/h1_hero.png">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-7 col-md-9 ">
                                <div class="hero__caption">
                                   <h1 data-animation="fadeInLeft" data-delay=".4s" style="text-align:center">로그인</h1>
                                   <div style="width:370px; height:185px; margin:0 auto;">
									<form action="memberLogin" method="post" name="Reg_form"
										onsubmit="return check()">
										<table style="width:450px;">
									 		<tr>
												<td><h5>이메일</h5></td>
												<td><input type="email" name="m_email" id="m_email"
													placeholder="이메일을 입력해주세요"></td>
												<td rowspan="2"><input
													type="submit" class="genric-btn primary circle" value="로그인"></td>
											</tr>
											<tr>
												<td><h5>비밀번호</h5></td>
												<td><input type="password" name="m_password"
													id="m_password" placeholder="비밀번호를 입력해주세요"></td>
											</tr>
											<tr>
												<td colspan="3" style="text-align:center;">
													<input type="button" class="genric-btn link circle" onclick="location.href='joinForm'" value="회원가입">
													<input type="button" class="genric-btn link circle" onclick="location.href='passwordSearch'" value="비밀번호 찾기">
												</td>
											</tr>
										</table>
									</form>
									</div>
								</div>
                            </div>
                            <div class="col-lg-5">
                                <div class="hero__img d-none d-lg-block" data-animation="fadeInRight" data-delay="1s">
                                    <img src="${pageContext.request.contextPath}/resources/img/hero/hero_right.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:when>
                <c:otherwise>
                <div class="single-slider slider-height d-flex align-items-center" data-background="${pageContext.request.contextPath}/resources/img/hero/h1_hero.png">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-7 col-md-9 ">
                                <div class="hero__caption">
                                   <h1 data-animation="fadeInLeft" data-delay=".4s" style="text-align:center">${sessionScope.m_email}님 환영합니다.</h1>
									
								</div>
                            </div>
                            <div class="col-lg-5">
                                <div class="hero__img d-none d-lg-block" data-animation="fadeInRight" data-delay="1s">
                                    <img src="${pageContext.request.contextPath}/resources/img/hero/hero_right.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Slider Area End-->
        <!-- What We do start-->
        <div class="what-we-do we-padding">
            <div class="container">
                <!-- Section-tittle -->
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="section-tittle text-center">
                            <h2>원하는 모임을 쉽게 <br> 찾을 수 있습니다.​</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6" style=" margin: 0px auto;">
                        <div class="single-do text-center mb-30">
                            <div class="do-icon">
                                <span  class="flaticon-tasks"></span>
                            </div>
                            <div class="do-caption">
                                <h4>어떤모임을 원하시나요?</h4>
                                <div id="CategoryArea">
						<table id="CategoryTable" style="margin:0 auto">
							<thead id="CategoryThead">
								
							</thead>

							<tbody id="CategoryTbody">

							</tbody>

							<tfoot id="CategoryTfoot">
								<tr>
									<td><span id="CategoryCheckMsg" style="display: none;">
											선택해주세요. </span></td>
								</tr>
							</tfoot>
						</table>
					</div>
                            </div>
                            
                        </div>
                    </div>

                     <div class="col-lg-6 col-md-6" style=" margin: 0px auto; ">
                        <div class="single-do text-center mb-30" style="height:500px;">
                            <div class="do-icon">
                                <span  class="flaticon-project"></span>
                            </div>
                             <div class="do-caption" style="float:left; text-align: left;">
                                <h4>조회수 많은 모임</h4>
								<div id="upHitArea">
								
								</div>
                            </div>
                            <div class="do-caption" style="float:right; text-align: left;">
                                <h4>회원수 많은 모임</h4>
								<div id="upPeopleArea">
									
								</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- What We do End-->
 

    </main>
 

   
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
        <%@ include file="./style-somoim/footer.jsp"%>
    </body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {

				console.log("upPeople실행");
				$.ajax({
					type : "post",
					url : "upPeople",
					data : {

					},
					dataType : "json",
					success : function(upPeopleList) {
						console.log("upPeopleList :::" + upPeopleList);
						printPeopleList(upPeopleList);
					},
					error : function() {
						alert("upPeople 연결실패");
					}
				});

				function printPeopleList(upPeopleList) {
					console.log("printPeopleList실헹");
					var output = '';
					var upPeopleCount = upPeopleList.length;
					output += "<ul class='unordered-list'>";
					for ( var i in upPeopleList) {
						if (i < 6) {
							var b_title = upPeopleList[i].b_title;
							var b_code = upPeopleList[i].b_code;
							console.log("b_title :" + b_title + "b_code ::"
									+ b_code);
							output += "<a href='boardView?b_code=" + b_code + "'><li style='margin-bottom:10px;'><p1 style='color:blue;'>" + b_title + "</p1></li></a>";
						}
					}
					output +="</ul>";
					$("#upPeopleArea").html(output);
					/*  $("#upHitListCount").text(upHitListCount); */
				}
			});

</script>


<script type="text/javascript">
	$(document).ready(
			function() {

				console.log("upHitList실행");
				$.ajax({
					type : "post",
					url : "upHitList",
					data : {

					},
					dataType : "json",
					success : function(upHitList) {
						console.log("upHitList :::" + upHitList);
						printHitList(upHitList);
					},
					error : function() {
						alert("upHitList 연결실패");
					}
				});

				function printHitList(upHitList) {
					console.log("printHitList실행");
					var output = '';
					var upHitListCount = upHitList.length;
					output += "<ul class='unordered-list'>";
					for ( var i in upHitList) {
						if (i < 6) {
							var b_title = upHitList[i].b_title;
							var b_code = upHitList[i].b_code;
							console.log("b_title :" + b_title + "b_code ::"+ b_code);
							output += "<a href='boardView?b_code=" + b_code + "'><li style='margin-bottom:10px;'><p1 style='color:blue;'>" + b_title + "</p1></li></a>";
						}
					}
					output += "</ul>";
					$("#upHitArea").html(output);
					/*  $("#upHitListCount").text(upHitListCount); */
				}

			});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		console.log("getMaincategoryList실행");
		Maincategory();
	});

	function Maincategory() {
		$.ajax({
			type : "post",
			url : "getMaincategoryList",
			data : {

			},
			dataType : "json",
			success : function(getMaincategoryList) {
				console.log("getMaincategoryList :::" + getMaincategoryList);
				printMainCategoryList(getMaincategoryList);
			},
			error : function() {
				alert("연결실패");
			}
		});
	}
	function printMainCategoryList(getMaincategoryList) {
		console.log("printMainCategoryList 실행");
		output = '';
		var MainCategoryCount = getMaincategoryList.lenght;
		for ( var i in getMaincategoryList) {
			var mc_code = getMaincategoryList[i].mc_code;
			var mc_name = getMaincategoryList[i].mc_name;
			console.log("mc_code : " + mc_code + " // mc_name : " + mc_name);
			output += "<tr class='CategoryTr'><td>" + mc_name + "</td>";
			output += "<td><input type='checkbox' name='mc_code' value="+mc_code+"></td>";
			output += "</tr>";
		}
		output1 = "<tr><td><h4>메인카테고리 선택</h4></td></tr>";
		output2 = "<br><input type='button' onclick='getSubCategoryList()' class='Categorybtn genric-btn primary circle arrow' value='다음'>";
		$(".CategoryTr2").remove();
		$(".CategoryTr3").remove();
		$(".Categorybtn").remove();
		$("#CategoryThead").html(output1);
		$("#CategoryTbody").append(output);
		$("#CategoryTfoot").append(output2);
	}

	function getSubCategoryList() {
		var mc_codeList = document.getElementsByName("mc_code");
		for ( var i in mc_codeList) {
			if (mc_codeList[i].checked == true) {
				console.log(mc_codeList[i].value);
				$.ajax({
					type : "post",
					url : "getSubCategoryList",
					data : {
						"sc_mccode" : mc_codeList[i].value
					},
					dataType : "json",
					success : function(getSubcategoryList) {
						console.log("getSubcategoryList :::"
								+ getSubcategoryList);
						printSubCategoryList(getSubcategoryList);
					},
					error : function() {
						alert("연결실패");
					}

				});
			} else {
				$("#CategoryCheckMsg").removeAttr("style").css("color", "red");
			}
		}
	}

	function printSubCategoryList(getSubcategoryList) {
		console.log("printSubCategoryList 실행");
		output = '';
		var SubCategoryCount = getSubcategoryList.lengh;
		for ( var i in getSubcategoryList) {
			var sc_code = getSubcategoryList[i].sc_code;
			var sc_name = getSubcategoryList[i].sc_name;
			console.log("sc_code : " + sc_code + " // sc_name : " + sc_name);
			output += "<tr class='CategoryTr2'>";
			output += "<td>" + sc_name + "</td>";
			output += "<td><input type='checkbox' name='sc_code' value="+sc_code+"></td>";
			output += "</tr>";
		}
		output1 = "<tr><td><h4>서브카테고리 선택</h4></td></tr>";
		output2 = "<input type='button' onclick='Maincategory()' class='Categorybtn genric-btn primary circle arrow' value='처음으로'>";
		output2 += "<input type='button' onclick='getBoardAddrList()' class='Categorybtn genric-btn primary circle arrow' value='다음'>";
		$("#CategoryCheckMsg").css("display", "none");
		$(".CategoryTr").remove();
		$("#CategoryTbody").append(output);
		$(".Categorybtn").remove();
		$("#CategoryTfoot").append(output2);
		$("#CategoryThead").html(output1);
	}

	function getBoardAddrList() {
		console.log("getBoardAddrList() 실행");
		var sc_codeList = document.getElementsByName("sc_code");
		for ( var i in sc_codeList) {
			if (sc_codeList[i].checked == true) {
				console.log(sc_codeList[i].value);
				$.ajax({
					type : "post",
					url : "getBoardAddrList",
					data : {
						"b_sccode" : sc_codeList[i].value
					},
					dataType : "json",
					success : function(getBoardAddrList) {
						console.log("getBoardAddrList :::" + getBoardAddrList);
						printBoardAddrList(getBoardAddrList);
					},
					error : function() {
						alert("연결실패");
					}
				});
			} else {
				$("#CategoryCheckMsg").removeAttr("style").css("color", "red");
			}
		}
	}

	function printBoardAddrList(getBoardAddrList) {
		console.log("printBoardAddrList 실행");
		output = '';
		for ( var i in getBoardAddrList) {
			var b_sccode = getBoardAddrList[i].b_sccode;
			var b_region = getBoardAddrList[i].b_region;
		}
		output = '';
		output += "<tr class='CategoryTr3'><td>서울특별시</td><td><input type='radio' name='b_region' value='서울특별시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>부산광역시</td><td><input type='radio' name='b_region' value='부산광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>대구광역시</td><td><input type='radio' name='b_region' value='대구광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>인천광역시</td><td><input type='radio' name='b_region' value='인천광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>광주광역시</td><td><input type='radio' name='b_region' value='광주광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>대전광역시</td><td><input type='radio' name='b_region' value='대전광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>울산광역시</td><td><input type='radio' name='b_region' value='울산광역시'></td></tr>";
		output += "<tr class='CategoryTr3'><td>경기도</td><td><input type='radio' name='b_region' value='경기도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>강원도</td><td><input type='radio' name='b_region' value='강원도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>충청북도</td><td><input type='radio' name='b_region' value='충청북도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>충청남도</td><td><input type='radio' name='b_region' value='충청남도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>전라북도</td><td><input type='radio' name='b_region' value='전라북도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>전라남도</td><td><input type='radio' name='b_region' value='전라남도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>경상북도</td><td><input type='radio' name='b_region' value='경상북도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>경상남도</td><td><input type='radio' name='b_region' value='경상남도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>제주특별자치도</td><td><input type='radio' name='b_region' value='제주특별자치도'></td></tr>";
		output += "<tr class='CategoryTr3'><td>세종특별자치도</td><td><input type='radio' name='b_region' value='세종특별자치도'></td></tr>";
		output1 = "<tr><td><h4>지역 선택</h4></td></tr>";
		output2 = "<input type='button' onclick='Maincategory()' class='Categorybtn genric-btn primary circle arrow' value='처음으로'/>";
		output2 += "<input type='button' onclick='finalList(\"" + b_sccode
				+ "\",\"" + b_region
				+ "\")'  class='Categorybtn genric-btn primary circle arrow' value='다음'/>";
		console.log("b_sccode ::" + b_sccode + "b_region ::" + b_region);
		$("#CategoryCheckMsg").css("display", "none");
		$(".CategoryTr2").remove();
		$("#CategoryTbody").html(output);
		$(".Categorybtn").remove();
		$("#CategoryTfoot").append(output2);
		$("#CategoryThead").html(output1);
	}

	function finalList(b_sccode, b_region) {
		var int_sccode = parseInt(b_sccode);
		console.log("finalList");
		console.log("b_sccode :" + int_sccode + " b_region : " + b_region);
		location.href = "finalList?b_sccode=" + int_sccode + "&b_region="
				+ b_region;

	}
</script>