<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 꽃집</title>
<script type="text/javascript">
	$(function() {
		$('.close').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				//$(this).parents("div").empty();

			}
		});
	});
</script>
</head>
<body>
	<p>관심꽃집</p>

	<c:if test="${empty model.likeShopList }">데이터없음  <script type="text/javascript">alert("좋아하는 꽃집을 등록하세요.");</script>
	</c:if>
	<c:forEach var="shop" items="${model.likeShopList}">
		<div>
			<div class="alert alert-block">
				<button type="button" class="close" data-mismiss="alert">&times;</button>
				<i class=" icon-ok-sign"></i> <a href="#${shop.shopNum}"> <span>${shop.shopName}</span>
				</a> <span class="label label-important"> ${shop.eventCount}</span><br />
				위치: ${shop.shopLocation}
			</div>
		</div>

	</c:forEach>
	<br />
	<br />

</body>
</html>