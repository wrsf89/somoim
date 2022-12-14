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
		<c:forEach var="bList" items="${moimList }">
			<hr>
				<div style="width: 1000px ;height: 220px">
					<div style="float: left; width: 20%; height: 100%;">
						<div>${bList.b_code }</div>				
						<div><c:if test="${bList.b_filename != null}">
							<img src="resources/images/${bList.b_filename }" >
						</c:if></div>
					</div>				
					<div style="float: left; width: 20%; height: 100%;">
					<div>메인카테고리 :${bList.b_mccode}</div>
					<div>서브카테고리 :${bList.b_sccode}</div>
					<div>제목 :${bList.b_title}</a></div>
					<div>작성자 :${bList.b_mnickname }</a></div>
					<div>아이디 :${bList.b_memail }</div>
					<div>모임지역 :${bList.b_addr }</div>
					<div>모임시간 :${bList.b_date }</div>
					<div>모임인원 :${bList.b_people }</div>
					<div>조회수 : ${bList.b_hit }</div>
					</div>
					<div style="float: left; width: 49%; height: 100%;">
					글내용<br>
					<textarea style="overflow: auto; width: 100%; height: 190px"
						readonly="readonly">${bList.b_content}</textarea>
					
					</div>
					<div style="float: right; width: 10%; height: 100%;"><a type="button" href="masboardDelete?b_code=${bList.b_code }">삭제</a><br>
						<a href="masbodmemlist?b_memail=${bList.b_memail }">작성자의 게시물</a><br>
						<a type="button" href="masmemMassage?b_memail=${bList.b_memail}&b_code=${bList.b_code }&page=${pageDTO.page}">경고메세지</a></div>
				</div>
				
			</c:forEach>
	<hr>
	<div>
						<div style="float: left;">
							<button type="button" onclick="location.href='somoimList'">전체목록</button>
							<button type="button" onclick="location.href='masterpage'">관리자메인페이지</button>
						</div>
						<div style="">
						<form action="somoimList">
							<input type="text" name="keyword" placeholder="제목,닉네임,내용">
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
										
										<a href="somoimList?page=${pageDTO.page-1}&keyword=${pageDTO.keyword}">이전</a>
										
									</c:when>
								</c:choose>

								<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
									step="1" var="pageNum">
									<c:choose>
										<c:when test="${pageNum == pageDTO.page}">
											<a href="#">${pageNum }</a>
										</c:when>
										<c:otherwise>
											<a href="somoimList?page=${pageNum }&keyword=${pageDTO.keyword}" >${pageNum }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${pageDTO.page < pageDTO.maxpage }">
										
										<a href="somoimList?keyword=${pageDTO.keyword}&page=${pageDTO.page+1}"
											>다음</a>
										
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