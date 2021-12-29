<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>로그인</title>

	<%@ include file="../include/header.jsp" %>		
	<section>
		<div class="wrap">		
			<div id="contents">
				<div class="login">
					<div class="container">
					
				        <div class="login-form">
				          <form action="login" name="login-form" method="post">
				            
				            <div>
				            	<input type="text" id="id" name="id" class="text-field" placeholder="아이디" required >
				            </div>
				            <span>${msg}</span>
				            
				            <div>
				            	<input type="password" id="pw" name="pw" class="text-field" placeholder="비밀번호" required>
				            </div>
				            
				            <!-- 자동 로그인
				            <div class="auto_login">
				              <input type="checkbox" id="" name="" class="auto-login">자동로그인 
				            </div>
							-->
							
				            <button type="submit" class="submit-btn">로그인</button>
				            <button type="button" class="submit-btn" onclick="location.href='joinView'">회원가입</button>
						  
						  <div class="forget">
					          <div class="search-id" onclick="findid()">
					            <a>아이디를 잊어버리셨나요?</a>
					          </div>
					          
					          <div class="search-pw" onclick="findpassword()">
					            <a>비밀번호를 잊어버리셨나요?</a>
					          </div>
				          </div>
				          <!-- 소셜로그인 버튼 -->
				          <div class="sns-login">
				            <div class="button-group">
				            
				              <!-- 카카오 간편 로그인 -->
				              <div class="submit-btn-kko">
				
				              	<input type="hidden" name="kakaoemail" id="kakaoemail" value="" />
				              	<button type="submit" onclick="loginWithKakao()">
									<img src="${pageContext.request.contextPath }/resources/img/kakao_login_medium_wide.png">
				              	</button>
				              </div>
							 
							  <!-- 
				              <div class="submit-btn-ggl">
				                <button type="submit" class="ggl-btn"><img src="${pageContext.request.contextPath }/resources/img/kakao_login_medium_wide.png"></button>
				              </div>
							 
				              <div class="submit-btn-nv"> 
				                <button type="submit" class="naver-btn"><img src="${pageContext.request.contextPath }/resources/img/kakao_login_medium_wide.png"></button>
				              </div>
				              -->  
				            </div> <!-- 버튼 그룹 끝 -->
				          </div>   <!-- 소셜 로그인 div 끝 -->
				    	</form>
				       </div>	   <!-- 로그인 폼 div 끝 -->
					</div> <!-- container -->
				</div> <!-- login -->
			</div> <!-- contents -->
		</div> <!-- wrap -->
	</section>
	<%@ include file="../include/footer.jsp" %>	
	
	<!-- 아이디, 비번찾기 팝업창 -->
    <script type="text/javascript">
	  function findid(){
			var url="find_id_form";
			window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=600, height=600");
	  }
	  
	  function findpassword(){
		  var url="find_password_form";
		  window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=600, height=750");
	  }
  </script>
 	  
  <script>
	  function loginWithKakao() { 
		  console.log('ddd')
		  Kakao.Auth.authorize({ 
		  	  redirectUri:'http://localhost:8181/user/loginpage_kakao_callback'  
		  });
		  
		  Kakao.Auth.login({
			  type: "post",
			  success: function(response) {
			      console.log(response); //access토큰
				  Kakao.API.request({
					  	// 이렇게 해주면 되지 않을까나...
					  	// res : JSON.stringify({"res": res}),	
					    url: '/v2/user/me',
					    success: function(res) {
					        console.log(res); //사용자정보
					        //우리의 DB로 필요한정보를 저장하고 controller에서 처리....
					        // 에이작스에서 다른 서버랑 비동기 통신하는 방법 알기
					    },
					    fail: function(error) {
					        console.log(error);
					    }
					});
			  },
			  fail: function(error) {
			    console.log(error);
			  },
			});
	  }
	  //'http://localhost:8080/user/loginpage_kakao_callback' 
	  
  </script>
	
</body>
</html>