<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notice.css">

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>

<body>
		<!-- 헤더 -->
		<header>
			<div id="header">
				<div class="container">
					<div class="header">
					
							<!-- 헤더메뉴 -->
							<div class="header-menu">
							
								<c:if test="${user == null }">
									<a href="${pageContext.request.contextPath }/">Home</a>
									<a href="${pageContext.request.contextPath }/user/loginView">Login</a>
									<a href="${pageContext.request.contextPath }/user/joinView">Join</a>
								</c:if>
								
								<c:if test="${user != null }">
									<a href="${pageContext.request.contextPath }/">Home</a>
									<a href="${pageContext.request.contextPath }/user/logout">Logout</a>
								</c:if>
							</div>
							
							<div class="header-tit">
								<h1>CLASS</h1><br>
								<p>365</p>
								
							</div>
							
					</div> <!-- header -->
				</div> <!-- container -->
			</div> <!-- header -->
		</header>
		<!-- 헤더 끝 -->    