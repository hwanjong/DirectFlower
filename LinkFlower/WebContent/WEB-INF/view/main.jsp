<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>flossom</title>
<script>
	$(document).ready(function() { // 해당 페이지 Loading 후, 
		$("input[id=address]").attr("disabled", true);
		$("input[id=name]").attr("disabled", true);

		$("input[name=optionsRadios]").click(function() { // 라디오버튼 클릭 이벤트 
			if ($("input[name=optionsRadios]:checked").val() == "option1") {
				$("input[id=address]").val('');
				$("input[id=address]").attr("disabled", true);
				$("input[id=name]").val('');
				$("input[id=name]").attr("disabled", true);
			} else if($("input[name=optionsRadios]:checked").val() == "option2") {
				$("input[id=name]").val('');
				$("input[id=name]").attr("disabled", true);
				$("input[id=address]").attr("disabled", false);
			}else if($("input[name=optionsRadios]:checked").val() == "option3"){
				$("input[id=address]").val('');
				$("input[id=address]").attr("disabled", true);
				$("input[id=name]").attr("disabled", false);
				// 테스트1 라디오를 클릭하면 비활성화 
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
						<th colspan="4">● 베스트 이벤트</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="">[10주년 기념이벤트] 장미100송이 단돈 10000원</a> <span
							class="label label-important">Hot</span></td>
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
						<td><a href="">방문고객 꽃영양제 증정!!</a></td>
						<td>푸른조경</td>
						<td>2014.4.6</td>
						<td>321</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="find">
			<table class="table">
				<thead>
					<tr class="success">
						<th colspan="4">● 꽃집 찾기</th>
				</thead>
				<tbody>
					<tr>
						<td><label class="radio"> <input type="radio"
								name="optionsRadios" id="optionsRadios1" value="option1" checked>
								내 위치로 찾기
						</label></td>
						<td rowspan="3" id="buttoncell">
							<button type="submit" class="btn btn-default" id="search"></button>
						</td>
					</tr>
					<tr>
						<td><label class="radio"> <input type="radio"
								name="optionsRadios" id="optionsRadios2" value="option2">
								배달 주소지로 찾기
						</label> <input id="address" class="span5" type="text"
							placeholder="주소입력.."></td>

					</tr>
					<tr>
						<td><label class="radio"> <input type="radio"
								name="optionsRadios" id="optionsRadios3" value="option3">
								꽃집이름으로 찾기
						</label> <input id="name" class="span5" type="text"
							placeholder="꽃집이름입력.."></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
</body>
</html>