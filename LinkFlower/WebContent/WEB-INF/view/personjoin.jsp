<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원</title>
<script type="text/javascript">
function openCheckId(){
	var userid=$("#inputId").val();
	if(userid){
	url="/LinkFlower/check/idcheck.ap?userid="+userid;
	window.open(url,"chkid2","width=500,height=500,menubar=no,toolbar=no");
	}else{
	alert("ID를 입력하세요!");
	}
}

function getInfo() {
	var p1 = $("#phone1").val();
	var p2 = $("#phone2").val();
	var p3 = $("#phone3").val();
	var phoneNum= p1+"-"+p2+"-"+p3;
	$("#phoneNum").val(phoneNum);
	if($("#inputId").val()==""||$("#inputPassword").val()==""
			||$("#inputPassword2").val()==""||$("#inputName").val()==""
			||$("#phone2").val()==""||$("#phone3").val()==""){
		alert("빈칸없이 입력하세요");
	}else{
		if($("#inputPassword").val()==$("#inputPassword2").val()){
			$("form").submit();
		}else{
			$("#confirm").html('비밀번호 불일치!');
		}
	}
}
</script>
<c:if test="${model.fail==true}"> <script type="text/javascript">alert("가입실패");</script></c:if>
</head>
<body>
	<div class="wrap">
		<form class="form-horizontal" method="POST" action="/LinkFlower/personjoin.ap">
			<span class="ml40 mb20 ib"><i class="icon-asterisk"></i> 간편회원가입</span>
			<div class="control-group">
				<label class="control-label" for="inputId">아이디</label>
				<div class="controls">
					<input type="text" id="inputId" placeholder="ID" name="userId">
					<button class="btn" type="button" onclick="openCheckId()">중복검사</button>
					<p>
					<span id="success"></span>
					<span id="fail" style="color: red"></span>
					</p>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputPassword">비밀번호</label>
				<div class="controls">
					<input type="password" id="inputPassword" name="pw"
						placeholder="Password">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputPassword2">비밀번호확인</label>
				<div class="controls">
					<input type="password" id="inputPassword2" name="pw2"
						placeholder="Password"><span id="confirm" style="color: red;"></span>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="inputName">이름</label>
				<div class="controls">
					<input type="text" id="inputName" name="name" placeholder="Name">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">핸드폰번호</label>
				<div class="controls">
					<select id="phone1" class="input-small">

						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>

					</select> - <input type=text class="input-mini" id="phone2" size=2 value="" maxlength="4"> - <input
						type=text class="input-mini" id="phone3" size=2 value="" maxlength="4">
				</div>
			</div>


			<div class="control-group">
				<div class="controls">
					<button type="button" style="width:200px; " class="btn btn-large btn-info " onclick="getInfo()">Sign
						in</button>
				</div>
			</div>

			<div class="hideDiv" style="display: none;">
				<input type="text" id="phoneNum" name="phoneNum" value="">
			</div>

		</form>
	</div>

</body>
</html>