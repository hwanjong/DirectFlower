<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 꽃집</title>
<script type="text/javascript">
	$(function() {
		$('.delete').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$(this).parents("tr").empty();
			}
		});
	});
</script>
</head>
<body>
	<table>

		<tr>
			<td><a href="/LinkFlower/order.ap?id=hwan7287">푸른꽃집</a>
				<button class="delete btn">
					<i class="icon-remove"></i>
				</button></td>
		</tr>
		<tr>
			<td><a href="/LinkFlower/order.ap?id=321">heaven Flower</a>
				<button class="delete btn">
					<i class="icon-remove"></i>
				</button></td>
		</tr>
		<tr>
			<td><a class="brand" href="/LinkFlower/order.ap?id=423">의정부꽃직매장</a>
				<button class="delete btn">
					<i class="icon-remove"></i>
				</button></td>
		</tr>
		<tbody>
		</tbody>
	</table>
	<br />
	<br />
	<button class="btn" onclick="location.reload()">취소</button>
	<button type="submit" class="btn btn-primary">변경사항 저장</button>


</body>
</html>