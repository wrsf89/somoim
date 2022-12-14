<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 
    
        <style>
        #my_modal {
            display: none;
            width: 300px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }
    
        #my_modal .modal_close_btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
       
    </style>
    </main>
     <div id="my_modal"  >
          <input type="hidden" value="관리자" id="msg_receiveid">
          <input type="hidden" value="${sessionScope.m_email }" id="msg_sendid">
         <textarea placeholder="문의내용을 입력해주세요" rows="20" cols="20" id="msg_content"></textarea>
        <button class="button button-style1" onclick="massageForm()">보내기</button><a class="modal_close_btn">닫기</a>
    </div>
  <footer>

       <!-- Footer Start-->
      <div class="footer-main" data-background="resources/img/shape/footer_bg.png" style="background:url(resources/img/shape/footer_bg.png);">
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-lg-3 col-md-4 col-sm-8">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo">
                                 <a href="home"><h3>somoim</h3></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p class="info1">주소입력부분 <br>상세주소입력부분</p>
                                     <p class="info2">이메일@도메인 입력 부분</p>
                                </div>
                             </div>
                             <div class="footer-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fas fa-globe"></i></a>
                                <a href="#"><i class="fab fa-behance"></i></a>
                            </div>
                         </div>
                       </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Quick Links</h4>
                                <ul>
                                    <li><a href="joinForm">회원가입</a></li>
									<li><a href="loginForm">로그인</a></li>
									<li><a href="memberView?m_email=${sessionScope.m_email}">프로필</a></li>
                                    <li><a href="boardWriteForm?">모임글쓰기</a></li>
									<li><a href="boardList">모임목록</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>고객센터</h4>
                                <ul>
                                    <li><a href="#"  id="popup_open_btn"><p>1대1 문의</p></a></li>
                                    <li><A HREF="sms:+010-2592-9369?body= 원하시는 문자 내용을 넣으시면 됩니다.">
       								<p> Click to message <br> the developer</p></A></li>
                                    <li><A HREF="TEL:010-2592-9369">
                                    <p> Click to call <br> the developer</p> </A></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer-bottom aera -->
        <div class="footer-bottom-area footer-bg">
            <div class="container">
                <div class="footer-border">
                     <div class="row d-flex align-items-center">
                         <div class="col-xl-12 ">
                             <div class="footer-copy-right text-center">
                                 <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                             </div>
                         </div>
                     </div>
                </div>
            </div>
        </div>
      </div>
      </div>
      </div>
      </div>
       <!-- Footer End-->
   </footer>
</body>
      <div id="messageArea"></div>
   
   <script type="text/javascript">
  function massageForm(){
    var msg_sendid = $("#msg_sendid").val();
    var msg_content = $("#msg_content").val();
    var msg_receiveid = $("#msg_receiveid").val();
    console.log("msg_sendid : " + msg_sendid + "msg_content :" + msg_content);
    $.ajax({
      type : "post",
      url : "sendMessage",
      data : {
          "msg_sendid" : msg_sendid,
          "msg_content" : msg_content,
          "msg_receiveid" : msg_receiveid
          },
          async:false,
     dataType:"text",
     success : function(insertmassage) {
			console.log("insertmassage :::" + insertmassage);
			if(insertmassage == "OK"){
               alert("메세지를 보냈습니다.");
               $("#msg_content").val("");               
				}else{
					alert("insertmassage 연결실패");
					}
		},
		error : function() {
			alert("massageForm 연결실패");
		} 
		     
    });
    $("#my_modal").hide();
	     //$("#my_modal").css("display","none");
	   location.reload();
    
}

	$(document).ready(function(){
		$("#popup_open_btn").click(function(){
			var memail = '${sessionScope.m_email}';    
			console.log("memail ::" + memail);
			if(memail == ''){
          		alert("로그인후 이용 가능합니다");
          		location.href="loginForm";
          	}
		})
	});
   </script>
   
   
   
   
    <script>
    function modal(id) {
        var zIndex = 9999;
        var modal = $('#' + id);
    
        // 모달 div 뒤에 희끄무레한 레이어
        var bg = $('<div>')
            .css({
                position: 'fixed',
                zIndex: zIndex,
                left: '0px',
                top: '0px',
                width: '100%',
                height: '100%',
                overflow: 'auto',
                // 레이어 색갈은 여기서 바꾸면 됨
                backgroundColor: 'rgba(0,0,0,0.4)'
            })
            .appendTo('body');
    
        modal
            .css({
                position: 'fixed',
                boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
    
                // 시꺼먼 레이어 보다 한칸 위에 보이기
                zIndex: zIndex + 1,
    
                // div center 정렬
                top: '50%',
                left: '50%',
                transform: 'translate(-50%, -50%)',
                msTransform: 'translate(-50%, -50%)',
                webkitTransform: 'translate(-50%, -50%)'
            })
            .show()
            // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
            .find('.modal_close_btn')
            .on('click', function() {
                bg.remove();
                modal.hide();
            });
    }
    
    $('#popup_open_btn').on('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });
</script>   