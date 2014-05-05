<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
<c:if test="${model.checkUser==false}">
	<script type="text/javascript">
	opener.document.getElementById("success").innerHTML="";
	opener.document.getElementById("inputId").value="";
	opener.document.getElementById("fail").innerHTML="중복된 ID 입니다.";
	self.close();
	</script>
</c:if>
<c:if test="${model.checkUser==true}">
	<script type="text/javascript">
	opener.document.getElementById("fail").innerHTML="";
		opener.document.getElementById("success").innerHTML="사용가능한 ID입니다.";
		self.close();
	</script>
</c:if>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>
${model.userId}
</body>
</html>