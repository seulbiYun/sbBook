<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/All.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "${pageContext.request.contextPath }/js/common.js"></script>
<script>
	$(function(){
		$("form").submit(function(){
			$(".error").css("display","none");
			
			var result = checkInputEmpty($("input[name]"));
			if(result == false){//빈 input태그가 존재하면
				return false;
			}
			
		})
	})
</script>
</head>
<body>
	<div id = "All">
		<header>
			<div id = "title">
				<h1>SB BOOK</h1>
				<div id = "a">
					<c:if test = "${Auth != null }">
						<a href = "" class = "front">${Auth }님. 반갑습니다.</a>
						<a href = "${pageContext.request.contextPath }/member/logout.do" class = "back">로그아웃</a>	
					</c:if>
					<c:if test = "${Auth == null }">
						<a href = "${pageContext.request.contextPath }/member/login.do" class = "front">로그인</a>
						<a href = "" class = "back">회원가입</a>
					</c:if>
				</div>
			</div>
			<nav id = "menu">
				<ul id = "menuBar">
					<li><a href = "#">베스트</a></li>
					<li><a href = "#">신상품</a></li>
					<li><a href = "#">IT</a></li>
					<li><a href = "#">문학</a></li>
					<li><a href = "#">인문</a></li>
					<li><a href = "#">여행</a></li>
				</ul>
			</nav>
		</header>
	</div>
