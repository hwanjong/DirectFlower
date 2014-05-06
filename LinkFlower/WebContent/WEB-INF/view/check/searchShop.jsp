<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/LinkFlower/css/login.css" rel="stylesheet">
<link href="/LinkFlower/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Search Shop</title>
<style type="text/css">
#wrap {
	margin-top: 3%;
	margin-left: 3%;
	width: 400px;
	height: 400px;
}

a {
	color: #c71585;
	text-decoration: underline;
	font-size: 15pt;
}

a:HOVER {
	color: green;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function check(lat, lng) {
		alert("주소값찾음 : ("+lat + ", " + lng+")"+"\n꽃집찾기버튼을 눌려주세요");
		opener.document.getElementById("lat").value = lat;
		opener.document.getElementById("lng").value = lng;
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap" style="overflow: auto;">
		<i class="icon-ok"></i> <span style="font-size: 15pt;"> 검색된 꽃집</span>
		<hr style="border: 1px solid;">
		<c:if test="${empty model.shopList}">검색된 꽃집이 없습니다.</c:if>
		<c:forEach var="shop" items="${model.shopList}">
			<div class="alert alert-block">
				<i class=" icon-ok-sign"></i> <a
					onclick="check('${shop.shopLat}','${shop.shopLng}')"> <span>${shop.shopName}</span></a>
				위치: ${shop.shopLocation} <span class="label label-important">
					${shop.eventCount}</span>
			</div>
		</c:forEach>

	</div>


</body>
</html>