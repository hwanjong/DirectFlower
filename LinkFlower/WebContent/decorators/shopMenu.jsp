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
<link href="/LinkFlower/css/common.css" rel="stylesheet" type="text/css">
<c:set var="pageId" value="<%=request.getServletPath()%>" />
<decorator:head />
</head>
<body>
	<div class="wrap">
		<div id="mynavbar">
			<div id="leftMenu" class="span2">

				<ul class="nav nav-tabs nav-stacked">
					<li class="${pageId == '/shop/adminSale.ap'?'active':''}"><a
						href="/LinkFlower/shop/adminSale.ap">판매관리</a></li>
					<li class="${pageId == '/shop/adminShop.ap'?'active':''}"><a
						href="/LinkFlower/shop/adminShop.ap">매장관리</a></li>
					<li class="${pageId == '/shop/adminEvent.ap'?'active':''}"><a
						href="/LinkFlower/shop/adminEvent.ap">이벤트관리</a></li>
					<li class="${pageId == '/shop/saleAuction.ap'?'active':''}"><a
						href="/LinkFlower/shop/saleAuction.ap">주변역경매조회/신청</a></li>
					<li class="${pageId == '/user/info.ap'?'active':''}"><a
						href="/LinkFlower/order.ap?id=${user.shopNum}">내꽃집정보</a></li>
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
