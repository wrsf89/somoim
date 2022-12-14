<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td, th {
	border: 1px solid black;
}
</style>
</head>
<body>


	<div>
		<h1>메세지 리스트</h1>
		<c:forEach var="msgdto" items="${msgdto }">
			<hr>
			<div style="width: 1000px; height: 150px; border: 1px solid black;">
				<div style="float: left; width: 20px; height: 100%;">
					<div>${msgdto.msg_code }</div>

				</div>
				<div style="float: left; width: 300px; height: 100%;">
					<div>메세지 번호 :${msgdto.msg_code }</div>
					<div>보낸는 사람:${msgdto.msg_sendid }</div>
					<div>보내는 아이디:${msgdto.msg_memail}</div>
					<div>빋는 아이디:${msgdto.msg_receiveid }</div>
					<div>보낸 시간:${msgdto.msg_date }</div>
					<div>확인 :${msgdto.msg_check }</div>

				</div>

				<div style="float: left; width: 500px; height: 100%;">
					글내용<br>
					<textarea style="overflow: auto; width: 100%; height: 120px"
						readonly="readonly">${msgdto.msg_content}</textarea>

				</div>
				<div style="float: right; width: 150px; height: 100%;">
					<a
						href="masmsgDelete?msg_code=${msgdto.msg_code }&page=${pageDTO.page}&keyword=${pageDTO.keyword}">삭제</a><br>
					<a href="masmsgmemlist?msg_memail=${msgdto.msg_memail}">작성자의
						메세지</a><br>
					<a type="button" href="masMsgMassage?msg_memail=${msgdto.msg_memail}&msg_code=${msgdto.msg_code }&page=${pageDTO.page}">경고메세지</a>
				</div>
			</div>

		</c:forEach>
		<hr>
		<div>
			<div style="float: left;">
				<button type="button" onclick="location.href='masmessageList'">전체목록</button>
				<button type="button" onclick="location.href='masterpage'">관리자메인페이지</button>
			</div>
			<div style="float: left;">
				<form action="masmessageList">
					<input type="text" name="keyword" placeholder="이메일,닉네임,이름,내용">
					<input type="submit" value="검색">
				</form>
			</div>

			<div style="float: right">
				<ul>

					<c:choose>
						<c:when test="${pageDTO.page<=1 }">
							<a href="#">이전</a>
						</c:when>
						<c:when test="${pageDTO.page>1 }">

							<a
								href="masmessageList?page=${pageDTO.page-1}&keyword=${pageDTO.keyword}">이전</a>

						</c:when>
					</c:choose>

					<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
						step="1" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == pageDTO.page}">
								<a href="#">${pageNum }</a>
							</c:when>
							<c:otherwise>
								<a
									href="masmessageList?page=${pageNum }&keyword=${pageDTO.keyword}">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageDTO.page < pageDTO.maxpage }">

							<a
								href="masmessageList?keyword=${pageDTO.keyword}&page=${pageDTO.page+1}">다음</a>

						</c:when>
						<c:when test="${pageDTO.page >= pageDTO.maxpage}">
							<a href="#">다음</a>
						</c:when>
					</c:choose>


				</ul>
			</div>
		</div>

	</div>




</body>
</html>