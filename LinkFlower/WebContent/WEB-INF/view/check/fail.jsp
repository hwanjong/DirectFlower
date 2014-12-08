<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	failed. errorCode: ${model.error}
	<br />


	<c:choose>
		<c:when test="${model.error=='101'}">
						101 : (정보수정실패)동일한 핸드폰번호 있음
					</c:when>
		<c:when test="${model.error=='102'}">
					102 : 기업회원가입실패
					</c:when>
					<c:when test="${model.error=='999'}">
					999 : 슈퍼관리자 권한획득후 이용바람.
					</c:when>
		<c:otherwise>
						기타오류
					</c:otherwise>
	</c:choose>

</body>
</html>