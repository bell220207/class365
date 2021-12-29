<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>CLASS 365</title>

	<%@ include file="include/header.jsp" %>		
	<!-- 본문 -->
	<section>
		<div class="wrap">
			<div id="contents">
			
				<!-- cont_nav -->
				<div id="cont_nav" class="nav_bar">
					<div class="container">	
						<ul class="nav">
								<li><a href="${pageContext.request.contextPath }/class/classView">CLASS</a></li>
								<li><a href="${pageContext.request.contextPath }/notice/noticeList">NOTICE</a></li>
								<li><a href="${pageContext.request.contextPath }/review/reviewView">REVIEW</a></li>
						</ul> <!-- nav -->
					</div>	
				</div> <!-- cont_nav -->
				
				<!-- cont_cont -->
				<div id="cont_cont">
					<div class="container">
						<div class="cont">
							
							<div class="column col1">
								<h3><span class="ico_img ir_pm">아이콘1</span><span class="ico_tit">공지사항</span></h3>
								<p class="ico_desc">최근 공지사항입니다</p>
								
								<!-- 1. 기본 게시판 -->
								<div class="notice">
									<h4>최신 공지사항</h4>
									<ul>
									<c:forEach var="vo" begin="1" end="10" step="1" items="${list}" varStatus="i">
										
										<li><a href="noticeDetail?bno=${vo.bno}">${vo.title}</a>
											<span><fmt:formatDate value="${vo.regdate}" pattern="yy/MM/dd" /></span>
										</li>
									</c:forEach>
									</ul>

									<a href="#" class="more">더보기</a>

								</div> <!-- 게시판 끝 -->
							</div> <!-- col1 -->
							
							<div class="column col2">
								<h3><span class="ico_img ir_pm">아이콘2</span><span class="ico_tit">클래스</span></h3>
								<p class="ico_desc">현재 개설되어 있는 클래스입니다</p>	
								<!-- 3. 사진 뜨는 게시판 -->
								<div class="notice3">
									<h4>최신 클래스</h4>
									<ul>							
										<li>
											<a href="#">
												<img src="${pageContext.request.contextPath }/resources/img/dummy.png" alt="이미지 1">
												<strong>예시1</strong>
												<span>클래스에 대한 한줄 설명이 이어질 예정입니다</span>
											</a>
										</li>
									</ul>								
									<a href="#" class="more">더보기</a>
								</div>
							</div> <!-- col2 -->
							
							<div class="column col3">
								<h3><span class="ico_img ir_pm">아이콘3</span><span class="ico_tit">리뷰</span></h3>
								<p class="ico_desc">클래스 수강생들의 리뷰입니다</p>	
								<!-- 마우스 오버 효과 -->
								<div class="notice_hover">
									<h4>인기 리뷰</h4>
									<ul>
										<li>
											<a href="#">
												<span>
													<img src="${pageContext.request.contextPath }/resources/img/dummy_600.jpg" alt="이미지1">
													<em>바로가기</em>
												</span>
												<strong>리뷰 제목</strong>
											</a>
										</li>
									</ul>
								</div>
														
							</div> <!-- col3 -->
							
						</div> <!-- cont -->		
					</div> <!-- container -->
				</div> <!-- cont_cont -->
			</div> <!-- contents -->
			<!-- 콘텐츠 끝 -->
		</div> <!-- wrap -->
	</section>	
	<%@ include file="include/footer.jsp" %>	
</body>
</html>
 


		