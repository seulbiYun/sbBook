<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>  
<style>
	#detailBody{
		width: 1000px;
		margin:20px auto;
		padding:20px;
	}
	#dImg{
		width:350px;
		height: 500px;
		display: block;
		float: left;
		margin:0 30px 20px 0;
		box-shadow: 2px 2px 5px #A4A4A4;
	}
	#text{
		float:left;
	}
	#dTitle{
		color:#5858FA;
	}
	#dName{
		font-size:14px;
		color:#848484;
	}
	#dPrice{
		font-size:14px;
		color:#848484;
	}
	#dPrice > span{
		font-size:18px;
		color:#5858FA;
		font-weight: bold;
	}
	#dCount{
		font-size:14px;
		color:#848484;
	}
	#dCar > button{
		background-color: #CED8F6;	
		border-radius: 5px;
		border:noen;
		padding:3px;
		outline: none;
		color:#5858FA;
	}
	#content{
		padding:20px;
		border: 2px dotted #919FFF;
		clear: both;
	}
</style>  
<div id = "detailBody">
	<img src = "${pageContext.request.contextPath }/upload/${prd.pFile}" id = "dImg">
	<div id = "text">
		<h1 id = "dTitle">${prd.pTitle }</h1>
		<p id = "dName"><span>${prd.pName } | ${prd.pRegdate } | ${prd.pPublisher }</span></p>
		<p id = "dPrice">판매가 <span>${prd.pPrice }원</span></p>
		<p id = "dCount">상품개수 
			<select id = "count">
				<c:forEach var = "n" begin="1" end = "10" step="1">
					<option>${n }</option>
				</c:forEach>
			</select>
		</p>
		<p id = "dCar">
			<button id = "btnCart" data-pNo="${prd.pNo}">장바구니</button>
			<button id = "btnOrder">주문하기</button>
		</p>
	</div>
	<div id = "content">
		${prd.pDetail } 
	</div>
</div>  
<script>
	$("#btnCart").click(function(){
		var count = $("#count").val();
		var pNo = $(this).attr("data-pNo");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/cart/add.do",
			type:"get",
			data:{"count":count,"pNo":pNo},
			dataType:"json",
			success:function(res){
				console.log(res);
				if(res.result == -1){
					alert("로그인 후 이용하세요.");
				}	
			},
			error:function(e){
				console.log(e);
			}
			
		})
	})
</script>
<%@ include file = "../include/footer.jsp" %>