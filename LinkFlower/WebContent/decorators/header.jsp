<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>

<decorator:head />
</head>
<body>
	<div class="container">
		<div class="navbar navbar-inverse  mb0">
			<div class="navbar-inner">
				<ul class="nav">
					<li><a href="/LinkFlower/main.ap">Home</a></li>
					<li><a style="color: red" href="/LinkFlower/reauction.ap">역경매시스템</a></li>
					<li><a href="#">이용방법</a></li>
					<li><a style="color: red" href="/LinkFlower/check/searchGoogle.ap">관리자메뉴(꽃집자동가입)</a></li>
				</ul>
				<ul class="nav pull-right">
					<c:choose>
						<c:when test="${empty user}">
							<li><a href="/LinkFlower/login.ap">Login</a></li>
							<li><a href="/LinkFlower/join.ap">Join</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${user.shopNum==0}">
									<li><a href="/LinkFlower/user/orderInfo.ap">My Page</a></li>
								</c:when>
								<c:otherwise>
								<li><a href="/LinkFlower/shop/adminSale.ap">MyShop</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="/LinkFlower/logout.ap">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	
	<decorator:body />
	<div id="fb-root"></div>
</body>
</html>