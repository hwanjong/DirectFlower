<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
</script>
<link href="css/main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>flossom</title>
<script>
	$(document)
			.ready(
					function() { // 해당 페이지 Loading 후,
						$("input[id=address]").attr("disabled", true);
						$("input[id=name]").attr("disabled", true);
						$("input[id=optionsRadios4]").attr("checked",true);

						$("input[name=optionsRadios]")
								.click(
										function() { // 라디오버튼 클릭 이벤트 
											if ($("input[name=optionsRadios]:checked").val() == "option1") {
												//geolocation Start --------------
												if (navigator.geolocation) {
													navigator.geolocation.getCurrentPosition(function(
																	position) {
																var lat = position.coords.latitude;
																var lng = position.coords.longitude;
																$("input[id=lat]").val(lat);
																$("input[id=lng]").val(lng);
																alert("현재위치찾음 : ("+lat + ", " + lng+")"+"\n꽃집찾기버튼을 눌려주세요");
															});

												} else {
													// Browser doesn't support Geolocation
													alert("위치찾기실패");
												}
												
												//geolocation END-------------
												
												initLocation();
												$("input[id=address]").attr(
														"disabled", true);
												$("input[id=name]").attr(
														"disabled", true);
												
											} else if ($(
													"input[name=optionsRadios]:checked")
													.val() == "option2") {
												initLocation();
												$("input[id=name]").attr(
														"disabled", true);
												$("input[id=address]").attr(
														"disabled", false);
											} else if ($(
													"input[name=optionsRadios]:checked")
													.val() == "option3") {
												initLocation();
												$("input[id=address]").attr(
														"disabled", true);
												$("input[id=name]").attr(
														"disabled", false);
											}
										});
						$('#addressSearch').click(
								function(){
									// Geocoding *****************************************************
							        var address = $("input[id=address]").val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
							        if(address){
							        	url="/LinkFlower/check/searchAddress.ap?address="+address;
												window.open(url,"chkid","width=500,height=500,menubar=no,toolbar=no");
							        }else{
							        	alert("주소를입력하세요");
							        	
							        }
								});
						
						$('#nameSearch').click(
								function(){
									var shopName=$("#name").val();
									if(shopName){
										url="/LinkFlower/check/searchShop.ap?shopName="+shopName;
										window.open(url,"chkid","width=500,height=500,menubar=no,toolbar=no");
									}else{
										alert("화원이름을입력하세요!");
									}
								});
						
						$("#search").click(
								function(){
									if($("input[name=optionsRadios]:checked").val() == "option4"){
										alert("꽃집찾을방법을 선택하세요!");
									}else{
										if($("#lat").val()==""){
											alert("위치가 검색 되지 않았습니다. 위치를검색해주세요");
										}else{
											$("form").submit();
										}
										$("input[id=optionsRadios4]").attr("checked",true);
									}
								});
					});
	function initLocation(){
		$("#lat").val("");
		$("#lng").val("");
		$("input[id=address]").val('');
		$("input[id=name]").val('');
	}
</script>
</head>
<body>
	<div class="wrap">
		<div id="event">
		<p class="title">
				<i class=" icon-th-list"></i> 인기 이벤트 TOP 3
			</p>
			<table class="table">
				<tbody>
					<c:forEach var="shop" items="${model.shopList}">
					<tr>
						<!-- <td style="text-indent: 2px;">${shop.shopNum}</td> -->
						<td>${shop.eventComment} <span class="label label-important">${shop.eventCount}</span></td>
						<td><a href="/LinkFlower/order.ap?id=${shop.shopNum}">${shop.shopName}</a></td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
		</div>

		<div id="find">
			<form action="findshop.ap" method="POST">
			<p class="title">
				<i class=" icon-th-list"></i> 꽃집 찾기
			</p>
				<table class="table">
					<tbody>
						<tr>
							<td><label class="radio"> <input type="radio"
									name="optionsRadios" id="optionsRadios1" value="option1"
									checked> 내 위치로 찾기
							</label></td>
							<td rowspan="3" id="buttoncell">
								<button type="button" class="btn btn-default" id="search"></button>
							</td>
						</tr>
						<tr>
							<td><label class="radio"> <input type="radio"
									name="optionsRadios" id="optionsRadios2" value="option2">
									배달 주소지로 찾기
							</label> 
							<input id="address" name="address" class="span5" type="text"
								placeholder="ex) 동작구 노량진동">
								<button id="addressSearch" type="button" style="margin-bottom: 10px;">
									<i class="icon-search"></i>
								</button></td>

						</tr>
						<tr>
							<td><label class="radio"> <input type="radio"
									name="optionsRadios" id="optionsRadios3" value="option3">
									꽃집이름으로 찾기
							</label> <input id="name" name="shopName" class="span5" type="text"
								placeholder="ex) 노원화원">
								<button id="nameSearch" type="button" style="margin-bottom: 10px;">
									<i class="icon-search"></i>
									</button></td>
						</tr>
					</tbody>
				</table>
				<div id="hideDiv" style="display: none;">
					<label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios4" value="option4"></label>
					<input type="text" id="lat" name="lat"> <input
						type="text" id="lng" name="lng">
				</div>

			</form>
		</div>
	</div>
	<div class="container bottom">
		<div class="navbar navbar-inverse  mb0">
			<div class="navbar-inner">
				<ul class="nav">
					<li class="nouse"><a href="#">회사소개</a></li>
					<li class="nouse"><a href="#">광고문의</a></li>
					<li class="nouse"><a href="#">SiteMap</a></li>
					<li><a href="#">서비스 약관</a></li>
				</ul>
				<ul class="nav pull-right">
					<li><a>© FLOSSOM Corp.</a></li>
				</ul>

			</div>
		</div>
	</div>
</body>
</html>