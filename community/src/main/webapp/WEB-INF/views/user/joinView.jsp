<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>회원가입</title>

	<%@ include file="../include/header.jsp" %>	
	
	<section>
		<div class="wrap">		
			<div id="contents">
				<div class="join">
					<div class="container">
						<div class="join-form">
		                	
		                	<form action="signUp" name="joinForm" method="post">
		                	
		                	<!-- 이메일 -->
		                    <div class="form-group">
		                        <label for="id">아이디 (이메일)</label>
		                        <div class="input-group">
		                            <input type="text" class="form-control" name="id" id="id" placeholder="이메일 형식으로 입력하세요"> <!-- onchange="verifyEmail()" -->
		                            <span id="emailCk_msg"></span>
		                            
		                            <div class="input-group-addon">
		                                <button type="button" class="btn btn-primary" id="userIDcheck">아이디 중복체크</button>
		                            </div>
		                        </div>
		                    </div>
		                    
		                    <!-- 비밀번호 -->
		                    <div class="form-group">
		                        <label for="pw">비밀번호</label>
		                            <input type="password" class="form-control" name= "pw" id="pw" placeholder="비밀번호(조건기술)" maxlength="16">
		                            <span id="msgPw"></span>	<!-- 비밀번호를 입력해주세요 -->
		                    </div>
		                    
		                    <!-- 비밀번호 확인 -->
		                    <div class="form-group">
		                        <label for="password-confirm">비밀번호 재확인</label>
		                            <input type="password" class="form-control" id="pwCk" placeholder="비밀번호 재확인" maxlength="16">
		                        <span id="msgPwCk"></span>		<!-- 비밀번호 확인을 입력해주세요 --> 
		                    </div>
		
		                    <!-- MOBILE -->
		                    <div class="form-group">
		                        <label for="hp">휴대전화</label>
		                        <div class="input-group phone">
		                            <select id="com" name="com" class="form-control phone1">
		                                    <option>통신사</option>
		                                    <option value="LGU+">LGU+</option>
		                                    <option value="SKT">SKT</option>
		                                    <option value="KT">KT</option>
		                                    <option value="ACTS">알뜰폰</option>
		                            </select>
		                            
		                            <span id="msgPhone1"></span> <!-- 통신사를 선택해주세요 -->
		                            <input type="text" class="form-control phone2" name="phone" id="phone" placeholder="전화번호 입력">
		                            <span id="msgPhone2"></span>  <!-- 전화번호를 입력해주세요 -->
		                        </div>
		                    </div>
		
		                    <!-- JOIN BTN-->
		                    <div class="btn_area">
		                        <button type="button" id="joinBtn">가입하기</button>
		                    </div>
		                	</form>
		                	 
						</div> <!-- join-form -->
					</div> <!-- container -->
				</div> <!-- join -->
			</div> <!-- contents -->
		</div> <!-- wrap -->
	</section>
	<%@ include file="../include/footer.jsp" %>	
	
	<script>
	    $("#userIDcheck").click(function(){
	    	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
			var id = $("#id").val();
			
			if (id.match(regExp) == null) { 
				$("#emailCk_msg").html("잘못된 이메일 형식입니다");
				return;
			}else if (id.match(regExp) != null) {
				$("#emailCk_msg").html("올바른 이메일 형식입니다");
			
			} else if (id.length < 4){
				alert("아이디는 네 글자 이상입니다");
				return;
			}
	    	
			$.ajax({
				type: "post", 	// 보내는 형식
				url: "idCheck",	// 보내는 주소
				contentType: "application/json; charset=UTF-8", // 보내는 데이터
				
				// 제이슨 형식은 {키, 값} 형태를 띈다. 
				// 하지만 컴퓨터는 json 형태를 컴퓨터가 아는 문자열로 바꿔 보내야 한다
				// => JSON.stringify 사용 ({ "": })
				data : JSON.stringify({"id": id}),		
				success: function(data){
					
					if(data==0){ // 중복없음
						$("#id").attr("readonly", true);
						alert("사용 가능한 아이디입니다");
					}else{
						alert("중복된 아이디입니다");
					} 
				},  // success 종료
				error: function(){
					alert("서버측 에러가 발생했습니다");
				}
			}); 	// ajax 종료
		 })		// function 종료	
		 
    	// 회원가입 유효성 검증
    	$("#joinBtn").click(function() {
    		
    		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    		var phone = $("#phone").val();
    		
    		if(!$("#id").attr("readonly")){
    			alert("아이디 중복 체크는 필수입니다");
    			return;
    		
    		}else if($("#pw").val()==''){
    			$("#msgPw").html("비밀번호는 필수입니다");
    			return;
    			
    		}else if($("#pwCk").val()==''){
    			$("#msgPwCk").html("비밀번호 확인은 필수입니다");
    			return;
    			
    		}else if($("#pw").val() != $("#pwCk").val()){
    			$("#msgPwCk").html("비밀번호가 일치하지 않습니다")
    		
    		}else if($("#com").val()=="통신사"){
    			$("#msgPhone1").html("통신사 선택은 필수입니다");
    			return;
    			
    		}else if($("#phone").val().length==''){
    			$("#msgPhone2").html("전화번호 입력은 필수입니다");
    			return;

    		}else if(phone.match(regPhone) == null){
    			$("#msgPhone2").html("휴대폰 번호가 올바른 형식이 아닙니다");
    			return;
    			
    		}else{
    			// 폼 네임 joinForm (form의 액션값은 signup)
    			alert("회원가입에 성공했습니다. 로그인을 해주세요.")
    			document.joinForm.submit();
    		};    		
   		});		 
	</script>
</body>
</html>