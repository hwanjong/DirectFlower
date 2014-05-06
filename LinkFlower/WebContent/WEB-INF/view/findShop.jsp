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
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
	
</script>


<script type="text/javascript">
	var map;
	var infoWindow;
	var markerList = [];
	function initialize() {
		var lat = '${model.info.lat}';
		var lng = '${model.info.lng}';
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

		<c:forEach items="${model.shopList}" var="item">
		var myLatLng = new google.maps.LatLng("${item.shopLat}",
				"${item.shopLng}");
		var name = "${item.shopName}";
		var shopNum = "${item.shopNum}";

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
			$("#select").val(name + ", " + shopNum);
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
			mapdiv.style.width = '500px';
			mapdiv.style.height = '500px';
		} else {
			var mapdiv = document.getElementById("map_canvas");
			mapdiv.style.width = '500px';
			mapdiv.style.height = '500px';
		}
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	google.maps.event.addDomListener(window, 'load', detectBrowser);

	$(document).ready(function() {
		$("#select").change(function() {
			alert("값바뀜");
		});

		$("#auction").dialog({
			autoOpen : false,
			height : 550,
			width : 850,
			modal : false,
		});
	});

	function checkDelivery() {
		if ($("input[name=optionsRadios]:checked").val() == "option1") {
			$("#address").hide();
		} else {
			$("#address").show();
		}
	}

	function infoCheck() {
		if ($("#infobox").css("display") == "none") {
			$("#infobox").show();
		} else {
			$("#infobox").hide();
		}
	}

	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<div class="wrap">
		<div id="event">
			<p class="title">
				<i class=" icon-th-list"></i> 주변 인기 이벤트 TOP 5
			</p>
			<table class="table" style="margin-bottom: 0px;">
				<tbody>
					<tr>
						<th style="width: 70px;">번호</th>
						<th style="width: 200px;">화원이름</th>
						<th>이벤트</th>
						<th style="width: 70px;">인기도</th>
					</tr>
				</tbody>
			</table>

			<div class="bodyTable" style="overflow: auto; height: 150px;">
				<table class="table">
					<tbody>
						<c:forEach var="shop" items="${model.shopList}">
							<tr>
								<td style="text-indent: 2px; width: 70px;">${shop.shopNum}</td>
								<td style="width: 200px;"><a
									href="/LinkFlower/order.ap?id=${shop.shopNum}">${shop.shopName}</a></td>
								<td>${shop.eventComment}</td>
								<td style="width: 70px;">${shop.eventCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
				<p style="color: red;">
			※ 원하는 상품이 없을경우 역경매로 주변꽃집에 상품을 요청을 하세요
			<button class="btn btn-info" id="clickMenu" onclick='$("#auction").dialog("open");'>상품 요청하기</button>
			<br/><a style="font-size: 12px; color: #08c;" onclick="infoCheck()">역경매시스템이란?</a>
		</p>
		<p id="infobox" style="color: gray; display: none;">
			원하는 상품이 없거나 마음에 들지 않을 때 <br /> 고객이 주변꽃집에게 상품을 요청하고 주변 꽃집들이 판매조건을
			알려주어<br />고객이 최적 조건의 상품을 선택하는 시스템입니다.<br />
		</p>
		<div id="map">
			<p class="title">
				<i class=" icon-th-list"></i> 지도
			</p>
			<div id="map_canvas"></div>
			<div id="listView" style="overflow: auto;">
				<c:forEach var="shop" items="${model.shopList}">
					<div class="alert alert-block">
						<i class=" icon-ok-sign"></i> <a
							onclick='$("#select").val("${shop.shopName}, ${shop.shopNum}")'>
							<span>${shop.shopName}</span>
						</a> <span class="label label-important"> ${shop.eventCount}</span><br />
						위치: ${shop.shopLocation}
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="auction">
			<div id="requestForm">
				<form>
					<p class="title">
						<i class=" icon-th-list"></i> 상품요청하기(역경매시스템)
					</p>
					<p>
						<span class="w100 ib">요청상품</span><input type="text"
							name="requestName">
					</p>
					<label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios1" value="option1"
						onclick="checkDelivery()"> 방문
					</label> <label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios2" value="option2" checked
						onclick="checkDelivery()"> 배송
					</label> <span class="w100 ib">수 령 자 </span><input type="text"
						class="input-mini" id="targetName" name="targetName"> <span>
						희망날짜 </span><input class="input-medium" type="text" id="datepicker"><span>
						시간</span><select class="input-mini">
						<%
							for (int i = 0; i < 24; i++) {
						%><option><%=i%></option>
						<%
							}
						%>
					</select>시
					<p id="address">
						<span class="w100 ib">수령자연락처</span><input type="text"
					name="address" placeholder="ex) 010-1234-1234"><br />
						<span class="w100 ib">배송지주소</span><input type="text" class="input-xxlarge"
					name="address"><br />
			</p>
				</form>
			</div>
			<div class="send" style="display: block; margin: auto;">
				<a href="/LinkFlower/order.ap?id=123">
					<button class="btn btn-large btn-info">
						역 경매시작
					</button>
				</a>
			</div>
		</div>

		<div id="shopInfo">
			<p class="title">
				<i class=" icon-th-list"></i> 꽃집정보
			</p>

			<div class="shop">
				<p>
					<span>마커에서 선택된값<input type="text" id="select" value=""></span><a
						href="#"><img id="like" width="50px" height="50px"
						src="/LinkFlower/img/like_on.jpg"></a>
				</p>
				<img id="shopPhoto" alt="꽃집사진" src="/LinkFlower/img/photo.jpg">

				<p>
					<span>평점 </span>8.4 / 10 (95개의 평가)
				</p>
				<div class="progress">
					<div class="bar" style="width: 84%;">8.4</div>
					<div class="bar bar-danger" style="width: 16%;">1.6</div>
				</div>
				<p>
				<span>꽃집주소</span> 서울특별시 동작구 노량진동 77-4번지
				</p>
				<p>
				<span>전화번호</span> 010-2625-3577
				</p>
			</div>
			<div class="infoList">
				<span>이벤트</span>
				<div class="alert alert-success">발렌타인데이 이벤트진행중</div>
				<span>판매상품</span><br /> <br />
				<div class="productList" style="overflow: auto; height: 180px">
					<ul>
						<li><div class="alert alert-info">
								장미꽃 100송이 / 50,000 <span class="label label-important">특화상품</span>
							</div></li>
						<li><div class="alert alert-info">
								꽃바구니(중) / 45,000 <span class="label label-important">특화상품</span>
							</div></li>
						<li><div class="alert alert-info">
								관엽식물(집들이용) / 38,000 <span class="label label-important">특화상품</span>
							</div></li>
						<hr style="border: 1px groove; margin: 10px 0px;">
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
					</ul>
				</div>
			</div>
			<div class="send">
				<a href="#"><button class="btn btn-large btn-success">
						관심꽃집등록 <i class="icon-thumbs-up"></i>
					</button></a> <a href="/LinkFlower/order.ap?id=123"><br /> <br />
					<button class="btn btn-large btn-info">주문하로가기</button></a> <br />
			</div>
		</div>
	</div>

</body>
</html>