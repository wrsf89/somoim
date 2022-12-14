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
		<c:forEach var="mList" items="${memberList }">
			<hr>
			<div style="width: 500px; height: 120px">
				<div style="float: left; width: 20%; height: 100%;">
					
					<div>
						<c:if test="${mList.m_filename != null}">
							<img src="resources/profileImg/${mList.m_filename }"><br>
							
						</c:if>
					</div>
				</div>
				<div style="float: left; width: 20%; height: 100%;">
					<div><a>${mList.m_email}</a></div>
					<div>${mList.m_nickname }</div>
					<div>${mList.m_name }</div>
					<div>${mList.m_birth }</div>
					<div>${mList.m_phone }</div>
					
					<div></div>
				</div>				
				

				<div style="float: right; width: 40%; height: 100%;">
					<!--강제탈퇴::memberController/memberDelete로 이동  -->
					<a href="masMemDelete?m_email=${mList.m_email }">삭제</a><br>
					<a href="masbodmemlist?b_memail=${mList.m_email }">작성자의 게시물</a><br>
					<form action="masmemModi" method="get" style="border: 1px solid blue;">
						<input type="hidden" name="m_email" value="${mList.m_email }">
						<select name="modisel">
							<option value="">삭제할 데이터 선택</option>
							<option value="M_FILENAME">이미지</option>
							<option value="M_NICKNAME">닉네임</option>
							<option value="M_PHONE">전화번호</option>													
						</select>
						<input type="text" name="reason" placeholder="삭제사유">						
						<input type="submit" value="해당부분 삭제">
					</form>
					
				</div>
			</div>

		</c:forEach>
		<hr>
		<div>
			<form action="addMaster" method="get">
				<input type="text" name="m_email" placeholder="추가할 아이디"> <input
					type="password" name="m_password" placeholder="패스워드"> <input
					type="hidden" name="keyword" value="${pageDTO.keyword}"> <input
					type="hidden" name="page" value="${pageDTO.page}"> <input
					type="submit" value="관리자아아디추가">
			</form>
		</div>
		<hr>
		<div>
			<div style="float: left;">
				<button type="button" onclick="location.href='memberList'">전체목록</button>
				<button type="button" onclick="location.href='masterpage'">관리자메인페이지</button>
			</div>
			<div style="float: left;">
					<form action="memberList">
						<input type="text" name="keyword" placeholder="이메일,닉네임,이름">
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
								href="memberList?page=${pageDTO.page-1}&keyword=${pageDTO.keyword}">이전</a>

						</c:when>
					</c:choose>

					<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
						step="1" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == pageDTO.page}">
								<a href="#">${pageNum }</a>
							</c:when>
							<c:otherwise>
								<a href="memberList?page=${pageNum }&keyword=${pageDTO.keyword}">${pageNum }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageDTO.page < pageDTO.maxpage }">

							<a
								href="memberList?keyword=${pageDTO.keyword}&page=${pageDTO.page+1}">다음</a>

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