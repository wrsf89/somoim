<%@ include file="../style-somoim/nav.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style>
	table,tr,td,th{
		padding : 10px;
	}
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

</style>
</head>
<body>
 <div class="what-we-do we-padding">
	<div class="col-lg-4 col-md-6" style="max-width:72%; margin: 0px auto;">
		<div class="single-do text-center mb-30">
			<div class="do-icon">
				<span class="flaticon-social-media-marketing"></span>
			</div>
			<div class="do-caption">
				<h4>회원가입</h4>					
					<form action="memberJoin" name="Reg_form" method="post"
						onsubmit="return check()" enctype="multipart/form-data">
						<table style="margin:auto;">
							<tr>
								<td>닉네임</td>
								<td><input type="text" id="inputMnickname" class="form-control"
									name="m_nickname" placeholder="닉네임을 입력해주세요"> 
								<td style="width:163px;">
									<a href="#" id="mnicknameCheck" onclick="mnicknameCheck()" class="genric-btn info circle">중복확인</a>
								</td>
								<td><span id="nicknameCheckMsg"></span></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>
									<input type="email" id="inputMemail" name="m_email" class="form-control"
									placeholder="아이디를 입력해주세요">
								</td>
								<td>
									<span id="idCheckMsg"></span>
								</td>
							</tr>

							<tr>
								<td>비밀번호<span id="pwCheckMsg"></span></td>
								<td><input type="password" id="inputMpassword" class="form-control"
									name="m_password" placeholder="비밀번호를 입력해주세요"></td>
							</tr>

							<tr>
								<td>비밀번호 확인</td>
								<td><input type="password" id="checkPw"
									name="checkpassword" placeholder="비밀번호확인" class="form-control">
								</td>
								<td><span id="pwConfirmMsg"></span></td>
							</tr>

							<tr>
								<td>이름</td>
								<td><input type="text" id="inputMname" name="m_name" class="form-control"
									placeholder="이름을 입력해주세요"></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="date" id="inputMbirth" name="m_birth" class="form-control"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" id="inputMphone" name="m_phone" class="form-control"
									placeholder="전화번호를 입력해주세요"></td>
							</tr>
							<tr>
								<td>프로필사진</td>
								<td><input type="file" id="m_file" name="m_file" value="파일선택"></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" 
									class="genric-btn primary" value="회원가입">
									<input type="button" id="cancle"
									class="genric-btn danger" value="다시입력">
								</td>
							</tr>
						</table>
					</form>
			</div>
		</div>
	</div>
	</div>


	<%@ include file="../style-somoim/footer.jsp"%>
	<script type="text/javascript">

	var checkNick = 0;


	
   $(document).ready(function(){

      /* 비밀번호 확인 */
      $("#checkPw").keyup(function(){
         var checkPw = $("#checkPw").val();
         var mpassword = $("#inputMpassword").val();

         if(mpassword ==''){
            alert("비밀번호가 입력되지 않았습니다.");
            $("#checkPw").val("");
            $("#inputMpassword").focus();
            return;
         }
         
         if(checkPw == mpassword){
            $("#pwConfirmMsg").css("color","green").text("비밀번호 일치");
         }else{
            $("#pwConfirmMsg").css("color","red").text("비밀번호 불일치");
         }
      });
      $("#inputMpassword").keyup(function(){
         var checkPw = $("#checkPw").val();
         var mpassword = $("#inputMpassword").val();

         if(mpassword ==''){
            alert("비밀번호가 입력되지 않았습니다.");
            $("#checkPw").val("");
            $("#inputMpassword").focus();
            return;
         }
         
         if(checkPw == mpassword){
            $("#pwConfirmMsg").css("color","green").text("비밀번호 일치");
         }else{
            $("#pwConfirmMsg").css("color","red").text("비밀번호 불일치");
         }
      });

      
      /* 아이디 중복 확인 */
      $("#inputMemail").keyup(function(){
         var inputMemail = $("#inputMemail").val();
         console.log("inputMemail : " + inputMemail);
         $.ajax({
            type : "post",
            url : "idCheck",
            data : {
                  "inputMemail":inputMemail
                 },
            dataType : "text",
            success : function(result){
               console.log("result:" + result);
               if(result=="OK"){
                  $("#idCheckMsg").css("color","green").text("사용가능");
               }else{
                  $("#idCheckMsg").css("color","red").text("사용 불가능");
               }
            },
            error : function(){
               alert("idCheck 연결실패");
            }
         });
      });
   });
   /* 닉네임 중복 체크 */
   function mnicknameCheck(){
      inputMnickname = $("#inputMnickname").val();
      var chk=document.Reg_form;
      
        if(chk.inputMnickname.value==""){
            alert("닉네임을 입력하세요");
            chk.inputMnickname.focus();
            return false;
        }
        
      $.ajax({
          type: "post",
          url: "nicknameCheck",
          data: {
             "inputMnickname":inputMnickname
             },
          dataType: "text", 

          success: function(result){
               if(result == "OK"){
                    console.log("아이디 없음");
                    checkNick = 1;
                  alert("사용하실 수 있는 아이디입니다.");
                  $("#nicknameCheckMsg").css("color","green").text("사용가능");
               }else{
                  console.log("아이디 있음");
                  alert("중복된 아이디가 존재합니다.");
                  $("#nicknameCheckMsg").css("color","red").text("사용 불가능");
                  $("#inputMnickname").val("");
                  $("#inputMnickname").focus();
               }
          },
          error: function (){        
             alert("nicknameCheck 연결실패");        
          }
      });
   }
    function check() {
        
           var f = document.Reg_form; 
           if(checkNick!=1){
				alert("닉네임 중복체크해주십시오");
				return false;
               }
       
    
           if (f.inputMnickname.value == "") {
               alert("닉네임을 입력해주십시오");
               f.inputMnickname.focus();
               return false;
           }  

           if (f.inputMemail.value == "") {
               alert("아이디를 입력해주십시오");
               f.inputMemail.focus();
               return false;
           }
    
           if (f.inputMpassword.value == "") {
               alert("비밀번호를 입력해주십시오");
               f.inputMpassword.focus();
               
               return false;
           }
    
           if (f.checkPw.value != f.inputMpassword.value) {
               alert("비빌번호를 다르게 입력했습니다.");
               f.checkPw.select();
               return false;
           }
    
           if (f.inputMname.value == "") {
               alert("이름을 입력해주십시오");
               f.inputMname.focus();
               return false;
           }
    
           if (f.inputMbirth.value == "") {
               alert("생년월일을 입력해주십시오");
               f.inputMbirth.focus();
               return false;
           }
    
           if (f.inputMphone.value == "") {
               alert("전화번호를 입력해주십시오");
               f.inputMphone.focus();
               return false;
           }    
       }   
    $(document).ready(function(){
    	$("#cancle").click(function(){
			cancle();
		});
	});
	function cancle(){
		document.getElementById("inputMnickname").value = "";
		document.getElementById("inputMemail").value = "";
		document.getElementById("inputMpassword").value = "";
		document.getElementById("checkPw").value = "";
		document.getElementById("inputMname").value = "";
		document.getElementById("inputMbirth").value = "";
		document.getElementById("inputMphone").value = "";
		document.getElementById("m_file").value = "";
	}
</script>