<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>공지사항 작성</title>

	<%@ include file="../include/header.jsp" %>	
	<section>
		<div class="wrap">		
			<div id="contents">
				<div class="notice">
					<div class="container">
				        <div class="noticeDetail-form">
				        	
				        	<div class="titlebox">
                            	<p>상세보기</p>
                        	</div>
				        	
				        	<form action="noticeDetail" method="post">
				        		
								<div class="detailTable">
								
									<div class="r-control">
		                                <label class="lb-control">날짜</label>
		                                <input class="ip-control" name="regDate" value="${vo.regdate }" readonly>
	                            	</div>  	
								
									<div class="r-control">
										<label class="lb-control">번호</label>
										<!-- 하지만 보여지는 거는 인덱스로 처리를 해야 한다 -->
										<!-- 타입 히든으로 줘야 수정이랑 삭제 등이 잘 처리될거임-->
										<input class="ip-control" name="bno" value="${vo.bno }" readonly>
									</div>
									
									

									<div class="r-control">
										<label class="lb-control">제목</label>
										<input class="ip-control" id="title" name="title" value="${vo.title }" readonly>
									</div>
									
									<div class="r-control">
										<label class="lb-control">작성자</label>
										<input class="ip-control" id="writer" name="writer" value="${vo.writer }" readonly>
									</div>
									
									<div class="r-control">
										<label class="lb-control">내용</label>
										<textarea class="ip-control" id="content" name="content" readonly>${vo.content }</textarea>
									</div>
								</div>	<!-- registTable -->			        		
				        		
				        		<!-- 버튼 -->
				        		<div class="t-button">
				        			<button type="button" id="modBtn" onclick="location.href='noticeModify?bno=${vo.bno}'">수정</button>
		                        	<button type="button" id="listBtn" onclick="location.href='noticeList'">목록</button>
				        		</div> <!-- t-button  -->
				        		
				        	</form> <!-- registForm -->
				        	
				        </div> <!-- noticeList-form -->
				    </div> <!-- container -->
				 </div> <!-- notice -->
			</div> <!-- contents -->
		</div> <!-- wrap -->
	</section>
	
	<%@ include file="../include/footer.jsp" %>	
	<script>
	   //msg처리
	  (function(){
		  var msg = "${msg}";
		  
		  if(msg !==''){
			  alert(msg);
		  }
	  })();
	</script>
</body>
</html>