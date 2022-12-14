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
	<h1>${boarddto.b_title }</h1>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="btitle" readonly="readonly"
				value="${boarddto.b_title }"></td>
		</tr>
		<tr>
			<td>글번호</td>
			<td><input type="text" name="b_sccode" readonly="readonly"
				value="${boarddto.b_sccode }번글"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="b_mnickname" readonly="readonly"
				value="${boarddto.b_mnickname }"></td>
		</tr>
		<tr>
			<td>이미지파일</td>
			<td><c:if test="${boarddto.b_filename != null}">
					<img src="resources/images/${boarddto.b_filename }" style="max-width: 500px; height: 300px;">
				</c:if></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="8" name="bcontent" readonly="readonly">${boarddto.b_content }</textarea></td>
		</tr>
		<tr>
			
			<td colspan="2"><button type="button" onclick="location.href='somoimList'">글목록</button></td>
		</tr>
		
	</table>

</body>
</html>