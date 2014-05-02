<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						$('#addressSearch').hide();

						$("input[name=optionsRadios]")
								.click(
										function() { // 라디오버튼 클릭 이벤트 
											if ($("input[name=optionsRadios]:checked").val() == "option1") {
												
												if (navigator.geolocation) {
													navigator.geolocation.getCurrentPosition(function(
																	position) {
																var lat = position.coords.latitude;
																var lng = position.coords.longitude;
																$("input[id=lat]").val(lat);
																$("input[id=lon]").val(lng);
																alert("현재위치찾음 : "+ lat+ ", "+ lng);
															});

												} else {
													// Browser doesn't support Geolocation
													alert("위치찾기실패");
												}
												$("input[id=address]").val('');
												$("input[id=address]").attr(
														"disabled", true);
												$("input[id=name]").val('');
												$("input[id=name]").attr(
														"disabled", true);
												$('#addressSearch').hide();
												
												
											} else if ($(
													"input[name=optionsRadios]:checked")
													.val() == "option2") {
												$("input[id=name]").val('');
												$("input[id=name]").attr(
														"disabled", true);
												$("input[id=address]").attr(
														"disabled", false);
												$('#addressSearch').show();
											} else if ($(
													"input[name=optionsRadios]:checked")
													.val() == "option3") {
												$("input[id=address]").val('');
												$("input[id=address]").attr(
														"disabled", true);
												$("input[id=name]").attr(
														"disabled", false);
												$('#addressSearch').hide();
												// 테스트1 라디오를 클릭하면 비활성화 
											}
										});
						$('#addressSearch').click(
								function(){
									// Geocoding *****************************************************
							        var address = $("input[id=address]").val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
							        var geocoder = new google.maps.Geocoder();
							        geocoder.geocode( { 'address': address}, function(results, status) {
							            if (status == google.maps.GeocoderStatus.OK) {
							            	var lat =results[0].geometry.location.lat();
							            	var lng = results[0].geometry.location.lng();
							            	alert(address+"의 위치값찾음 :\n"+results[0].geometry.location.lat()+", "+results[0].geometry.location.lng());
							            	$("input[id=lat]").val(lat);
														$("input[id=lon]").val(lng);
							                
							            } else {
							                alert("위치값을 찾을수 없음 (에러코드 : " + status+")");
							            }
							        });
							        // Geocoding // *****************************************************
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
</script>
</head>
<body>
	<div class="wrap">
		<div id="event">
			<table class="table">
				<thead>
					<tr class="success">
						<th colspan="4">● 인기 이벤트</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="">[10주년 기념이벤트] 장미100송이 단돈 10000원</a></td>
						<td>동산꽃화원</td>
						<td>2014.4.2</td>
						<td>4324</td>
					</tr>

					<tr>
						<td>2</td>
						<td><a href="">꽃바구니 전품목 50% SALE!!</a></td>
						<td>예진꽃방</td>
						<td>2014.4.5</td>
						<td>2620</td>
					</tr>

					<tr>
						<td>3</td>
						<td><a href="">방문고객 꽃영양제 증정!!</a> <span
							class="label label-success">New</span></td>
						<td>푸른조경</td>
						<td>2014.4.6</td>
						<td>321</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="find">
			<form action="findshop.ap" method="POST">
				<table class="table">
					<thead>
						<tr class="success">
							<th colspan="4">● 꽃집 찾기</th>
					</thead>
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
								placeholder="주소입력..">
								<button id="addressSearch" type="button" style="margin-bottom: 10px;">
									<i class="icon-search"></i>
								</button></td>

						</tr>
						<tr>
							<td><label class="radio"> <input type="radio"
									name="optionsRadios" id="optionsRadios3" value="option3">
									꽃집이름으로 찾기
							</label> <input id="name" name="shopName" class="span5" type="text"
								placeholder="꽃집이름입력.."></td>
						</tr>
					</tbody>
				</table>
				<div id="hideDiv" style="display: none;">
					<label class="radio"> <input type="radio"
						name="optionsRadios" id="optionsRadios4" value="option4"></label>
					<input type="text" id="lat" name="lat"> <input
						type="text" id="lon" name="lng">
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