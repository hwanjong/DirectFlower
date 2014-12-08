<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역경매 조회 및 낙찰</title>
<script type="text/javascript">
function apply(orderId,shopNum) {
	if(confirm("해당 역경매로 낙찰하시겠습니까? \n(확인시 주문접수됩니다.)")==true){
		$("#orderId").val(orderId);
		$("#shopNum").val(shopNum);
		$("form").submit();
	}
}
</script>
</head>
<body>
	<p>역경매 현황/낙찰</p>
	<div style="height: 300px; overflow: auto;">
		<p class="title">
			<i class=" icon-th-list"></i> 역경매 등록 내역
		</p>
		<c:forEach var="auction" items="${model.auctionList}">

			<c:choose>
				<c:when test="${auction.visit=='O'}">
					<div class="alert alert-info">
						<i class=" icon-ok-sign"></i><span><span
							style="font-size: 28px; font-weight: bold; color: black;">
								${auction.auctionName}</span> <br>수령자: ${auction.targetName} (배송)<br>요청시간
							: ${auction.requestTime} </span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-success">
						<i class=" icon-ok-sign"></i><span><span
							style="font-size: 28px; font-weight: bold; color: black;">
								${auction.auctionName}</span><br>수령자: ${auction.targetName} (방문)<br>
							연락처 : ${auction.targetPhone } <br>요청시간 :
							${auction.requestTime} <br>배송지 주소 : ${auction.targetAddress
							}</span>
					</div>

				</c:otherwise>
			</c:choose>

		</c:forEach>

	</div>
	<div class="subContents">
		<p class="title">
			<i class=" icon-th-list"></i> 판매 신청 현황
		</p>
		<table class="table">
			<thead>
				<tr>
				<th>경매번호</th>
					<th>신청상품</th>
					<th>꽃집</th>
					<th>가격</th>
					<th>사진</th>
					<th>낙찰</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="auction" items="${model.applyAuctionList}">
				<tr>
				<td>${auction.orderId }</td>
					<td>${auction.auctionName }</td>
					<td><a href="/LinkFlower/order.ap?id=${auction.shopNum}">${auction.shopName}</a></td>
					<td>${auction.responseMoney}</td>
					<td><a href="#"><img src="/LinkFlower/img/photo.jpg"></a></td>
					<td><button type="button" class="btn btn-success" onclick="apply('${auction.orderId}','${auction.shopNum}')">낙찰</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="adminAuction.ap" method="post">
		<input type="text" id="orderId" name="orderId" style="display: none;">
		<input type="text" id="shopNum" name="shopNum" style="display: none;">
		</form>
	</div>
</body>
</html>