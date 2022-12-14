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
		<h1>신청 리스트</h1>
		<c:forEach var="aList" items="${applyDTO }">
			<hr>
			<div style="width: 1000px; height: 130px; border: 1px solid black;">
				<div style="float: left; width: 20px; height: 100%;">
					<div>${aList.a_code }</div>

				</div>
				<div style="float: left; width: 300px; height: 100%;">

					<div>신청한 게시물코드:${aList.a_bcode }</div>
					<div>신청닉네임:${aList.a_mnickname}</div>
					<div>신청아이디:${aList.a_memail}</div>
					<div>보낸 시간:${aList.a_date }</div>
					<div>확인 :${aList.a_check }</div>

				</div>
				
				<div style="float: left; width: 500px; height: 100%;">
					글내용<br>
					<textarea style="overflow: auto; width: 100%; height: 100px"
						readonly="readonly">${aList.a_content}</textarea>

				</div>
				<div style="float: right; width: 150px; height: 100%;">
					<a href="applyDelete?a_code=${aList.a_code}&page=${pageDTO.page}">삭제</a><br>
					<br>
					<a type="button" href="masappMassage?a_memail=${aList.a_memail}&a_code=${aList.a_code }&page=${pageDTO.page}">경고메세지</a>
				</div>
			</div>

		</c:forEach>
		<hr>
		<div>
			<div style="float: left;">
				<button type="button" onclick="location.href='masapplyList'">전체목록</button>
				<button type="button" onclick="location.href='masterpage'">관리자메인페이지</button>
			</div>
			<div style="float: left;">
				<form action="masapplyList">
					<input type="text" name="keyword" placeholder="닉네임,내용"> <input
						type="submit" value="검색">
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
								href="masapplyList?page=${pageDTO.page-1}&keyword=${pageDTO.keyword}">이전</a>

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
									href="masapplyList?page=${pageNum }&keyword=${pageDTO.keyword}">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageDTO.page < pageDTO.maxpage }">

							<a
								href="masapplyList?keyword=${pageDTO.keyword}&page=${pageDTO.page+1}">다음</a>

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