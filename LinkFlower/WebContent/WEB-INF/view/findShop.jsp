<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/LinkFlower/css/findShop.css" rel="stylesheet">
<title>꽃집찾기</title>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
	
</script>
<script type="text/javascript">

	function initialize() {
		var lat =$("#lat").val();
		var lng= $("#lng").val();
		var mapOptions = {
			center : new google.maps.LatLng(lat, lng),
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);
		var marker = new google.maps.Marker({
		    position: map.getCenter(),
		    map: map,
		    title: '검색된 위치'
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
			mapdiv.style.width = '500px';
			mapdiv.style.height = '500px';
		}
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	google.maps.event.addDomListener(window, 'load', detectBrowser);
</script>
</head>
<body>
	<div class="wrap">
		<div id="hide" >
		<input type="text" id="lat" value="${model.info.lat}">
		<input type="text" id="lng" value="${model.info.lng}">
		</div>
		선택한옵션${model.info.optionsRadios}, 입력한값:${value}
		<div id="event">
			<table class="table">
				<thead>
					<tr class="success">
						<th colspan="4">● 주변꽃집 이벤트</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="">동작화원</a></td>
						<td>발렌타인데이 이벤트진행중</td>
						<td>2014.4.2</td>
						<td>132</td>
					</tr>

					<tr>
						<td>2</td>
						<td><a href="">파란하늘</a></td>
						<td>화이트데이 이벤트 진행중 <span class="label label-success">New</span></td>
						<td>2014.4.6</td>
						<td>321</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="map">
			<p>● 지도</p>
			<div id="map_canvas" style="width: 500px; height: 500px"></div>
			<div id="listView"></div>
		</div>

		<br /> 꽃집골랐다고 치고 <a href="/LinkFlower/order.ap?id=123"><button
				class="button">주문하기</button></a> <br />
	</div>

</body>
</html>