<%@ include file="../style-somoim/nav.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<form action="findPassword" method="post" name="findPasswordSubmit">
	<table>
	  <tr>
	     <td>고객님의 E-MAIL/아이디 를 입력해주세요</td> 
	     <td><input type="email" id="m_email" name="m_email" placeholder="입력하신 메일로 임시비밀번호를 보내드립니다."></td> 
	  </tr>
	   <tr>
	     <td>고객님의 이름을 입력해주세요</td> 
	     <td><input type="text" id="m_name" name="m_name" placeholder="가입하실떄 기재해준 이름"></td> 
	  </tr>
	    <tr>
	     <td colspan="2"><button onclick="findPassWord()">비밀번호 찾기</button></td> 
	  </tr>
	</table>
	</form>
	
	<script>
    function findPassWord(){
      console.log("findPassWord()실행");
      var m_email = $("#m_email").val();
      var m_name = $("#m_name").val();
      $.ajax({
         type : "post",
         url : "selectFindPassword",
         data : {
            "m_email" : m_email,
            "m_name" : m_name
             },
         dataType : "text",
         success : function(selectFindPassword){
             console.log(selectFindPassword);
             if(selectFindPassword == "OK"){
                 alert("입력하신 메일로 임시비밀번호를 전송했습니다.");
                 document.findPasswordSubmit.submit();
                 }else{
                  alert("회원정보가 등록되어있지 않습니다");
                     }
             },
         error : function(){
             alert("selectFindPassword 연결실패");
             }      
          });               
        }
	</script>
	
	
	
	
	
	
	
	
<%@ include file="../style-somoim/footer.jsp"%>