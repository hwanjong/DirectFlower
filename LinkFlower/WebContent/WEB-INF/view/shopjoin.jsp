<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${model.fail==true}">
	<script type="text/javascript">
		alert("중복정보 가입불가(핸드폰)");
	</script>
</c:if>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
	
</script>
<title>shopjoin</title>
<script type="text/javascript">
	function openCheckId() {
		var userid = $("#inputId").val();
		if (userid) {
			url = "/LinkFlower/check/idcheck.ap?userid=" + userid;
			window.open(url, "chkid",
					"width=500,height=500,menubar=no,toolbar=no");
		} else {
			alert("ID를 입력하세요!");
		}
	}
	function getInfo() {
		var p1 = $("#phone1").val();
		var p2 = $("#phone2").val();
		var p3 = $("#phone3").val();
		var phoneNum = p1 + "-" + p2 + "-" + p3;
		$("#phoneNum").val(phoneNum);
		if ($("#inputId").val() == "" || $("#inputPassword").val() == ""
				|| $("#inputPassword2").val() == ""
				|| $("#inputName").val() == "" || $("#phone2").val() == ""
				|| $("#phone3").val() == "" || $("#shopName").val() == ""
				|| $("#shopLocation").val() == ""||$("#eventComment").val()=="") {
			alert("빈칸없이 입력하세요");
		} else if ($("#shopLat").val() == "") {
			alert("꽃집위치를 검색해주세요");
		} else {
			if ($("#inputPassword").val() == $("#inputPassword2").val()) {
				$("#shopLat").attr("disabled", false);
				$("#shopLng").attr("disabled", false);
				$("form").submit();
			} else {
				$("#confirm").html('비밀번호 불일치!');
			}
		}
	}

	$(document).ready(function() {
		$('#addressSearch').click(
				function(){
					// Geocoding *****************************************************
			        var address = $("input[id=shopLocation]").val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
			        if(address){
			        	url="/LinkFlower/check/searchAddress.ap?address="+address;
								window.open(url,"chkid","width=500,height=500,menubar=no,toolbar=no");
			        }else{
			        	alert("주소를입력하세요");
			        }
				});
		/*
		$("#addressSearch").click(function() {
			// Geocoding *****************************************************
			var address = $("input[id=shopLocation]").val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					var lat = results[0].geometry.location.lat();
					var lng = results[0].geometry.location.lng();
					var tempLocation =results[0].formatted_address.split(' ');
					var location='';
					//대한민국을 없애주기
					for(var i=1;i<tempLocation.length;i++){
						location += tempLocation[i];
						if(i<tempLocation.length-1){
							location +=' ';
						}
					}
					$("input[id=shopLocation]").val(location);
					$("input[id=shopLat]").val(lat);
					$("input[id=shopLng]").val(lng);

				} else {
					alert("위치값을 찾을수 없음 (에러코드 : " + status + ")");
				}
			});
			// Geocoding // *****************************************************
		});
		*/
	});
</script>
</head>
<body>
	<div class="wrap">
		<form class="form-horizontal" method="POST"
			action="/LinkFlower/shopjoin.ap">
			<span class="ml40 mb20 ib"><i class="icon-asterisk"></i>
				기업회원가입</span>
			<div class="base">
				<div class="control-group">
					<label class="control-label" for="inputId">아이디</label>
					<div class="controls">
						<input type="text" id="inputId" placeholder="ID" name="userId">
						<button class="btn" type="button" onclick="openCheckId()">중복검사</button>
						<p>
							<span id="success"></span> <span id="fail" style="color: red"></span>
						</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputPassword">비밀번호</label>
					<div class="controls">
						<input type="password" id="inputPassword" name="pw"
							placeholder="Password">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputPassword2">비밀번호확인</label>
					<div class="controls">
						<input type="password" id="inputPassword2" name="pw2"
							placeholder="Password"><span id="confirm"
							style="color: red;"></span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputName">이름</label>
					<div class="controls">
						<input type="text" id="inputName" name="name" placeholder="Name">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">핸드폰번호</label>
					<div class="controls">
						<select id="phone1" class="input-small">

							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>

						</select> - <input type=text class="input-mini" id="phone2" size=2 value="" maxlength="4">
						- <input type=text class="input-mini" id="phone3" size=2 value="" maxlength="4">
					</div>
				</div>



			</div>
			<hr style="border: 1px groove; color: green; margin: 10px 20px">
			<div class="shopInfo">

				<div class="control-group">
					<label class="control-label" for="shopName">상호명</label>
					<div class="controls">
						<input type="text" id="shopName" name="shopName"
							placeholder="shopName">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="shopLocation">꽃집 위치</label>
					<div class="controls">
						<input type="text" id="shopLocation" name="shopLocation"
							placeholder="Location">
						<button id="addressSearch" type="button">
							<i class="icon-search"></i>
						</button>
						<p>예) 동작구 노량진동 56-14</p>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="shopLat">위치정보</label>
					<div class="controls">
						<input type="text" class="input-small" id="shopLat" name="shopLat"
							disabled="disabled" placeholder="latitude"> <input
							type="text" class="input-small" id="shopLng" name="shopLng"
							disabled="disabled" placeholder="longtitude">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="shopName">이벤트멘트</label>
					<div class="controls">
						<input type="text" id="eventComment" name="eventComment"
							placeholder="event..">
					</div>
				</div>

			</div>

			<div class="control-group">
				<div class="controls">
					<button type="button" style="width: 200px;"
						class="btn btn-large btn-info " onclick="getInfo()">Sign
						in</button>
				</div>
			</div>

			<div class="hideDiv" style="display: none;">
				<input type="text" id="phoneNum" name="phoneNum" value="">
			</div>
		</form>
	</div>
</body>
</html>