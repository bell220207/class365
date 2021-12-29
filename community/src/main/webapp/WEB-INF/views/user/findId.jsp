<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>ID 찾기</title>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search.css">
</head>
<body>

	<section>
	    <div class="wrap" style="margin: 0 auto;">
	    	<div class="contents">
		    	<div class="container">
		            <div class="box">
		                
		                <form action="find_id" class="SearchForm" name="findform" method="post">
		                	<div class="titlebox">아이디 찾기</div>
		
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
		                            <input type="text" class="form-control phone2" name="phone" id="phone" placeholder="전화번호 입력">
		                        </div>
		                    </div>                   
		
		                    <div class="btn_area">
		                        <button type="submit" id="SearchBtn" >검색하기</button>
		                    </div>
		                    
		                   	<!-- 전화번호가 일치하지 않을 때-->
							<c:if test="${check == 1}">
								<script>
								//	opener.document.findform.com.value = com;
								//	opener.document.findform.mobile.value = ${phone};
								</script>
								<label>일치하는 정보가 존재하지 않습니다.</label>
							</c:if>
		
							<!-- 전화번호가 일치할 때 -->
							<c:if test="${check == 0 }">
								<script>
								//	opener.document.findform.com.value = com;
								//	opener.document.findform.mobile.value = ${phone};
								</script>
								<label>찾으시는 아이디는 '${id}' 입니다.</label>
								<div class="#">
								<br>
									<input type="button" value="닫기" 
										   onclick="closethewindow()"
										   id="CloseBtn">
								</div>
							</c:if>
		                </form> 
		                
		            </div> <!-- box -->
	            </div> <!-- container -->
	        </div> <!-- contents -->
	    </div> <!-- wrap -->
	</section>

	<script type="text/javascript"> // 닫기 버튼
		function closethewindow(){
		self.close();
		}
	</script>
	
   	<script> // 유효성 검사
	
		$("#SearchBtn").click(function(){

			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    	var phone = $("#phone").val();
			
			if($("#com").val()=="통신사"){
    			alert("통신사 선택은 필수입니다");
    			return;
    			
    		}else if($("#phone").val().length==''){
    			alert("전화번호 입력은 필수입니다");
    			return;
    		}else if(phone.match(regPhone) == null){
    			alert("휴대폰 번호가 올바른 형식이 아닙니다");
    			return;
				
			} else {
				document.SearchForm.submit();
			}
		});
	
    </script>
</body>
</html>