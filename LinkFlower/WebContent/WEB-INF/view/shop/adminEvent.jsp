<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트관리</title>
</head>
<body>
	<p>이벤트관리</p>
	<div class="subContents">
		<p class="title">
			<i class=" icon-th-list"></i> 내 꽃집을 좋아하는 고객
		</p>
		
		<p style="width: 80%; height: 80%; overflow: auto; margin-left: 30px;">
		<c:forEach var="user" items="${model.likeUserList}">
		이름 : ${user.name} / Phone : ${user.phoneNum }<br>
		</c:forEach>
		
		</p>

	</div>
	<div class="subContents">
		<p class="title">
			<i class=" icon-th-list"></i>이벤트 변경
		</p>
		<input class="span5" type="text" value="선인장 1+1 행사">
		<button type="button" class="btn btn-success" style="margin-bottom: 10px;">변경</button>
		<br/>
		<button type="button" class="btn btn-large btn-primary" style="margin: 30px; margin-left: 30%;" onclick='alert("내고객 들에게 -이벤트 메시지-를 전송하였습니다. ")'>이벤트 알림 Push전송</button>
	</div>
</body>
</html>