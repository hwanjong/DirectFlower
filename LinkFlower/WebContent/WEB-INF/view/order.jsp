<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		var shopNum = '${user.shopNum}';
		if(shopNum != 0){
			alert("샵회원 주문불가!  "+shopNum);
		}else if ($("#sum").text() == '0' || $("#targetName").val() == ''
				|| $("#datepicker").val() == '') {
			alert("주문실패 : 주문할 상품이 없거나 배송정보가 없습니다.");
		} else if ('${user}') {
			alert("결제완료, 주문이 완료 되었습니다.");
			$("form").submit();
		} else {
			alert("로그인후 이용하세요");
			url = "/LinkFlower/popupLogin.ap";
			window.open(url, "chkid",
					"width=500,height=500,menubar=no,toolbar=no");
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
	
	$(document)
	.ready(
			function() { 
				if(!'${user}'){
					alert("로그인후이용하세요 \n임시아이디 : test123/123");
					location.href='/LinkFlower/main.ap';
				}
			});
</script>
</head>
<body>
	<form action="order.ap" method="POST">
		<c:set value="${model.shop}" var="shop" />
		<div class="wrap">
			<div id="shopInfo">
				<span><i class="icon-asterisk"></i> 꽃집정보</span><br />
				<div class="shop">
					<p>
						<span>${model.shop.shopName}</span><input name="shopNum"
							value="${shop.shopNum}" style="display: none;"><a
							href="#"><img id="like" width="50px" height="50px"
							src="/LinkFlower/img/like_on.jpg"></a>
					</p>
					<img id="shopPhoto" alt="꽃집사진" src="/LinkFlower/img/photo.jpg">

					<p>
						<span>평점 </span>${model.shop.scoreAverage} / 10
						(${model.shop.postingList.size()}개의 평가)
					</p>
					<div class="progress">
						<div class="bar" style="width: ${model.shop.scoreAverage*10}%;">${model.shop.scoreAverage}</div>
						<div class="bar bar-danger"
							style="width: ${(10-model.shop.scoreAverage)*10}%;">${10-model.shop.scoreAverage}</div>
					</div>
					<p>
						<span>꽃집주소</span> ${shop.shopLocation}
					</p>
					<p>
						<span>전화번호</span> ${shop.phoneNum}
					</p>
				</div>
				<div class="infoList">
					<span>이벤트</span>
					<div class="alert alert-success">${shop.eventComment}</div>
					<span>후기</span><br /> <br />
					<div style="overflow: auto; height: 200px">
						<ul>
							<c:forEach var="posting" items="${model.shop.postingList}"
								varStatus="status">
								<li>${posting.userComment} (${posting.score}/10 점) - ${posting.userId}(${posting.name})</li>
							</c:forEach>
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
							<c:forEach var="product" items="${shop.productList}"
								varStatus="status">
								<tr>
									<td>${status.count}<input type="text" name="productId"
										style="display: none;" value="${product.productId}"></td>
									<td>${product.productName}</td>
									<td class="unit_price">${product.price}</td>
									<td><select name="amount" class='qty input-mini'
										onchange='recalculate();'>
											<%
												for (int i = 0; i < 10; i++) {
											%><option><%=i%></option>
											<%
												}
											%>
									</select></td>
									<td align="right"><span class='price'></span></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="4">합계</th>
								<th><span id="sum" class="price">0</span></th>
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
				</label> <span class="w100 ib">수령자 </span><input type="text" id="targetName"
					name="targetName"> <span> 희망날짜 </span><input
					class="input-medium" name="requestTime" type="text" id="datepicker"><span>
					시간</span><select class="input-mini" name="requestHour">
					<%
						for (int i = 0; i < 24; i++) {
					%><option><%=i%></option>
					<%
						}
					%>
				</select>시
				<p id="address">
					<span class="w100 ib">수령자연락처</span><input type="text"
						name="targetPhone"><br /> <span class="w100 ib">배송지주소</span><input
						type="text" class="input-xxlarge" name="targetAddress"><br />
				</p>
			</div>

			<div id="send" class="centerdiv">
				<button class="btn btn-danger" onclick="history.back()">뒤로가기</button>
				<button type="button" class="btn btn-info" onclick="success()">결제하기</button>
			</div>
		</div>
	</form>
</body>
</html>