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
<script type="text/javascript"
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
</script>
<title>Search Address</title>
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
	font-size: 12pt;
}

a:HOVER {
	color: green;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function check(lat, lng, shopLocation) {
		if(opener.document.getElementById("lat")!=null){
			alert("주소값찾음 : ("+lat + ", " + lng+")"+"\n꽃집찾기버튼을 눌려주세요");
			opener.document.getElementById("lat").value = lat;
			opener.document.getElementById("lng").value = lng;
			opener.document.getElementById("address").value = shopLocation;
		}else{//shopJoin페이지에서들어올때
			opener.document.getElementById("shopLat").value = lat;
			opener.document.getElementById("shopLng").value = lng;
			opener.document.getElementById("shopLocation").value = shopLocation;
		}
		self.close();
	}

	$(document).ready(
			function() {
				// Geocoding *****************************************************
				var address = '${model.address}'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode({'address' : address}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						var len = results.length;
						for ( var i = 0; i < len; i++) {
							var lat = results[i].geometry.location.lat();
							var lng = results[i].geometry.location.lng();
							var tempLocation =results[i].formatted_address.split(' ');
							var location='';
							//대한민국을 없애주기
							for(var i=1;i<tempLocation.length;i++){
								location += tempLocation[i];
								if(i<tempLocation.length-1){
									location +=' ';
								}
							}
							$("#wrap").append(
									'<div class="alert alert-block"> <i class=" icon-ok-sign"></i> 주소 : <a onclick="check('+lat+','+lng+',\''+location+'\')"> <span><br/> '+location+'</span></a></div>'
									);
							/*
							$("input[id=lat]").val(lat);
							$("input[id=lng]").val(lng);
							*/
						}
						

					} else {
						alert("위치값을 찾을수 없음 (에러코드 : " + status + ")");
					}
				});
				// Geocoding // *****************************************************
			});
</script>
</head>
<body>
	<div id="wrap" style="overflow: auto;">
		<i class="icon-ok"></i> <span style="font-size: 15pt;"> 검색된 주소</span>
		<hr style="border: 1px solid;">
	</div>
	
	<p style="width:400px; text-align: right;">주소정보 제공 : Google Map</p>
	


</body>
</html>