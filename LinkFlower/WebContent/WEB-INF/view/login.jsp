<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login 해보까?(수정됨)</title>
</head>
<body>
	<center>
		<img src="/LinkFlower/img/login/banner.PNG" width="300"><br>
		<br>
		<hr width="55%" size="5" color="green">

		<form>
			<table>
				<tr>
					<td align="center"><img src="/LinkFlower/img/login/id.PNG"></td>
					<td><input type=text size=30 value=""></td>

				</tr>

				<tr>
					<td align="center"><img src="/LinkFlower/img/login/pw.PNG"></td>
					<td><input type=text size=30 value=""></td>

				</tr>

				<!--hr width="55%" size="5" color="green"-->
				<tr>
					<td><input type="button" value="로그인">&nbsp;
					<td><input type="button" value="회원가입"
						onclick="javascript:window.location='join.ap'">
				</tr>
			</table>
		</form>

	</center>


</body>
</html>