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
		var lat = $("#lat").val();
		var lng = $("#lng").val();
		var mapOptions = {
			center : new google.maps.LatLng(lat, lng),
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),
				mapOptions);
		var marker = new google.maps.Marker({
			position : map.getCenter(),
			map : map,
			title : '검색된 위치'
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
	$(function() {
		$("#selectable").selectable({
			stop : function() {
				$(".ui-selected", this).each(function() {
					var index = $("#selectable li").index(this);
					alert(index);
				});
			}
		});
	});

	google.maps.event.addDomListener(window, 'load', initialize);
	google.maps.event.addDomListener(window, 'load', detectBrowser);
</script>
</head>
<body>
	<div class="wrap">
		<div id="hide">
			<input type="text" id="lat" value="${model.info.lat}"> <input
				type="text" id="lng" value="${model.info.lng}">
		</div>
		<!-- 선택한옵션${model.info.optionsRadios}, 입력한값:${value} -->
		<div id="event">
			<table class="table">
				<thead>
					<tr class="success">
						<th colspan="4"><i class="icon-asterisk"></i> 주변꽃집 이벤트</th>
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
			<span><i class="icon-asterisk"></i> 지도</span><br/>
			<div id="map_canvas"></div>
			<div id="listView">
				<ol id="selectable">
					<li class="ui-widget-content">동작화원</li>
					<li class="ui-widget-content">파란하늘</li>
				</ol>
			</div>
		</div>

		<div id="shopInfo">
		<span><i class="icon-asterisk"></i> 꽃집정보</span><br/>
			<div class="shop">
				<p>
					<span>동산화원</span><a href="#"><img id="like" width="50px" height="50px"
					src="/LinkFlower/img/like_on.jpg"></a>
				</p>
				<img alt="꽃집사진" width="150px" height="150px"
					src="/LinkFlower/img/photo.jpg">
					
				<p><span>평점 </span>8.4 / 10 (95개의 평가)</p>
				<div class="progress">
					<div class="bar" style="width: 84%;">8.4</div>
					<div class="bar bar-danger" style="width: 16%;">1.6</div>
				</div>
				
				<span>꽃집주소</span> 서울특별시 동작구 노량진동 77-4번지
			</div>
			<div class="infoList">
				<span>이벤트</span>발렌타인데이 이벤트진행중<br /><br /> <span>품목</span><br /><br />
				<div style="overflow:auto; height: 200px" ><ul>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				<li>꽃바구니(대)</li>
				</ul></div>
			</div>
			<div class="send">
				<a href="#"><button class="btn btn-large btn-success">관심꽃집등록 <i class="icon-thumbs-up"></i></button></a>
				<a href="/LinkFlower/order.ap?id=123"><button class="btn btn-large btn-info">주문하로가기</button></a>
				<br />
			</div>
		</div>


	</div>

</body>
</html>