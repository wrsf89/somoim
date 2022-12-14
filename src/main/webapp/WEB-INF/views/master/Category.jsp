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

	<table>
		<thead>
			<tr>
				<th>카테고리코드</th>
				<th>카테고리명</th>

				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>카테고리코드</th>
				<th>카테고리명</th>
				<th></th>
			</tr>
			<tr>
				<th colspan="3">
					<div>
						<div style="float: left;">
							<button type="button" onclick="location.href='categoryList'">전체목록</button>
							<button type="button" onclick="location.href='masterpage'">관리자메인페이지</button>
						</div>
						<div style="float: right">
							<ul>

								<c:choose>
									<c:when test="${pageDTO.page<=1 }">
										<a href="#">이전</a>
									</c:when>
									<c:when test="${pageDTO.page>1 }">
										
										<a href="categoryList?page=${pageDTO.page-1}&keyword=${pageDTO.keyword}">이전</a>
										
									</c:when>
								</c:choose>

								<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
									step="1" var="pageNum">
									<c:choose>
										<c:when test="${pageNum == pageDTO.page}">
											<a href="#">${pageNum }</a>
										</c:when>
										<c:otherwise>
											<a href="categoryList?page=${pageNum }&keyword=${pageDTO.keyword}" >${pageNum }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${pageDTO.page < pageDTO.maxpage }">
										
										<a href="categoryList?keyword=${pageDTO.keyword}&page=${pageDTO.page+1}"
											>다음</a>
										
									</c:when>
									<c:when test="${pageDTO.page >= pageDTO.maxpage}">
										<a href="#">다음</a>
									</c:when>
								</c:choose>


							</ul>
						</div>
					</div>
				</th>
			</tr>			
			<tr>
				<th colspan="3">
					<form action="addCategory1" method="get">
						<input type="text" name="cate1Name" placeholder="추가할 카테고리명">
						<input type="hidden" name="page" value="${pageDTO.page}">
						<input type="submit" value="데이터추가">
					</form>
				</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach var="cList" items="${cate1List }">
				<tr>
					<td>${cList.mc_code }</td>
					<td>${cList.mc_name }</td>


					<td><a href="delcate1?mc_code=${cList.mc_code}&page=${pageDTO.page}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>