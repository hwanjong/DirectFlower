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
		if('${user}'){
			alert("결제완료, 주문이 완료 되었습니다.");
			window.location.href = "/LinkFlower/user/orderInfo.ap";
		}else{
			alert("로그인후 이용하세요");
			url="/LinkFlower/popupLogin.ap";
			window.open(url,"chkid","width=500,height=500,menubar=no,toolbar=no");
		}
	}
	function checkDelivery() {
		if ($("input[name=optionsRadios]:checked").val() == "option1") {
			$("#address").hide();
		} else {
			$("#address").show();
		}
	}
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<div class="wrap">

		꽃집번호:<%=request.getParameter("id")%>
		<div id="shopInfo">
			<span><i class="icon-asterisk"></i> 꽃집정보</span><br />
			<div class="shop">
				<p>
					<span>동산화원</span><a href="#"><img id="like" width="50px"
						height="50px" src="/LinkFlower/img/like_on.jpg"></a>
				</p>
				<img alt="꽃집사진" width="150px" height="150px"
					src="/LinkFlower/img/photo.jpg">

				<p>
					<span>평점 </span>8.4 / 10 (95개의 평가)
				</p>
				<div class="progress">
					<div class="bar" style="width: 84%;">8.4</div>
					<div class="bar bar-danger" style="width: 16%;">1.6</div>
				</div>
			</div>
			<div class="infoList">
				<span>이벤트</span>발렌타인데이 이벤트진행중<br /> <br /> <span>후기</span><br />
				<br />
				<div style="overflow: auto; height: 200px">
					<ul>
						<li>좋은꽃집인것같아요 (9/10 점)</li>
						<li>좋은꽃집인것같아요 (6/10 점)</li>
						<li>좋은꽃집인것같아요 (10/10 점)</li>
					</ul>
				</div>
			</div>
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
									<%
										for (int i = 0; i < 10; i++) {
									%><option><%=i%></option>
									<%
										}
									%>
							</select></td>
							<td align="right"><span class='price'></span></td>
						</tr>
						<tr>
							<td>1</td>
							<td>졸업식꽃다발</td>
							<td class="unit_price">15000</td>
							<td><select class='qty' onchange='recalculate();'>
									<%
										for (int i = 0; i < 10; i++) {
									%><option><%=i%></option>
									<%
										}
									%>
							</select></td>
							<td align="right"><span class='price'></span></td>
						</tr>
						<tr>
							<td>1</td>
							<td>장미꽃 100송이</td>
							<td class="unit_price">50000</td>
							<td><select class='qty' onchange='recalculate();'>
									<%
										for (int i = 0; i < 10; i++) {
									%><option><%=i%></option>
									<%
										}
									%>
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
		<div id="orderinfo">
			<label class="radio"> <input type="radio"
				name="optionsRadios" id="optionsRadios1" value="option1" 
				onclick="checkDelivery()"> 방문
			</label> <label class="radio"> <input type="radio"
				name="optionsRadios" id="optionsRadios2" value="option2" checked
				onclick="checkDelivery()"> 배송
			</label>
			<p id="address">
				<span class="w100 ib">배송지주소</span><input type="text" class="input-xxlarge"
					name="address"><br />
			</p>
			<span class="w100 ib">수 령 자 </span><input type="text"
				id="targetName" name="targetName"> <span> 희망날짜 </span><input
				class="input-medium" type="text" id="datepicker"><span> 시간</span><select
				class="input-mini">
				<%
					for (int i = 0; i < 24; i++) {
				%><option><%=i%></option>
				<%
					}
				%>
			</select>시
		</div>

		<div id="send" class="centerdiv">
			<button class="btn btn-danger" onclick="history.back()">뒤로가기</button>
			<button class="btn btn-info" onclick="success()">결제하기</button>
		</div>
	</div>
</body>
</html>