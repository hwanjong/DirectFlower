<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 꽃집</title>
<script type="text/javascript">
function recalculate() {
	var sum = 0;
	$("#tab tbody tr").each(function() {
		var unit_price = parseInt($(this).find(".unit_price").val());
		var qty = parseInt($(this).find(".qty").val());
		if (!isNaN(unit_price) && !isNaN(qty) ) {
			var price = unit_price * qty;
			$(this).find(".price").text(price);
			sum = sum + price;
		}
	});
	$("#sum").text(sum);
}

$(function() {
	$('#add').click(function() {
		$("#tab").find("tbody").append("<tr>"+$('#sample_row').find('tr').html()+"</tr>");
	});
	$('#del').click(function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			$("tr input[type='checkbox']").each(function() {
				if ($(this).attr('checked')) {
					$(this).parents("tr").empty();
				}
			});
			recalculate();
		}
	});
	$('#add').click();
});
</script>
</head>
<body>
<div>
	<table id="tab" border="1">
		<thead>
		<tr>
			<th></th>
			<th>상품명</th>
			<th>단가</th>
			<th>개수</th>
			<th>가격</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="4">합계</th>
			<th><span id="sum" class="price"></span></th>
		</tr>
		</tfoot>
	</table>
	<input type="button" value="물품추가" id="add">
	<input type="button" value="물품삭제" id="del">
</div>

<div id="sample_row" style="display:none">
	<table>
	<tr>
		<td><input type='checkbox'></td>
		<td><input type='text' size='15'></td>
		<td><input type='text' size='10' class='unit_price' onchange='recalculate();'></td>
		<td>
			<select class='qty' onchange='recalculate();'>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
			</select>
		</td>
		<td align="right"><span class='price'></span></td>
	</tr>
	</table>
</div>
	
</body>
</html>