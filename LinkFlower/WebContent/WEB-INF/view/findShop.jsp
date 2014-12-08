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
			checkShop(shopNum);
			location.href = "#"+shopNum;
			
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
			mapdiv.style.width = '450px';
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
		$(".shopInfo").hide();
		$(".shopInfo:first").show();
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
	function checkShop(var1) {
		$(".shopInfo").hide();
		$("#"+var1).show();

	}function success() {
		if ('${user}') {
			if('${user.shopNum}'==0){
				alert("역경매신청완료");
				$("form").submit();
			}else{
				alert("꽃집회원은 신청불가!");
			}
		} else {
			alert("로그인후 이용하세요");
			url = "/LinkFlower/popupLogin.ap";
			window.open(url, "chkid",
					"width=500,height=500,menubar=no,toolbar=no");
		}
	}
	function buttonClick(var1, var2) {

		url = "/LinkFlower/check/registLike.ap?shopNum=" + var1;
		window.open(url, "chkid", "width=500,height=500,menubar=no,toolbar=no");
		alert(var2 + "(" + var1 + ")이 관심꽃집으로 등록되었습니다.");
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
						<c:forEach var="shop" items="${model.shopList}" begin="0" end="4" varStatus="status">
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
			※ 원하는 상품이 주변꽃집에 없을경우 역경매로 상품을 요청을 하세요
			<button class="btn btn-danger" id="clickMenu"
				onclick='$("#auction").dialog("open");'>역경매 요청하기</button>
			<br /> <a style="font-size: 12px; color: #08c;"
				onclick="infoCheck()">역경매시스템이란?</a>
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
						<i class=" icon-ok-sign"></i> <a href="#${shop.shopNum}"
							onclick='checkShop("${shop.shopNum}")'> <span>${shop.shopName}</span>
						</a> <span class="label label-important"> ${shop.scoreAverage}</span><br />
						위치: ${shop.shopLocation}
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="auction">
			<form action="auction.ap" method="POST">
				<div id="requestForm">
					<p class="title">
						<i class=" icon-th-list"></i> 상품요청하기(역경매시스템)
					</p>
					<p>
						<span class="w100 ib">요청상품</span><input type="text"
							name="auctionName">
					</p>
					<label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios1" value="option1"
						onclick="checkDelivery()"> 방문
					</label> <label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios2" value="option2" checked
						onclick="checkDelivery()"> 배송
					</label> <span class="w100 ib">수 령 자 </span><input type="text"
						class="input-mini" id="targetName" name="targetName"> <span>
						희망날짜 </span><input class="input-medium" name="requestTime" type="text"
						id="datepicker"><span> 시간</span><select class="input-mini" name="requestHour">
						<%
							for (int i = 0; i < 24; i++) {
						%><option><%=i%></option>
						<%
							}
						%>
					</select>시
					<p id="address">
						<span class="w100 ib">수령자연락처</span><input type="text"
							name="targetPhone" placeholder="ex) 010-1234-1234"><br />
						<span class="w100 ib">배송지주소</span><input type="text"
							class="input-xxlarge" name="targetAddress"><br />
					</p>
				</div>
				<div class="send" style="display: block; margin: auto;">
					<button type="button" class="btn btn-large btn-info" onclick="success()">역 경매시작</button>
				</div>
				<input name="auctionLat" value='${model.info.lat}' style="display: none">
				<input name="auctionLng" value='${model.info.lng}' style="display: none">
			</form>
		</div>

		<p class="title">
			<i class=" icon-th-list"></i> 꽃집정보
		</p>

		<c:forEach var="shop" items="${model.shopList}">
			<div id="${shop.shopNum}" class="shopInfo">
				<div class="shop">
					<p>
						<span>${shop.shopName}</span><a href="#"><img id="like"
							width="50px" height="50px" src="/LinkFlower/img/like_on.jpg"></a>
					</p>
					<img id="shopPhoto" alt="꽃집사진" src="/LinkFlower/img/photo.jpg">

					<p>
						<span>평점 </span>${shop.scoreAverage} / 10
						(${shop.postingList.size()}개의 평가)
					</p>
					<div class="progress">
						<div class="bar" style="width: ${shop.scoreAverage*10}%;">${shop.scoreAverage}</div>
						<div class="bar bar-danger"
							style="width: ${(10-shop.scoreAverage)*10}%;">${10-shop.scoreAverage}</div>
					</div>
					<p>
						<span>꽃집주소</span>${shop.shopLocation}
					</p>
					<p>
						<span>전화번호</span> ${shop.phoneNum}
					</p>
				</div>
				<div class="infoList">
					<span>이벤트</span>
					<div class="alert alert-success">${shop.eventComment}</div>
					<span>판매상품</span><br /> <br />
					<div class="productList" style="overflow: auto; height: 180px">
						<ul>
							<c:forEach var="product" items="${shop.productList}">
								<c:if test="${!empty product &&product.special=='o'}">
									<li><div class="alert alert-info">
											${product.productName} / ${product.price} <span
												class="label label-important">특화상품</span>
										</div></li>
								</c:if>
							</c:forEach>
							<hr style="border: 1px groove; margin: 10px 0px;">
							<c:forEach var="product" items="${shop.productList}">
								<c:if test="${!empty product &&empty product.special}">
									<li>${product.productName} /${product.price}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="send">
					<button class="btn btn-large btn-success"
						onclick='buttonClick("${shop.shopNum}","${shop.shopName}");'>
						관심꽃집등록 <i class="icon-thumbs-up"></i>
					</button>
					<a href="/LinkFlower/order.ap?id=${shop.shopNum}"><br /> <br />
						<button class="btn btn-large btn-info">주문하로가기</button></a> <br />
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>