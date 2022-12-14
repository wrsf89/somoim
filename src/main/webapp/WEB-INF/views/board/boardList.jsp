<%@ include file="../style-somoim/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	p{
		margin:0 auto;
	}
</style>
 <div class="what-we-do we-padding">
	<div class="section-top-border">
				<h1 class="mb-30" style="text-align:center">모임목록</h1>
				
				<div class="progress-table-wrap" style="margin-left:17%; margin-right:17%; padding:auto;">
					<div class="progress-table">
						<div class="table-head" style="text-align:center">
							<div class="visit"><p>작성자</p></div>
							<div class="visit"><p>제목</p></div>
							<div class="visit"><p>모임시간</p></div>
							<div class="visit"><p>모임장소</p></div>
							<div class="visit"><p>조회수</p></div>
						</div>
						<c:forEach var="bList" items="${boardList }">
						<div class="table-row">
							<div class="visit"><p>${bList.b_mnickname }</p></div>
							<div class="visit">
								<p><img src="${pageContext.request.contextPath}/resources/profileImg/${bList.b_filename}" width="200" height="100">
								<a class="aTitle" href="boardView?b_code=${bList.b_code }" style="color:blue;">${bList.b_title }</a></p>
							</div>
							<div class="visit"><p>${bList.b_date}</p></div>
							<div class="visit"><p>${bList.b_addr}</p></div>
							<div class="visit"><p>${bList.b_hit }</p></div>
						</div>
						</c:forEach>
						<div style="float: right">
							<ul>
								<c:choose>
									<c:when test="${pageDTO.page<=1 }">
										<a style="color: black;" href="#">이전</a>
									</c:when>
									<c:when test="${pageDTO.page>1 }">
										
										<a style="color: black;" href="boardList?page=${pageDTO.page-1}">이전</a>
										
									</c:when>
								</c:choose>

								<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
									step="1" var="pageNum">
									<c:choose>
										<c:when test="${pageNum == pageDTO.page}">
											<a style="color: black;" href="#">${pageNum }</a>
										</c:when>
										<c:otherwise>
											<a style="color: black;" href="boardList?page=${pageNum }" >${pageNum }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${pageDTO.page < pageDTO.maxpage }">
										
										<a style="color: black;" href="boardList?page=${pageDTO.page+1}"
											>다음</a>
										
									</c:when>
									<c:when test="${pageDTO.page >= pageDTO.maxpage}">
										<a style="color: black;" href="#">다음</a>
									</c:when>
								</c:choose>


							</ul>
						</div>
					</div>
				
				</div>
				
				
					
			</div>
		</div>

<%@ include file="../style-somoim/footer.jsp"%>