<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../style-somoim/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>boardWriteForm</title>
<div class="what-we-do we-padding">
	<div class="col-lg-4 col-md-6" style="max-width: 72%; margin: 0px auto;">
		<div class="single-do text-center mb-30">
			<div class="do-caption">
				<h4>글쓰기</h4>
				<form action="boardWrite" method="post" enctype="multipart/form-data">
					<table style="margin:auto;">
						<tr>
							<td>
								<select name="b_mccode" id="b_mccodeArea" class="nice-select" onchange="selectChange()" style="width:-webkit-fill-available">
									<option value="">선택</option>
								</select> 
							</td>
							<td>
								<span id="subCategory"> </span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="b_mnickname" placeholder="닉네임" class="single-input"
								value="${sessionScope.m_nickname}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="b_title" placeholder="모임제목" class="single-input"
								id="inputb_title"> <input type="hidden" name="b_memail"
								value="${sessionScope.m_email }">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="8" name="b_content" id="inputb_content" class="single-input"
									placeholder="모임소개글"></textarea>
							</td>
						</tr>
						<tr>
							<td><select name="b_region" class="nice-select">
									<option value="" selected>선택</option>
									<option value="서울특별시">서울특별시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="대구광역시">대구광역시</option>
									<option value="인천광역시">인천광역시</option>
									<option value="광주광역시">광주광역시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="울산광역시">울산광역시</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="충청북도">충청북도</option>
									<option value="충청남도">충청남도</option>
									<option value="전라북도">전라북도</option>
									<option value="전라남도">전라남도</option>
									<option value="경상북도">경상북도</option>
									<option value="경상남도">경상남도</option>
									<option value="제주특별자치도">제주특별자치도</option>
									<option value="세종특별자치시">세종특별자치시</option>
								</select> 
							</td>
							<td>
								<input type="text" name="b_addr" class="single-input" placeholder="상세장소">
							</td>
						</tr>
						<tr>
							<td><input type="date" name="b_date" value="날짜선택" /></td>
							<td><input type="time" name="b_time" value="시간선택"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="file" name="b_file" value="파일선택"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button class="genric-btn primary" type="button" onclick="location.href='boardList'">목록으로</button>
								<button class="genric-btn success" type="submit">글등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>



</head>
<body>
	<div class="what-we-do we-padding"></div>
	<%@ include file="../style-somoim/footer.jsp"%>
	<script>
		$(document).ready(function() {
			console.log("getMaincategoryList실행");
			Maincategory();
		});

		function Maincategory() {
			$.ajax({
				type : "post",
				url : "getMaincategoryList",
				data : {

				},
				dataType : "json",
				success : function(getMaincategoryList) {
					console
							.log("getMaincategoryList :::"
									+ getMaincategoryList);
					printMainCategoryList(getMaincategoryList);
				},
				error : function() {
					alert("연결실패");
				}
			});
		}
		function printMainCategoryList(getMaincategoryList) {
			console.log("printMainCategoryList 실행");
			output = '';
			var MainCategoryCount = getMaincategoryList.lenght;
			for ( var i in getMaincategoryList) {
				var mc_code = getMaincategoryList[i].mc_code;
				var mc_name = getMaincategoryList[i].mc_name;
				console
						.log("mc_code : " + mc_code + " // mc_name : "
								+ mc_name);
				output += "<option value="+mc_code+" name='mc_code'>" + mc_name
						+ "</option>"
			}
			$("#b_mccodeArea").append(output);
		}

		function selectChange() {
			console.log("selectChange");
			var result = $("#b_mccodeArea").val();
			console.log("reslut : " + result);
			$.ajax({
				type : "post",
				url : "getSubCategoryList",
				data : {
					"sc_mccode" : result
				},
				dataType : "json",
				success : function(getSubcategoryList) {
					console.log("getSubcategoryList :::" + getSubcategoryList);
					printSubCategoryList(getSubcategoryList);
				},
				error : function() {
					alert("연결실패");
				}
			});
		}

		function printSubCategoryList(getSubcategoryList) {
			var output = '';
			var output2 = '';
			output += "<select name='b_sccode' id='sc_code' class='nice-select' style='width:-webkit-fill-available'>";
			for ( var i in getSubcategoryList) {
				var sc_code = getSubcategoryList[i].sc_code;
				var sc_name = getSubcategoryList[i].sc_name;
				output += "<option value="+sc_code+" >" + sc_name + "</option>";
			}
			output += "</select>"

			$("#subCategory").html(output);

		}
	</script>