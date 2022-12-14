<%@ include file="../style-somoim/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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

  <table>
     <tr>
       <th>신청자</th>     
       <th>소개글</th>     
       <th>신청일</th>         
       <th>승인/거절</th>         
     </tr>
  	<c:forEach var="aList" items="${applyList }">
     <tr>
       <td>${aList.a_mnickname }</td>
       <td>${aList.a_content }</td>
       <td>${aList.a_date }</td>         
       <td>
       <button onclick="applyApproval('${aList.a_code }','${aList.a_bcode }')">승인</button>
       <button onclick="applyRefuse('${aList.a_code}' ,'${aList.a_bcode }')">거절</button>
       </td>
     </tr>  
   </c:forEach>
  </table>

<script>
 function applyApproval(a_code,a_bcode){
  console.log("applyApproval");
  console.log("a_code ::" + a_code);
  console.log("a_bcode ::" + a_bcode);
  $.ajax({
    type : "post",
    url : "applyApproval",
    data : {
           "a_code" : a_code  ,
           "a_bcode" : a_bcode
         },
    dataType : "text",     
	success : function(applyApproval){
         console.log(applyApproval);
         if(applyApproval == "OK"){
            location.reload();
            alert("모임신청을 수락하였습니다");
             }else{
            	 alert("모임신청수락 실패");
                 }
		} ,
	error : function(){
        alert("applyApproval 연결실패");
		}	 
	  });  
	 }
 function applyRefuse(a_code,a_bcode){
    console.log("applyRefuse");
    console.log("a_code ::" + a_code);
    console.log("a_bcode ::" + a_bcode);
    $.ajax({
      type : "post",
      url : "applyRefuse",
      data : {
           "a_code" : a_code,
           "a_bcode" : a_bcode
          },
      dataType : "text",
      success : function(applyRefuse){
           console.log(applyRefuse);
           if(applyRefuse == "OK"){
               location.reload();
               alert("모임신청을 거절하였습니다");
               }else{
                alert("모임신청거절 실패");
                   }
          },
      error : function(){
         alert("applyRefuse 연결실패");
          }
        });
	 }
</script>

<%@ include file="../style-somoim/footer.jsp" %>