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
                            	<p>수정하기</p>
                        	</div>
				        	
				        	<form action="noticeUpdate" method="post">
				        		
								<div class="updateTable">
								
									<div class="r-control">
		                                <label class="lb-control">날짜</label>
		                                <input class="ip-control" name="regDate" value="${vo.regdate }" readonly>
	                            	</div>  	
								
									<div class="r-control">
										<label class="lb-control">번호</label>
										<input class="ip-control" name="bno" value="${vo.bno }" readonly>
									</div>

									<div class="r-control">
										<label class="lb-control">제목</label>
										<input class="ip-control" id="title" name="title" value="${vo.title }" required>
									</div>
									
									<div class="r-control">
										<label class="lb-control">작성자</label>
										<input class="ip-control" id="writer" name="writer" value="${vo.writer }" required>
									</div>
									
									<div class="r-control">
										<label class="lb-control">내용</label>
										<textarea class="ip-control" id="content" name="content">${vo.content }</textarea>
									</div>
								</div>	<!-- registTable -->			        		
				        		
				        		<!-- 버튼 -->
				        		<div class="t-button">
		                        	<button type="button" id="listBtn" onclick="location.href='noticeList'">목록</button>
				        			<button type="submit" id="upBtn">변경</button>
				        			<button type="button" id="delBtn" onclick="location.href='noticeDelete?bno=${vo.bno}'">삭제</button>
				        		</div> <!-- t-button  -->
				        		
				        	</form> <!-- registForm -->
				        	
				        </div> <!-- noticeList-form -->
				    </div> <!-- container -->
				 </div> <!-- notice -->
			</div> <!-- contents -->
		</div> <!-- wrap -->
	</section>
	
	<%@ include file="../include/footer.jsp" %>	

</body>
</html>