<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<page:applyDecorator name="header">
	<html>
<head>
<title><decorator:title default="flossom" /></title>
<link href="/LinkFlower/css/usermenu.css" rel="stylesheet">
<decorator:head />
</head>
<body>
	<div class="wrap">
		<div id="mynavbar">
			<div id="leftMenu" class="span2">
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="#" class=>주문조회</a></li>
					<li><a href="#">회원정보수정</a></li>
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
