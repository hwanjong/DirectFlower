<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃집찾기</title>
</head>
<body>
	<div class="wrap">
		--받아온정보- -<br/>선택한옵션${model.user.userId} <br /> 입력한값:${value}<br/>
		
		꽃집골랐다고 치고 <a href="/LinkFlower/order.ap?id=123"><button class="button">주문하기</button></a>
	</div>
</body>
</html>