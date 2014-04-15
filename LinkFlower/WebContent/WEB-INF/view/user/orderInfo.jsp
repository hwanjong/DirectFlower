<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문정보</title>
<link href="/LinkFlower/css/orderinfo.css" rel="stylesheet"
	type="text/css">
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">접수대기</a></li>
			<li><a href="#tabs-2">진행중</a></li>
			<li><a href="#tabs-3">거래완료</a></li>
		</ul>
		<div id="tabs-1" class="table-responsive">
			<table class="table table-condensed">
			<tr>
			<th class="w100">주문정보</th>
			<th>방문</th>
			<th class="w200">배송지</th>
			<th>수령인</th>
			<th>요청시간</th>
			<th >꽃집</th>
			</tr>
			<tr>
			<td><a href="#">장미100송이</a></td>
			<td>O</td>
			<td>-</td>
			<td>노유경</td>
			<td>14-04-15,18:00</td>
			<td><a href="#">동산화원</a></td>
			</tr>
			<tr>
			<td><a href="#">행운목(소)</a></td>
			<td>X</td>
			<td>노량진 1동 동작구청 504호 구청장실</td>
			<td>구청장</td>
			<td>14-04-16,11:30</td>
			<td><a href="#">노들꽃집</a></td>
			</tr>
			

			</table>

		</div>
		<div id="tabs-2">
			<table class="table table-condensed">
			<tr>
			<th class="w100">주문정보</th>
			<th>방문</th>
			<th class="w200">배송지</th>
			<th>수령인</th>
			<th>요청시간</th>
			<th >꽃집</th>
			</tr>
			<tr>
			<td><a href="#">축하화환</a></td>
			<td>X</td>
			<td>강남역 3번출구 프라자웨딩홀 다이아홀</td>
			<td>임민지</td>
			<td>14-04-04,10:30</td>
			<td><a href="#">서초화원</a></td>
			</tr>
			

			</table>
		</div>
		<div id="tabs-3">
			<table class="table table-condensed">
			<tr>
			<th class="w100">주문정보</th>
			<th class="w45">방문</th>
			<th class="w200">배송지</th>
			<th width="62px;">수령인</th>
			<th>요청시간</th>
			<th>꽃집</th>
			<th class="w50">사진</th>
			</tr>
			<tr>
			<td><a href="#">발렌타인(소)</a></td>
			<td>X</td>
			<td>강남구 역삼동 77-4 304호</td>
			<td>김아영</td>
			<td>14-04-16,11:30</td>
			<td><a href="#">서니플라워</a></td>
			<td><a href="#"><button><img src="/LinkFlower/img/photo.jpg"></button></a></td>
			</tr>
			

			</table>
		</div>
	</div>

</body>
</html>