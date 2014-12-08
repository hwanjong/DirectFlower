<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
</script>
<script type="text/javascript">
	var map;
	var infoWindow;
	var markerList = [];
	function initialize() {
		var lat = '${model.shopInfo.shopLat}';
		var lng = '${model.shopInfo.shopLng}';
		var mapOptions = {
			center : new google.maps.LatLng(lat, lng),
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);

		setMarkers(map);
	}

	function setMarkers(map) {

		var image = {
			url : '/LinkFlower/img/marker.png',
			// This marker is 20 pixels wide by 32 pixels tall.
			size : new google.maps.Size(30, 32),
			// The origin for this image is 0,0.
			origin : new google.maps.Point(0, 0),
			// The anchor for this image is the base of the flagpole at 0,32.
			anchor : new google.maps.Point(16, 32)
		};

		<c:forEach items="${model.auctionList}" var="item">
		var myLatLng = new google.maps.LatLng("${item.auctionLat}",
				"${item.auctionLng}");
		var name = "${item.auctionName}";
		var shopNum = "${item.orderId}";

		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			icon : image,
			//shape: shape,
			title : name,
		});
		attachSecretMessage(marker, name, shopNum);
		</c:forEach>
	}

	function attachSecretMessage(marker, name, shopNum) {
		var infowindow = new google.maps.InfoWindow({
			content : name
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(marker.get('map'), marker);
		});
		google.maps.event.addListener(map, 'click', function() {
			infowindow.close();
		});
	}

	function detectBrowser() {
		var useragent = navigator.userAgent;
		var mapdiv = document.getElementById("map_canvas");

		if (useragent.indexOf('iPhone') != -1
				|| useragent.indexOf('Android') != -1) {
			mapdiv.style.width = '300px';
			mapdiv.style.height = '300px';
		} else {
			var mapdiv = document.getElementById("map_canvas");
			mapdiv.style.width = '300px';
			mapdiv.style.height = '300px';
		}
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	google.maps.event.addDomListener(window, 'load', detectBrowser);
</script>
<title>주변역경매조회/신청</title>
<script>
	$(document).ready(function() {
		$("input[name=auctionList]").click(function() {
			//alert($("input[name=auctionList]:checked").val());
			var id = $("input[name=auctionList]:checked").val();
			$("#auctionId").html(id);
			$("#orderId").val(id);
		});
	});
</script>
</head>
<body>
	<p>역경매조회 및 신청</p>
	
	<p class="title">
		<i class=" icon-th-list"></i> 주변 역경매 리스트 (반경 5km 이내)
	</p>
	<div id="map_canvas"></div>
	<table class="table">
		<thead>
			<tr>
				<th width="30px">선택</th>
				<th width="30px">경매번호</th>
				<th>요청상품</th>
				<th width="30px">방문</th>
				<th>배송지</th>
				<th width="50px">수령인</th>
				<th>수령자<br>연락처
				</th>
				<th>요청시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="auction" items="${model.auctionList}">
				<c:choose>
					<c:when test="${auction.visit=='O'}">
						<tr style="background-color: #86E57F">
							<td><input type="radio" name="auctionList"
								value="${auction.orderId}"></td>
							<td>${auction.orderId}</td>
							<td>${auction.auctionName}</td>
							<td>${auction.visit}</td>
							<td>(방문신청)</td>
							<td>${auction.targetName}</td>
							<td>(방문신청)</td>
							<td>${auction.requestTime}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td><input type="radio" name="auctionList"
								value="${auction.orderId}"></td>
							<td>${auction.orderId}</td>
							<td>${auction.auctionName}</td>
							<td>${auction.visit}</td>
							<td>${auction.targetAddress}</td>
							<td>${auction.targetName}</td>
							<td>${auction.targetPhone}</td>
							<td>${auction.requestTime}</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</tbody>
	</table>

	<div
		style="border: 1px solid blue; margin-bottom: 50px; padding: 20px;">
		<p>신청하기</p>
		<form action="applyAuction.ap" method="post">
			<input type="text" id="orderId" name="orderId" style="display: none;">
			<table class="table" style="margin-top: 50px;">
				<thead>
					<tr>
						<th>경매번호</th>
						<th>역경매신청가격</th>
						<th>신청상품사진</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="auctionId">-</td>
						<td><input type="text" name="price" placeholder="25000"></td>
						<td><input type="file"></td>
					</tr>
				</tbody>
			</table>
			<button type="submit" class="btn btn-large btn-success" style="margin-left: 38%">역경매
				신청</button>
		</form>
	</div>
</body>
</html>