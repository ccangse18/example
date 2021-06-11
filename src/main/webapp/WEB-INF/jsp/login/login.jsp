<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function login() {
	$("#sendForm").submit();
};
</script>


<form id="sendForm" action="login/loginOK.do">

	<input type="hidden" id="platform" name="platform" value="">
	<div class="container col-md-offset-2 col-sm-6" style="margin-top: 100px;">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				<input id="memId" type="text" class="form-control valiChk" name="userId" placeholder="id" title="ID">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input id="memPassword" type="password" class="form-control valiChk" name="pwd" placeholder="Password" title="Password">
			</div>
			<br />
			<c:choose>
				<c:when test="${error } != null">
					<div style="color: red">${error }</div>
				</c:when>
			</c:choose>
		<br>
		<div class="col-md-offset-4">
			<button type="button" id="#" class="btn btn-primary" onclick="login()">로그인</button>
			<button type="button" id="#" class="btn btn-warning" onclick="location.href='/login/login.do'">취소</button>
			<button type="button" id="#" class="btn btn-info" onclick="location.href='/user/userInsert.do'">회원가입</button>
		</div>
	</div>
</form>

