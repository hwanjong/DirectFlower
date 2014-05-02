<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/LinkFlower/css/userinfo.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	$(function() {
	$(".contents").hide();
		if ('${user.pw}' == prompt("암호를 입력하세요")) {
			$(".contents").show();		
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			window.location.href = "/LinkFlower/user/orderInfo.ap";
		}
	});
	
	function submitButton(){
		if($("#inputId").val()==""||$("#inputPassword").val()==""
			||$("#inputPassword2").val()==""||$("#inputName").val()==""
			||$("#inputPhoneNumber").val()==""){
		alert("빈칸없이 입력하세요");
	}else{
		if($("#inputPassword").val()==$("#inputPassword2").val()){
			$("#inputId").attr("disabled",false);
			$("form").submit();
		}else{
			$("#confirm").html('비밀번호 불일치!');
		}
	}
		
	}
</script>
</head>
<body>
	<form class="form-horizontal" method="POST" action="/LinkFlower/user/info.ap">
		<div class="control-group">
			<label class="control-label" for="inputEmail">I D</label>
			<div class="controls">
				<input type="text" id="inputId" placeholder="Id" name="userId" disabled value="${user.userId}">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputPassword">Password</label>
			<div class="controls">
				<input type="password" id="inputPassword" placeholder="Password" name="pw" value="${user.pw}">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputPassword">Password
				Confirm</label>
			<div class="controls">
				<input type="password" id="inputPassword2" placeholder="Password"> <span id="confirm" style="color: red;"></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">Name</label>
			<div class="controls">
				<input type="text" id="inputName"  placeholder="Name" name="name"
					value="${user.name}">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">Phone Number</label>
			<div class="controls">
				<input type="text" id="inputPhoneNumber" name="phoneNum" placeholder="PhoneNumber"
					value="${user.phoneNum}">
			</div>
		</div>

		<div class="control-group">
			<div class="controls">
				<button type="button" class="btn btn-danger" onclick="window.location.reload()">취 소</button>
				<button type="button" class="btn btn-success" onclick="submitButton()">정보수정</button>
			</div>
		</div>
	</form>

</body>
</html>