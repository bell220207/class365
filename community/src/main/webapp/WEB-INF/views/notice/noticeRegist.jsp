<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>공지사항 작성</title>

	<%@ include file="../include/header.jsp" %>	
	<section>
		<div class="wrap">		
			<div id="contents">
				<div class="notice">
					<div class="container">
				        <div class="noticeRegist-form">
				        
				        	<form action="registForm" method="post">
				        		
								<div class="registTable">
									<div class="r-control">
										<label class="lb-control">제목</label>
										<input type="text" class="ip-control" id="title" maxlength="30" 
											   name="title" placeholder="제목을 30자 이내로 작성해주세요.">
										<span id="titleMsg" class="msg"></span>
									</div>
									
									<div class="r-control">
										<label class="lb-control">작성자</label>
										<input type="text" class="ip-control" id="writer" maxlength="20"
											   name="writer" placeholder="이름을 20자 이내로 기입해주세요.">
										<span id="writerMsg" class="msg"></span>
									</div>
									
									<div class="r-control">
										<label class="lb-control">내용</label>
										<textarea class="ip-control" 
												  id="content" name="content" placeholder="내용은 최대 3천자까지 입력 가능합니다"></textarea>
									</div>
								</div>	<!-- registTable -->			        		
				        		
				        		<!-- 버튼 -->
				        		<div class="t-button">
				        			<button id="subBtn" type="submit">등록</button>
		                        	<button id="listBtn" type="button" onclick="location.href='noticeList'">목록</button>
				        		</div> <!-- t-button  -->
				        		
				        	</form> <!-- registForm -->
				        	
				        </div> <!-- noticeList-form -->
				    </div> <!-- container -->
				 </div> <!-- notice -->
			</div> <!-- contents -->
		</div> <!-- wrap -->
	</section>
	
	<%@ include file="../include/footer.jsp" %>	
	<script type="text/javascript">
	
		//msg처리
		(function(){
			var msg = "${msg}";
			  
			if(msg !==''){
				alert(msg);
			}
		})();

		$(document).ready(function() {
			$('#content').on('keyup', function() {
				if($(this).val().length > 3000) {
					alert("최대 글자수는 5천자 입니다");
					$(this).val($(this).val().substring(0, 3000));
				}
			});
		});
	</script>

</body>
</html>