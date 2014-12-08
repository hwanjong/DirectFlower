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
<script type="text/javascript">
	function sub(){
		$("form").submit();
		self.close();
	}
</script>
<title>orderList</title>
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
	font-size: 15pt;
}

a:HOVER {
	color: green;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="wrap" style="overflow: auto;">
		<i class="icon-ok"></i> <span style="font-size: 15pt;"> 주문 목록</span>
		<hr style="border: 1px solid;">
		<table class="table">
			<tr>
				<th>품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>총액</th>
			</tr>
			<c:forEach var="product" items="${model.productList}">
				<tr>
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.amount}</td>
					<td>${product.price * product.amount}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${model.productList[0].state=='3'}">
		
		${model.productList[0].userId}
		<i class="icon-ok"></i> <span style="font-size: 15pt;">주문후기</span>
		<hr style="border: 1px solid;">
		<form method="POST" action="orderList.ap">
		<input type="text" name="orderId" style="display: none;" value="${model.productList[0].orderId}">
		<input type="text" name="shopNum" style="display: none;" value="${model.productList[0].shopNum}">
		<input type="text" name="userId" style="display: none;" value="${model.productList[0].userId}">
		<input type="text" placeholder="한줄후기" maxlength="40" name="userComment"> 평점 <select
			name="score" class='qty input-mini'>
			<%
				for (int i = 1; i <= 10; i++) {
			%><option><%=i%></option>
			<%
				}
			%>
		</select>
		<button type="button" class="btn" id="subBut" onclick="sub()">send</button>
		</form>
		</c:if>
		<c:if test="${model.productList[0].state=='5'}">
		<i class="icon-ok"></i> <span style="font-size: 15pt;">주문후기</span>
		<hr style="border: 1px solid;">
		이미 후기를 작성하셨습니다.</c:if>
	</div>


</body>
</html>