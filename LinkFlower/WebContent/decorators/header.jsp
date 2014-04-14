<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<title><decorator:title default="flossom" /></title>
<link href="/LinkFlower/css/bootstrap.min.css" rel="stylesheet">
<link href="/LinkFlower/css/header.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<decorator:head />
</head>
<body>
	<div class="container">
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<ul class="nav">
					<li><a href="/LinkFlower/main.ap">Home</a></li>
					<li><a href="#">Shop</a></li>
					<li><a href="">About</a></li>
				</ul>
				<ul class="nav pull-right">
					<li><a href="login.ap">Login</a></li>
					<li><a href="join.ap">Join</a></li>
					<li><a href="user/orderInfo.ap">My Page</a></li>
				</ul>
			</div>
		</div>
	</div>
	<decorator:body />
	<div id="fb-root"></div>
</body>
</html>