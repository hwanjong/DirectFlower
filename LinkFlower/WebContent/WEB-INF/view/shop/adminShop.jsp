<%@page import="hello.mv.ModelView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<link href="/LinkFlower/css/adminShop.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">

	$(function() {
		specialCheck();
		$('#add').click(
				function() {
					$("#tab").find("tbody").append(
							"<tr>" + $('#sample_row').find('tr').html()
									+ "</tr>");
				});
		$('#del').click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$("tr .check").each(function() {
					if ($(this).is(':checked')) {
						var pid = $(this).parents("tr").find(".pid").val();
						$("#deleteList").append("<input type='text' name='deleteId' value='"+pid+"'>");
						$(this).parents("tr").empty();
					}
				});
			}
		});
		$('#saveProduct').click(function() {
			specialCheck();
			var badCount=0;
			$("#productList .pName").each(function() {
				if($(this).val()==""){
					badCount++;
				}
			});
			$("#productList .pPrice").each(function() {
				if($(this).val()==""){
					badCount++;
				}
			});
			if(badCount!=0){
				alert("상품명,단가는 필수적으로 입력해주세요");
			}else{
				$("#product").submit();
			}
		});
		
	});
	function specialCheck(){
		$("tr .specialCheck").each(function() {
			if ($(this).is(':checked')) {
				$(this).parents("tr").find(".special").val("o");
			}else{
				$(this).parents("tr").find(".special").val("");
			}
		});
	}
</script>

</head>
<body>
	<p>매장관리</p>
	<div class="subContents">
		<p class="title">
			<i class=" icon-th-list"></i> 상품관리
		</p>
		<form id="product" action="adminShop.ap" method="post">
		<input type="button" class="btn" value="물품추가" id="add"> <input
			type="button" class="btn" value="물품삭제" id="del"> <input
			style="float: right;" type="button" class="btn btn-success"
			value="저 장" id="saveProduct">
		<div id="productList" style="overflow: auto; height: 320px;">
			<table id="tab" border="1">
				<thead>
					<tr>
						<th></th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>단가</th>
						<th>특화여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${model.productList}">
					<tr>
						<td><input type='checkbox' class="check"></td>
						<td><input class="pid input-mini" type='text' name="pId" readonly="readonly" value="${product.productId}"></td>
						<td><input type='text' class="pName" name="pName" size='15' value="${product.productName}"></td>
						<td><input type='text' class="pPrice" name="pPrice" size='10' value="${product.price}"></td>
						<td><input type="checkbox" class="specialCheck" ${product.special == 'o'?'checked':''} ><input class="special input-mini" type='text' name="special" style="display: none"> </td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="deleteList" style="display: none;">
		</div>
		</form>
	</div>
	<div class="subContents">
		<p class="title">
			<i class=" icon-th-list"></i> 꽃집 대표사진
		</p>
		<input style="float: right;" type="button" class="btn btn-success"
			value="저 장" id="savePhoto"> <img alt="대표사진"
			src="/LinkFlower/img/photo.jpg" width="200px" height="100px">

		<form>
			<input type="file">
		</form>
	</div>

	<div id="sample_row" style="display: none;">
		<table>
			<tr>
				<td><input type='checkbox' class="check" ></td>
				<td><input class="pid input-mini" type='text' name="pId" readonly="readonly"> </td>
				<td><input type='text' class="pName" name="pName" size='15'></td>
				<td><input type='text' class="pPrice" name="pPrice" size='10'></td>
				<td><input type="checkbox" class="specialCheck"><input class="special input-mini" type='text' name="special" style="display: none"> </td>
			</tr>
		</table>
	</div>

</body>
</html>