<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('input[name=passwordOk]')
								.blur(
										function() {
											var userPW = $("input[name=pwd]")
													.val();
											var userPWok = $(
													"input[name=passwordOk]")
													.val();
											var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,12}/);
											if (userPW != userPWok) {
												$("#pwdck").focus();
												var html = "<tr><td colspan='3' style='color: red'>비밀번호가 다릅니다.</td></tr>";
												$('#error_next_box1').empty();
												$('#error_next_box1').append(
														html);
											} else if (userPW.search(/\s/) != -1) {
												$("#pwd").focus();
												var html = "<tr><td colspan='3' style='color: red'>빈공간없이 작성해 주세요.</td></tr>";
												$('#error_next_box1').empty();
												$('#error_next_box1').append(
														html);
											} else if (!pwCheck.test(userPW)) {
												$("#pwd").focus();
												var html = "<tr><td colspan='3' style='color: red'>비밀번호는 영문대.소문자, 숫자, 특수문자만 입력가능하고 6에서 12자리이하로 입력 바랍니다.</td></tr>";
												$('#error_next_box1').empty();
												$('#error_next_box1').append(
														html);
											} else {
												var html = "<tr><td colspan='3' style='color: green'>사용가능한 비밀번호 입니다.</td></tr>";
												$('#error_next_box1').empty();
												$('#error_next_box1').append(
														html);
											}
										});

					});

	function idfind() {
		var userId = $('#memId').val();
		var idReg = /^[A-Za-z0-9_\-]{5,100}$/;

		/*  	 	var idReg = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\,.<>\/?]).{6,12}$/);  */
		/* alert -> console.log 많이 씁니다 , 구글 F12 누르면 개발자 모드 있어요 거기서 디버깅 (이벤트 체크를 많이 해요)*/
		alert(userId);

				$.ajax({
					type : "GET",
					url : "/user/userIdFind.do",
					data : {
						'userId' : userId
					},
					success : function(date) {
						if (!idReg.test(userId)) {
							$("#memId").focus();
							var html = "<tr><td colspan='3' style='color: red'>아이디는 영문대.소문자, 숫자만 입력가능하고 6자리 이상 입력 바랍니다.</td></tr>";
							$('#error_next_box').empty();
							$('#error_next_box').append(html);
						} else if (date == 0 && $.trim($('#memId').val()) != '') {
							var html = "<tr><td colspan='3' style='color: green'>사용 가능한 ID입니다.</td></tr>";
							$('#error_next_box').empty();
							$('#error_next_box').append(html);
						} else {
							$("#memId").focus();
							var html = "<tr><td colspan='3' style='color: red'>사용 불가능한 ID 입니다.</td></tr>";
							$('#error_next_box').empty();
							$('#error_next_box').append(html);
						}
					},
					error : function(date) {
						alert("서버오류")
					}

				});
	};

	function insert() {
		$("#sendForm").submit();
	};
</script>

<div class="container" style="margin-top: 50px">
	<form class="form-horizontal" id="sendForm"
		action="/user/userIDinsert.do">
		<div class="form-group">
			<label class="col-sm-2 control-label">ID</label>
			<div class="col-sm-4">
				<input class="form-control" id="memId" name="userId" type="text"
					value="" title="ID">
			</div>
			<div class="container">
				<button type="button" id="idcked" class="btn btn-default"
					style="display: block;" onclick="idfind()">ID 중복 체크</button>
			</div>
			<div id="error_next_box" style="float: left; margin-left: 210px">
			</div>
		</div>

		<div class="form-group">
			<label for="disabledInput " class="col-sm-2 control-label">패스워드</label>
			<div class="col-sm-4">
				<input class="form-control" id="pwd" name="pwd" type="password"
					title="패스워드">
			</div>
			<label for="disabledInput " class="col-sm-2 control-label">패스워드
				확인</label>
			<div class="col-sm-4">
				<input class="form-control" id="pwdck" name="passwordOk"
					type="password" title="패스워드 확인">
			</div>
		</div>
		<div id="error_next_box1"
			style="float: left; margin-left: 210px; margin-top: 4px; margin-bottom: 3px; width: 100%;"></div>
		<div class="form-group">
			<label for="disabledInput" class="col-sm-2 control-label">이름</label>
			<div class="col-sm-4">
				<input class="form-control" id="memName" name="userName" type="text"
					value="" title="이름">
			</div>
		</div>


		<div class="col-md-offset-4">
			<button type="button" id="saveBtn" class="btn btn-primary"
				onclick="insert()">저장</button>
			<button type="button" id="#" class="btn btn-danger"
				onclick="location.href='/login/login.do'">취소</button>
		</div>
	</form>
</div>


