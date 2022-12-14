<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../style-somoim/nav.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  #container{
  	box-sizing : leftTable;
  	width:100%;
  	margin:30px auto;
  }
  #leftTable {
  box-sizing:border-box;
  width:50%;
  float : left;
  text-align:center;
  }
  #rightTable{
  box-sizing:border-box;
  width:50%;
  float : right ;
  text-align:center;
  }
  

</style>
</head>
<body>
<div id="container">
<div id="leftTable">
<h1>내가 보낸 메세지 함</h1>
<table>
	<tr>
		<th>
			글 번호
		</th>
		<th>
			작성자
		</th>
		<th>
			메세지 내용
		</th>
		<th>
			보낸시간
		</th>
		<th>
			처리상태
		</th>
	</tr>
	<c:forEach var="msgList" items="${msgList}">
	<tr>
			<td>${msgList.msg_code }</td>
			<td>${msgList.msg_memail}</td>
			<td>${msgList.msg_content }</td>
			<td>${msgList.msg_date}</td>
			<td>${msgList.msg_check}</td>
	</tr>
	</c:forEach>
</table>
</div>
<div id="rightTable">
<h1>답장받은 메세지함</h1>
<table>
	<tr>
		<th>
			글 번호
		</th>
		<th>
			작성자
		</th>
		<th>
			메세지 내용
		</th>
		<th>
			보낸시간
		</th>
		<th>
			처리상태
		</th>
	</tr>
	<c:forEach var="msgList" items="${msgList}">
	<tr>
			<td>${msgList.msg_code }</td>
			<td>${msgList.msg_memail}</td>
			<td>${msgList.msg_content }</td>
			<td>${msgList.msg_date}</td>
			<td>${msgList.msg_check}</td>
	</tr>
	</c:forEach>
</table>
</div>
</div>




<%@ include file="../style-somoim/footer.jsp" %>

<script type="text/javascript">

</script>
</html>