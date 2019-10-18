<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#login{
	width:390px;
	padding:20px;
	margin:100px auto ;
	text-align: center;
}
#login > p > label{
	display: inline-block;
	width:80px;
}
#login > input[type="submit"]{
	display: block;
	width:60px;
	margin:0 auto;
}
	
</style>

	<form action = "login.do" method = "post">
		<fieldset id = "login">
			<p>
				<label>아이디</label>
				<input type = "text" name = "uId">
				<span class = "error">※아이디를 입력하세요</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type = "password" name = "uPassword">
				<span class = "error">※비밀번호를 입력하세요</span>
			</p>
			<input type = "submit" value = "로그인">
		</fieldset>
		<c:if test = "${IDnotMatch != null || PWnotMatch != null}">
			<p id = "err">
				<span class = "error2"> 
					※존재하지 않는 아이디 이거나 비밀번호가 일치하지 않습니다.
				</span>
			</p>
		</c:if>
	</form>
<%@ include file = "../include/footer.jsp" %>