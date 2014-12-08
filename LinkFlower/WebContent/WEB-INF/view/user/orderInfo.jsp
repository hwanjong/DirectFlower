<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문정보</title>
<link href="/LinkFlower/css/common.css" rel="stylesheet" type="text/css">
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<p>주문상태조회</p>
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
					<th class="w45" >방문</th>
					<th class="w180">배송지</th>
					<th class="w60">수령인</th>
					<th>요청시간</th>
					<th>꽃집</th>
				</tr>
				<c:forEach var="order" items="${model.orderList}">
					<c:if test="${order.state=='1'}">
						<tr>
							<td><a href="#" onclick='window.open("/LinkFlower/check/orderList.ap?orderId=${order.orderId}","chkid","width=500,height=500,menubar=no,toolbar=no");'>click</a></td>
							<td>${order.visit}</td>
							<td><c:if test="${order.visit=='O'}">-</c:if> <c:if
									test="${order.visit!='O'}">${order.targetAddress}</c:if></td>
							<td>${order.targetName}</td>
							<td>${order.requestTime}</td>
							<td><a href="/LinkFlower/order.ap?id=${order.shopNum}">${order.shopName}</a></td>
						</tr>
					</c:if>
				</c:forEach>

			</table>

		</div>
		<div id="tabs-2">
			<table class="table table-condensed">
				<tr>
					<th class="w100">주문정보</th>
					<th class="w45" >방문</th>
					<th class="w180">배송지</th>
					<th class="w60">수령인</th>
					<th>요청시간</th>
					<th>꽃집</th>
				</tr>
				<c:forEach var="order" items="${model.orderList}">
					<c:if test="${order.state=='2'}">
						<tr>
							<td><a href="#" onclick='window.open("/LinkFlower/check/orderList.ap?orderId=${order.orderId}","chkid","width=500,height=500,menubar=no,toolbar=no");'>click</a></td>
							<td>${order.visit}</td>
							<td><c:if test="${order.visit=='O'}">-</c:if> <c:if
									test="${order.visit!='O'}">${order.targetAddress}</c:if></td>
							<td>${order.targetName}</td>
							<td>${order.requestTime}</td>
							<td><a href="/LinkFlower/order.ap?id=${order.shopNum}">${order.shopName}</a></td>
						</tr>
					</c:if>
				</c:forEach>


			</table>
		</div>
		<div id="tabs-3">
			<table class="table table-condensed">
				<tr>
					<th class="w80">주문정보/후기쓰기</th>
					<th class="w45">방문</th>
					<th class="w180">배송지</th>
					<th width="62px;">수령인</th>
					<th>요청시간</th>
					<th>꽃집</th>
					<th class="w50">사진</th>
				</tr>
				<c:forEach var="order" items="${model.orderList}">
					<c:if test="${(order.state=='3') || (order.state=='5')}">
						<tr>
							<td><a href="#" onclick='window.open("/LinkFlower/check/orderList.ap?orderId=${order.orderId}","chkid","width=500,height=500,menubar=no,toolbar=no");'>click</a></td>
							<td>${order.visit}</td>
							<td><c:if test="${order.visit=='O'}">-</c:if> <c:if
									test="${order.visit!='O'}">${order.targetAddress}</c:if></td>
							<td>${order.targetName}</td>
							<td>${order.requestTime}</td>
							<td><a href="/LinkFlower/order.ap?id=${order.shopNum}">${order.shopName}</a></td>
							<td><a href="#"><button>
										<img src="/LinkFlower/img/photo.jpg">
									</button></a></td>
						</tr>
					</c:if>
				</c:forEach>


			</table>
		</div>
	</div>

</body>
</html>