<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<page:applyDecorator name="header">
	<html>
<head>
<title><decorator:title default="flossom" /></title>
<link href="/LinkFlower/css/usermenu.css" rel="stylesheet">
<c:set var="pageId" value="<%=request.getServletPath()%>" />
<decorator:head />
</head>
<body>
	<div class="wrap">
		<div id="mynavbar">
			<div id="leftMenu" class="span2">

				<ul class="nav nav-tabs nav-stacked">
					<li class="${pageId == '/user/orderInfo.ap'?'active':''}"><a
						href="/LinkFlower/user/orderInfo.ap">주문조회</a></li>
					<li class="${pageId == '/user/like.ap'?'active':''}"><a
						href="/LinkFlower/user/like.ap">좋아하는꽃집</a></li>
					<li class="${pageId == '/user/info.ap'?'active':''}"><a
						id="change" href="/LinkFlower/user/info.ap">회원정보수정</a></li>
				</ul>
			</div>
		</div>
		<div class="vline span1"></div>
		<div class="contents">
			<decorator:body />
		</div>
	</div>
</body>
	</html>
</page:applyDecorator>
