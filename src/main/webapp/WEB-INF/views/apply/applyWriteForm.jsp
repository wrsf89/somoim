<%@ include file="../style-somoim/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table,tr,td,th{
   border: 1px solid skyblue;
   border-collapse: collapse;
   text-align: center;  
   margin-left:auto;
	margin-right:auto;
	padding:10px;
	color:white;
	margin-top:20px;
  }
  .aTitle{
  	color: dodgerblue;
  }
</style>
</head>
<body>
	<form action="applyWrite" method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="a_mnickname"
					value="${sessionScope.m_nickname }" readonly="readonly"><br>
					<input type="hidden" name="a_bcode" value="${a_bcode }">
					<input type="hidden" name="a_memail" value="${sessionScope.m_email }">
				</td>
			</tr>
			<tr>
				<td>신청내용</td>
				<td>
					<textarea cols="50" rows="30" name="a_content" placeholder="신청내용"></textarea><br>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					class="button button-style1" value="신청" /></td>
			</tr>
		</table>
	</form>
	<%@ include file="../style-somoim/footer.jsp"%>
</body>
</html>