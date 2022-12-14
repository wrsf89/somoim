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

	<h1>${memberDTO.m_email }님의 회원정보</h1>

	<table>
		<tr>
			<td>프로필 이미지</td>
			<td><img alt="프로필사진" src="resources/profileImg/${memberDTO.m_filename }"
			style="max-width: 50%; height: auto;">
			<a href="memFileDelete?delMemFileName=${memberDTO.m_filename }">삭제</a>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" id="inputMemail"	value="${memberDTO.m_email }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" value="${memberDTO.m_password }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="inputMname" value="${memberDTO.m_name }"	readonly="readonly"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" id="inputMphone" value="${memberDTO.m_phone }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" id="inputMemail"	value="${memberDTO.m_nickname }" readonly="readonly">
			<form action="nickModify" method="get">
				<input type="text" placeholder="임의로 변경할 닉네임">
				<input type="submit" value="변경">			
			</form>
			</td>
			
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" id="inputMbirth" value="${memberDTO.m_birth }" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="memberList">목록</a>
			<a href="masterpage">관리자페이지</a>
			<button type="button">수정</button>
			</td>
			
		</tr>
	</table>		
		

</body>
</html>