<%@ include file="../style-somoim/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<style>
td,input {
	text-align: center;
}
table,tr,td,th{
	padding:5px;
	margin:auto;
}
</style>
<div class="what-we-do we-padding">

		<div class="testimonial-area">
			<div class="container">
				<div class="testimonial-main">
					<!-- Section-tittle -->
					<div class="row d-flex justify-content-center">
						<div class="col-lg-5  col-md-8 pr-0">
							<div class="section-tittle text-center">
								<h2>boardView</h2>
							</div>
						</div>
					</div>
					<!-- founder -->
					<div
						class="testimonial-founder d-flex align-items-center justify-content-center">
						<div class="founder-img">
							<img src="${pageContext.request.contextPath}/resources/profileImg/${bList.b_filename}" alt="">
						</div>
						<div class="founder-text">
							<span><h2>${bList.b_title } 모임</h2></span>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col-lg-10 col-md-9">
							<div class="h1-testimonial-active">
								<!-- Single Testimonial -->
								<div class="single-testimonial text-center">
									<div class="testimonial-caption ">
										<div class="testimonial-top-cap">
											<table>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="b_mnickname" readonly="readonly" class="single-input"
			value="${boardDTO.b_mnickname }"></td>
	</tr>
	<tr>
		<td><label for="inputBtitle" id="btitleLabel"></label>제목</td>
		<td><input type="text" name="b_title" id="inputBtitle"  class="single-input"
			readonly="readonly" value="${boardDTO.b_title }"> <c:if
				test="${boardDTO.b_mnickname == sessionScope.m_nickname}">
				<a href="#" id="btitleUpdateBtn" onclick="btitleUpdate()">수정</a>
			</c:if></td>
	</tr>
	<tr>
		<td><label for="inputBcontent" id="bcontentLabel"></label>내용</td>
		<td><textarea cols="40" rows="10" name="b_content"  class="single-input"
				id="inputBcontent" readonly="readonly">${boardDTO.b_content }</textarea>
			<c:if test="${boardDTO.b_mnickname == sessionScope.m_nickname}">
				<a href="#" id="bcontentUpdateBtn" onclick="bcontentUpdate()">수정</a>
			</c:if>
	<tr>
		<td>모임시간</td>
		<td><input type="text" name="b_date" readonly="readonly"  class="single-input"
			value="${boardDTO.b_date }"></td>
	</tr>
	<tr>
		<td>사진</td>
		<td><img
			src="${pageContext.request.contextPath}/resources/profileImg/${boardDTO.b_filename}"
			style="width: 300px; height: 200px;"></td>
	</tr>
	<tr>
		<td colspan="2"><c:choose>
				<c:when test="${boardDTO.b_mnickname != sessionScope.m_nickname}">
					<button class="genric-btn primary circle"
						onclick="location.href='boardList'">목록으로</button>
					<button class="genric-btn info circle"
						onclick="applyWriteForm('${boardDTO.b_code }')">모임신청</button>
					
				</c:when>
			</c:choose> <c:if test="${boardDTO.b_mnickname == sessionScope.m_nickname}">
			<button class="genric-btn primary circle"
					onclick="location.href='boardList'">목록으로
				</button>
				<button class="genric-btn danger circle"
					onclick="location.href='boardDelete?b_code=${boardDTO.b_code }'">글삭제
				</button>
			</c:if></td>
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

 <div class="footer-main" data-background="${pageContext.request.contextPath}/resources/img/shape/footer_bg.png" style="background-image:url("${pageContext.request.contextPath}/resources/img/shape/footer_bg.png");">
		 <div class="footer-area footer-padding">
<%@ include file="../style-somoim/footer.jsp"%>
</div>
</div>
<script type="text/javascript">
	function applyWriteForm(b_code) {
		var memail = '${sessionScope.m_email}';
		console.log("applyWriteForm");
		console.log("memail ::" + memail);
		if (memail == '') {
			alert("로그인후 이용 가능합니다");
			location.href = "loginForm";
		} else {
			location.href = "applyWriteForm?a_bcode=" + b_code;
		}
	}

	function btitleUpdate() {
		console.log("btitleUpdate() 실행");
		var output = "<a href='#' class='btitleUpdate' onclick='btitleUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='btitleUpdate' onclick='btitleUpdateCheck(false)'>취소</a>";

		$("#inputBtitle").removeAttr("readonly").after(output);
		$("#btitleUpdateBtn").remove();
	}

	function btitleUpdateCheck(check) {
		console.log("btitleUpdateCheck ::" + check);

		if (check) {
			var b_code = '${boardDTO.b_code}';
			var newBtitle = $("#inputBtitle").val();
			var b_title = '${boardDTO.b_title}';
			console.log(b_code + "::" + newBtitle);

			$.ajax({
				type : "post",
				url : "btitleUpdate",
				data : {
					"b_code" : b_code,
					"b_title" : newBtitle,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("제목 변경 완료");
					} else {
						alert("변경 실패");
						$("#inputBtitle").val(b_title);
					}
				},
				error : function() {
					alert("변경실패");
					$("#inputBtitle").val(b_title);
				}
			});
		}
		var output = " <a href='#' id='btitleUpdateBtn' onclick='btitleUpdate()'>수정</a>";
		$("#inputBtitle").attr("readonly", "readonly");
		$("#inputBtitle").after(output);
		$(".btitleUpdate").remove();
	}

	function bcontentUpdate() {
		console.log("bcontentUpdate() 실행");
		var output = "<a href='#' class='bcontentUpdate' onclick='bcontentUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='bcontentUpdate' onclick='bcontentUpdateCheck(false)'>취소</a>";

		$("#inputBcontent").removeAttr("readonly").after(output);
		$("#bcontentUpdateBtn").remove();
	}

	function bcontentUpdateCheck(check) {
		console.log("bcontentUpdateCheck ::" + check);

		if (check) {
			var b_code = '${boardDTO.b_code}';
			var newBcontent = $("#inputBcontent").val();
			var b_content = '${boardDTO.b_content}';
			console.log(b_code + "::" + newBcontent);

			$.ajax({
				type : "post",
				url : "bcontentUpdate",
				data : {
					"b_code" : b_code,
					"b_content" : newBcontent,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("내용 변경 완료");
					} else {
						alert("변경 실패");
						$("#inputBcontent").val(b_content);
					}
				},
				error : function() {
					alert("변경실패");
					$("#inputBcontent").val(b_content);
				}
			});
		}
		var output = " <a href='#' id='bcontentUpdateBtn' onclick='bcontentUpdate()'>수정</a>";
		$("#inputBcontent").attr("readonly", "readonly");
		$("#inputBcontent").after(output);
		$(".bcontentUpdate").remove();
	}
</script>
