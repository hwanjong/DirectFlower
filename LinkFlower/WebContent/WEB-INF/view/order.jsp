<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃집찾기</title>
<link href="/LinkFlower/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function recalculate() {
		var sum = 0;
		$("#tab tbody tr").each(function() {
			var unit_price = parseInt($(this).find(".unit_price").text());
			var qty = parseInt($(this).find(".qty").val());
			if (!isNaN(unit_price) && !isNaN(qty)) {
				var price = unit_price * qty;
				$(this).find(".price").text(price);
				sum = sum + price;
			}
		});
		$("#sum").text(sum);
	}
	function success() {
		alert("결제완료, 주문이 완료 되었습니다.");
		window.location.href = "/LinkFlower/user/orderInfo.ap";
	}
</script>
</head>
<body>
	<div class="wrap">
	
		꽃집번호:<%=request.getParameter("id") %>
		<p>● 화원정보</p>
		<div id="shopinfo" class="temp">
		</div>
		<div id="order">
		<p>● 주문서</p>
			<div class="order">
				<table id="tab" class="table table-condensed">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>꽃바구니(대)</td>
							<td class="unit_price">80000</td>
							<td><select class='qty' onchange='recalculate();'>
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
							</select></td>
							<td align="right"><span class='price'></span></td>
						</tr>
						<tr>
							<td>1</td>
							<td>졸업식꽃다발</td>
							<td class="unit_price">15000</td>
							<td><select class='qty' onchange='recalculate();'>
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
							</select></td>
							<td align="right"><span class='price'></span></td>
						</tr>
						<tr>
							<td>1</td>
							<td>장미꽃 100송이</td>
							<td class="unit_price">50000</td>
							<td><select class='qty' onchange='recalculate();'>
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
							</select></td>
							<td align="right"><span class='price'></span></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="4">합계</th>
							<th><span id="sum" class="price"></span></th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<p>● 주문배송 정보</p>
		<div id="orderinfo" class="temp">
		</div>
		<div id="send" class="centerdiv">
		<button class="btn" onclick="history.back()">뒤로가기</button>
		<button class="btn" onclick="success()">결제하기</button>
		</div>
	</div>
</body>
</html>