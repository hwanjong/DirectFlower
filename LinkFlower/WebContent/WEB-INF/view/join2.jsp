<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join</title>
</head>
<body>

	<form>
		<center>
			<table>

				<tr>
					<td colspan=3>
						<center>
							<img
								src="C:\Users\youkyung\workspace\Design\WebContent\img\login\배너회원.png"
								width="300">
						</center>
					</td>
				</tr>

				<tr>
					<td colspan=3>
						<hr width="100%" size="5" color="green">
					</td>
				</tr>

				<tr>
					<td align="left">아이디</td>
					<td>&nbsp;&nbsp; <input type=text size="30" value="">
					</td>
					<td>&nbsp; <input type="button" value="중복확인">
					</td>
				</tr>

				<tr>
					<td align="left">비밀번호</td>
					<td>&nbsp;&nbsp; <input type=text size="30" value="">
					</td>
				</tr>

				<tr>
					<td align="left">비밀번호 확인</td>
					<td>&nbsp;&nbsp; <input type=text size="30" value="">
					</td>
				</tr>

				<tr>
					<td align="left">휴대전화</td>

					<td>&nbsp;&nbsp; <select name="phone">

							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>

					</select>- <input type=text size=4 value="">- <input type=text
						size=4 value="">
					</td>
					<td>&nbsp; <input type="button" value="중복확인">
					</td>

				</tr>

				<tr>
					<td align="left">회원유형</td>

					<td>&nbsp;&nbsp; <input type="radio" name="member"
						value="member" checked> 일반회원 <input type="radio"
						name="member" value="store">기업고객
					</td>
				</tr>

				<tr>
					<td colspan=3>
						<hr width="100%" size="5" color="green">
					</td>
				</tr>

				<tr>
					<td colspan=3>
						<center>
							<input type="button" value="로그인">&nbsp; <input
								type="button" value="회원가입">
						</center>
					<td>
				</tr>


			</table>
		</center>
	</form>

</body>
</html>