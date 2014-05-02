<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<c:if test="${model.fail==true}"> <script type="text/javascript">alert("인증실패");</script></c:if>
<link href="/LinkFlower/css/login.css" rel="stylesheet">
</head>
<body>
	<div class="wrap" style="margin: auto; text-align: center;">
		<img src="/LinkFlower/img/login/banner.PNG" width="300"> <br>
		<hr width="80%" style="margin: auto;" size="3" color="green">

			<form action="/LinkFlower/login.ap" method="post">
				<table style="margin: 10px auto;">

					<tr>
						<td align="center"><img src="/LinkFlower/img/login/id.PNG"></td>
						<td><input type=text name="userId" size=30 value=""></td>
					</tr>

					<tr>
						<td align="center"><img src="/LinkFlower/img/login/pw.PNG"></td>
						<td><input type=text name="pw" size=30 value=""></td>
					</tr>

				</table>

				<hr width="80%" style="margin: auto;" size="3" color="green">

				<div class="submitForm">
					<input type="submit" class="btn" value="로그인">&nbsp; 
					<input
						type="button" class="btn" value="회원가입"
						onclick="javascript:window.location='join.ap'">
				</div>
			</form>
	</div>

</body>
</html>