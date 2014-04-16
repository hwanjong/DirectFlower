<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/LinkFlower/css/userinfo.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<form class="form-horizontal">
		<div class="control-group">
			<label class="control-label" for="inputEmail">I D</label>
			<div class="controls">
				<input type="text" id="inputId" placeholder="Id" value="hwan7287">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputPassword">Password</label>
			<div class="controls">
				<input type="password" id="inputPassword" placeholder="Password" value="357735">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputPassword">Password
				Confirm</label>
			<div class="controls">
				<input type="password" id="inputPassword2" placeholder="Password">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">Name</label>
			<div class="controls">
				<input type="text" id="inputPhoneNumber" placeholder="Name"
					value="최환종">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">Phone Number</label>
			<div class="controls">
				<input type="text" id="inputPhoneNumber" placeholder="PhoneNumber"
					value="010-2625-3577">
			</div>
		</div>

		<div class="control-group">
			<div class="controls">
				<button type="submit" class="btn btn-danger">취 소</button>
				<button type="submit" class="btn btn-success">정보수정</button>
			</div>
		</div>
	</form>

</body>
</html>