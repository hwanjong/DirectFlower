<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/LinkFlower/css/login.css" rel="stylesheet">
<link href="/LinkFlower/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>popup Login</title>
<script type="text/javascript">
	function submitLogin() {
		$("form").submit();
		//opener.location.reload();
		opener.location.href = "/LinkFlower/main.ap";
		self.close();
	}
</script>
</head>
<body>
	<div class="wrap" style="margin-top: 50px;">
		<form class="form-horizontal" action="/LinkFlower/login.ap"
			method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">ID</label>
				<div class="controls">
					<input type="text" id="inputEmail" name="userId" placeholder="ID">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
					<input type="password" id="inputPassword" name="pw"
						placeholder="Password">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="button" class="btn" onclick="submitLogin()"
						value="로그인">
						<a href="/LinkFlower/join.ap"><input type="button" class="btn" value="회원가입"></a>
				</div>
			</div>
		</form>

	</div>
</body>
</html>