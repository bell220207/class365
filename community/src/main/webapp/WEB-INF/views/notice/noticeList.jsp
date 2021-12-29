<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>공지사항</title>
<%@ include file="../include/header.jsp" %>	
	
	<section>
		<div class="wrap">		
			<div id="contents">
				<div class="notice">
					<div class="container">
				        <div class="noticeList-form">
				        
				        	<div class="titlebox"><p>공지사항</p></div>
				        	
			        		<!-- 몇 개씩 보기 버튼 -->
				        	<div class="search-wrap" >
		                        <select class="search-select" style="width:120px"  onChange="handleChange(this)">
		                           <option value="10" ${pageVO.amount eq 10 ? 'selected' : ''}>10개 보기</option>
		                           <option value="20" ${pageVO.amount eq 20 ? 'selected' : ''}>20개 보기</option>
		                           <option value="50" ${pageVO.amount eq 50 ? 'selected' : ''}>50개 보기</option>
		                           <option value="100" ${pageVO.amount eq 100 ? 'selected' : ''}>100개 보기</option>
		                        </select>
	                    	</div> <!-- search-wrap -->
	                    	
				        	<!-- 검색버튼 -->
				        	<form action="noticeList" method="get">
					    		<div class="search-wrap">
			                       <button type="submit" class="search-btn">검색</button> <!-- 검색 버튼 -->
			                       
			                       <!-- 검색내용 입력박스 -->
			                       <input type="text" class="search-input" name="searchName" value="${pageVO.cri.searchName }">
			                       
			                       <!-- 검색 종류 선택 -->
			                       <select class="form-control search-select" name="searchType">
			                            <option value="title"   ${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
			                            <option value="content" ${pageVO.cri.searchType eq 'content' ? 'selected' : '' }>내용</option>
			                            <option value="writer"  ${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
			                            <option value="titcont" ${pageVO.cri.searchType eq 'titcont' ? 'selected' : '' }>제목+내용</option>
			                       </select>
			                       
			                       <input type="hidden" name="pageNum" value="1">
			                       <input type="hidden" name="amount"  value="${pageVO.cri.amount }">
			                    </div>
			    			</form>
				        	
				        	<!-- 공지사항 테이블 -->
					        <table class="noticeTable">
					        	<colgroup>
					        		<col width="5%" />
					        		<col width="20%" />
					        		<col width="10%" />
					        		<col width="10%" />
					        		<col width="10%" />
					        	</colgroup>
					        	
							    <thead>
								    <tr>
								        <th>번호</th>
								        <th>제목</th>
								        <th>작성자</th>
								        <th>등록일</th>
								        <th>수정일</th>
								    </tr>
							    </thead>
							    
							    <tbody>
							    	<c:forEach var="vo"  items="${list }" varStatus="i" >
									    <tr>
									        <th>${i.count}</th>
									        <td> <a href="noticeDetail?bno=${vo.bno}">${vo.title }</a> </td>
									        <td>${vo.writer }</td>								        
									        <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy/MM/dd/ HH:mm" /></td>
									        <td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy/MM/dd/ HH:mm" /></td>
									    </tr>
								    </c:forEach>
							    </tbody>
							</table> <!-- 테이블 끝 -->
							
							<div class="regist"> <!-- 글쓰기 버튼 -->
								<button type="button" class="registBtn" onclick="location.href='noticeRegist'">글쓰기</button>
							</div>
							
							<form action="noticeList" name="pageForm"> <!-- 페이지 네이션 폼 -->
								<div class="text-center">
									<ul class="pagination" >
										
										<c:if test="${pageVO.prev }">
					                    	<li><a href="#" data-pagenum="${pageVO.startPage-1 }">이전</a></li>
					                    </c:if>
					                     
					                    <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
					                    	<li class="${num eq pageVO.pageNum ? 'active' : ''}">
					                       		<a href="#" data-pagenum="${num }">${num }</a>
					                    	</li>
					                    </c:forEach>
					                      
					                    <c:if test="${pageVO.next }">
					                    	<li><a href="#" data-pagenum="${pageVO.endPage+1 }">다음</a></li>
					                    </c:if> 
					                    <!-- freeList에 전달될 값을 hidden으로 처리 -->
									</ul> <!-- pagination pagination-sm -->
									
						           	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
						            <input type="hidden" name="amount" value="${pageVO.cri.amount }">
						            <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
						            <input type="hidden" name="searchName" value="${pageVO.cri.searchName }"> 
								</div> <!-- text-center -->
							</form> <!-- 페이지 네이션 폼 -->
				        
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
	  
	  function handleChange(data){
		   
		   //el태그를 이용해서 href에 경로에 searchName과 searchType을 담아서 보내주면 됩니다.
		   //mapper에서는 searchName이 공백인 경우의 처리	
		   var search = '${pageVO.cri.searchName}'
		   var searchT = '${pageVO.cri.searchType}'
		   
		   var serN=search.trim()
		   var serT=searchT.trim()
		   location.href = "noticeList?searchName="+serN+"&"+"searchType="+serT+"&pageNum=1&amount=" + data.value;
	  }
	  
	  //페이지네이션 a태그에 동일한 이벤트 거는방법(이벤트위임)
	  var pagination = document.querySelector(".pagination")
	
	  pagination.onclick = function(){
		   event.preventDefault(); // a의 고유이벤트 제거
		   //현재 클릭한 대상	   
		   if(event.target.tagName!='A') return; // a태그가 아니라면 종료
		   
		   // console.dir(event.target);
		   // console.log(event.target.tagName);
		   // console.log(event.target);
		   // console.log(event.target.dataset.pagenum); //태그의 data-이름의 값을 얻는 방법
		   //폼태그는 name속성.name속성으로 input을 선택할 수 있습니다.
		   console.log(document.pageForm.pageNum);
		   var pageNum= event.target.dataset.pagenum;
		   document.pageForm.pageNum.value=pageNum;
		   //폼 서브밋
		   document.pageForm.submit();
	  }
	</script>
</body>
</html>