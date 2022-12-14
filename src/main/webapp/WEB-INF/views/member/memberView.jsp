<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../style-somoim/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td,input {
	text-align: center;
}
#MpwTd,#Mnntd,#MphoneTd{
	width:178px;
}
</style>

</head>
<body>
	<div class="what-we-do we-padding">

		<div class="testimonial-area">
			<div class="container">
				<div class="testimonial-main">
					<!-- Section-tittle -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-5  col-md-8 pr-0">
							<div class="section-tittle text-center">
								<h2>내정보</h2>
							</div>
						</div>
					</div>
					<!-- founder -->
					<div
						class="testimonial-founder d-flex align-items-center justify-content-center">
						<div class="founder-img">
							<img alt="" src="resources/profileImg/${memberDTO.m_filename }">
						</div>
						<div class="founder-text">
							<span><h2>${memberDTO.m_nickname }님의 프로필</h2></span>
						</div>
					</div>
					<br><br>
					<div class="row d-flex justify-content-center">
						<div class="col-lg-10 col-md-9">
							<div class="h1-testimonial-active">
								<!-- Single Testimonial -->
								<div class="single-testimonial text-center">
									<div class="testimonial-caption ">
										<div class="testimonial-top-cap">
											<table style="margin:auto; padding:10px;">
												<tr>
													<td>아이디</td>
													<td><input type="text" value="${memberDTO.m_email }"
														id="inputMemail" readonly="readonly"></td>
												</tr>
												<tr id="MpwTr">
													<td>비밀번호</td>
													<td><input type="text"
														value="${memberDTO.m_password }" id="inputMpassword"
														readonly="readonly"></td> 
													<td id="MpwTd"><a href="#" class="genric-btn link circle"
														id="mpasswordUpdateBtn" onclick="mpasswordUpdate()">수정</a></td>
												</tr>
												<tr id="MnnTr">
													<td>닉네임</td>
													<td><input type="text"
														value="${memberDTO.m_nickname }" id="inputMnickname"
														readonly="readonly"></td>
													<td id="MnnTd"><a href="#" class="genric-btn link circle"
														id="mnicknameUpdateBtn" onclick="mnicknameUpdate()">수정</a></td>
												</tr>
												<tr>
													<td>이름</td>
													<td><input type="text" value="${memberDTO.m_name }"
														id="inputMname" readonly="readonly"></td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td><input type="text" value="${memberDTO.m_birth }"
														id="inputMbirth" readonly="readonly"></td>
												</tr>
												<tr id="MphoneTr">
													<td>전화번호</td>
													<td><input type="text" value="${memberDTO.m_phone }"
														id="inputMphone" readonly="readonly"></td>
													<td id="MphoneTd"><a href="#" class="genric-btn link circle"
														id="mphoneUpdateBtn" onclick="mphoneUpdate()">수정</a></td>
												</tr>
												<tr>
													<td style="vertical-align: middle;">프로필사진</td>
													<td><img alt="프로필사진"
														src="resources/profileImg/${memberDTO.m_filename }"
														style="width: 300px; height: 200px;"></td>
												</tr>
												<tr>
													<td colspan="2"><a href="/controller">메인으로</a> <input
														type="button" value="회원탈퇴"
														onclick="location.href='memberDelete?m_email=${memberDTO.m_email}'">
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../style-somoim/footer.jsp"%>
	<script type="text/javascript">
		/* 비밀번호 변경 a.jax */
		function mpasswordUpdate() {
			console.log("mpasswordUpdate() 실행");
			var output = "<td id='MpwTd'><a href='#' class='mpasswordUpdateCheck genric-btn info circle' onclick='mpasswordUpdateCheck(true)'>확인</a>";
			output += "<a href='#' class='mpasswordUpdateCheck genric-btn danger circle' onclick='mpasswordUpdateCheck(false)'>취소</a></td>";

			$("#inputMpassword").removeAttr("readonly");
			$("#MpwTd").remove();
			$("#MpwTr").append(output);
		}

		function mpasswordUpdateCheck(check) {
			console.log("mpasswordUpdateCheck() ::" + check);

			if (check) {
				var memail = '${memberDTO.m_email }';
				var newMpassword = $("#inputMpassword").val();

				var mpassword = '${memberDTO.m_password }';

				console.log(memail + ":::" + newMpassword);
				$.ajax({
					type : "post",
					url : "mpasswordUpdate",
					data : {
						"m_email" : memail,
						"m_password" : newMpassword,
					},
					dataType : "text",
					success : function(updateResult) {
						if (updateResult == "OK") {
							alert("비밀번호 변경 성공");
						} else {
							alert("변경 실패");
							$("#inputMpassword").val(mpassword);
						}

					},
					error : function() {
						alert("mpasswordUpdate 연결 실패");
						$("#inputMpassword").val(mpassword);
					}
				});
			}
			var output = "<td id='MpwTd'><a href='#' id='mpasswordUpdateBtn' class='genric-btn link circle' onclick='mpasswordUpdate()'>수정</a></td>";
			$("#inputMpassword").attr("readonly", "readonly");
			$("#MpwTd").remove();
			$("#MpwTr").append(output);
		}

		/* 닉네임 변경 a.jax */
		function mnicknameUpdate() {
			console.log("mnicknameUpdate() 실행");
			var output = "<td id='MnnTd'><a href='#' class='mnicknameUpdateCheck genric-btn info circle' onclick='mnicknameUpdateCheck(true)'>확인</a>";
			output += "<a href='#' class='mnicknameUpdateCheck genric-btn danger circle' onclick='mnicknameUpdateCheck(false)'>취소</a></td>";

			$("#inputMnickname").removeAttr("readonly");
			$("#MnnTd").remove();
			$("#MnnTr").append(output);
		}

		function mnicknameUpdateCheck(check) {
			console.log("mnicknameUpdateCheck() ::" + check);

			if (check) {
				var memail = '${memberDTO.m_email }';
				var newMnickname = $("#inputMnickname").val();

				var mnickname = '${memberDTO.m_nickname }';

				console.log(memail + ":::" + newMnickname);
				$.ajax({
					type : "post",
					url : "mnicknameUpdate",
					data : {
						"m_email" : memail,
						"m_nickname" : newMnickname,
					},
					dataType : "text",
					success : function(updateResult) {
						if (updateResult == "OK") {
							alert("닉네임 변경 성공");
						} else {
							alert("변경 실패");
							$("#inputMnickname").val(mnickname);
						}

					},
					error : function() {
						alert("mnicknameUpdate 연결 실패");
						$("#inputMnickname").val(mnickname);
					}
				});
			}
			var output = "<td id='MnnTd'><a href='#' id='mnicknameUpdateBtn' class='genric-btn link circle' onclick='mnicknameUpdate()'>수정</a></td>";
			$("#inputMnickname").attr("readonly", "readonly");
			$("#MnnTd").remove();
			$("#MnnTr").append(output);
		}

		/* 전화번호 변경 a.jax */
		function mphoneUpdate() {
			console.log("mphoneUpdate() 실행");
			var output = "<td id='MphoneTd'><a href='#' class='mphoneUpdateCheck genric-btn info circle' onclick='mphoneUpdateCheck(true)'>확인</a>";
			output += "<a href='#' class='mphoneUpdateCheck genric-btn danger circle' onclick='mphoneUpdateCheck(false)'>취소</a></td>";

			$("#inputMphone").removeAttr("readonly");
			$("#MphoneTd").remove();
			$("#MphoneTr").append(output);
		}

		function mphoneUpdateCheck(check) {
			console.log("mphoneUpdateCheck() ::" + check);

			if (check) {
				var memail = '${memberDTO.m_email }';
				var newMphone = $("#inputMphone").val();

				var mphone = '${memberDTO.m_phone }';

				console.log(memail + ":::" + newMphone);
				$.ajax({
					type : "post",
					url : "mphoneUpdate",
					data : {
						"m_email" : memail,
						"m_phone" : newMphone,
					},
					dataType : "text",
					success : function(updateResult) {
						if (updateResult == "OK") {
							alert("전화번호 변경 성공");
						} else {
							alert("변경 실패");
							$("#inputMphone").val(mphone);
						}

					},
					error : function() {
						alert("mphoneUpdate 연결 실패");
						$("#inputMphone").val(mphone);
					}
				});
			}
			var output = "<td id='MphoneTd'><a href='#' id='mphoneUpdateBtn' class='genric-btn link circle' onclick='mphoneUpdate()'>수정</a></td>";
			$("#inputMphone").attr("readonly", "readonly");
			$("#MphoneTd").remove();
			$("#MphoneTr").append(output);
		}
	</script>
</body>

</html>