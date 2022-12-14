<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../style-somoim/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>로그인</title>


</head>
<body>
 <div class="what-we-do we-padding">
		<div class="slider-area ">
			<div class="slider-active">
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
			</div>
		</div>
	</div>
  <%@ include file="../style-somoim/footer.jsp" %>
<script type="text/javascript">
	function check() {

		var f = document.Reg_form;

		if (f.m_email.value == "") {
			alert("아이디를 입력해주십시오");
			f.m_email.focus();
			return false;
		}

		if (f.m_password.value == "") {
			alert("비밀번호를 입력해주십시오");
			f.m_password.focus();

			return false;
		}
	}
</script>