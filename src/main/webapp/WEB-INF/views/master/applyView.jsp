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
			<tr>
				<td>신청번호</td>
				<td><input type="text" name="a_code" readonly="readonly"
					value="${applyddto.a_code }"></td>
			</tr>
			<tr>
				<td>모임글번호</td>
				<td><input type="text" name="a_bcode" readonly="readonly"
					value="${applyddto.a_bcode }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="a_mnickname" readonly="readonly"
					value="${applyddto.a_mnickname }"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" name="a_date" readonly="readonly"
					value="${applyddto.a_date }"></td>
			</tr>
			<tr>
				<td>확인</td>
				<td><input type="text" name="a_bcode" readonly="readonly"
					value="확인 :${applyddto.a_check }"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="8" class="card-body form-control"
						name="a_content" readonly="readonly">${applyddto.a_content }</textarea></td>
		</table>
	
</body>
</html>