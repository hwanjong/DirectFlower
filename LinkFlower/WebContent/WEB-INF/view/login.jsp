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
		<hr width="55%" size="3" color="green">

		<form action="/LinkFlower/login.ap" method="post">
			<table>

				<tr>
					<td align="left">회원유형<br>
					<br></td>

					<td>&nbsp;&nbsp; <input type="radio" name="member"
						value="member" checked> 일반회원 <input type="radio"
						name="member" value="store">기업고객<br>
					<br>
					</td>


				</tr>

				<tr>
					<td align="center"><img src="/LinkFlower/img/login/id.PNG"></td>
					<td><input type=text name="user_id" size=30 value=""></td>

				</tr>

				<tr>
					<td align="center"><img src="/LinkFlower/img/login/pw.PNG"></td>
					<td><input type=text name="password" size=30 value=""></td>

				</tr>

			</table>

			<hr width="55%" size="3" color="green">

		</form>
		<table>
			<tr>
				<td><input type="button" value="로그인">&nbsp;
				<td><input type="button" value="회원가입"
					onclick="javascript:window.location='join.ap'">
			</tr>
		</table>


	</center>



</body>
</html>