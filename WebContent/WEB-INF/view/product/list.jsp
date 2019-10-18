<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<style>
	#body{
		width:1024px;
		margin: 0 auto;
		padding:10px;
	}
	#body > ul{
		list-style:none;
		overflow: hidden;
		width:1100px;
		text-align: center;
		padding:0;
	}
	#body > ul > li{
		width:245px;
		height:450px;
		float: left;
		margin-right: 20px;
	}
	#body > ul > li > a > img {
		width:220px;
		height: 300px;
	}
	#body > ul > li > a > span{
		display: block;
		margin-top: 5px;
	}
	#body > ul > li > a > span.title{
		font-size: 20px;
		font-weight: bold;
		 
	}
	#body > ul > li > a > span.name{
		font-size: 13px;
		color:#848484;
	}
	#body > ul > li > a > span.price{
		font-size: 18px;
		font-weight: bold;
	}
</style>
<div id = "body">
	<ul>
		<c:forEach var = "p" items = "${list }">
			<li>
				<a href = "${pageContext.request.contextPath }/product/detail.do?pNo=${p.pNo }">
					<img src = "${pageContext.request.contextPath }/upload/${p.pFile}">
				
					<span class = "title">${p.pTitle }</span>
					<span class = "name">${p.pName } | ${p.pPublisher }</span>
					<span class = "price">${p.pPrice }</span>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
<%@ include file = "../include/footer.jsp" %>