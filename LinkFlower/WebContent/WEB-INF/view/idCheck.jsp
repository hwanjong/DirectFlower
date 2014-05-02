<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
<c:if test="${model.checkUser==false}"> <script type="text/javascript">alert("존재하는아이디입니다.");</script></c:if>
<c:if test="${model.checkUser==true}"> <script type="text/javascript">alert("사용가능한아이디입니다.");</script></c:if>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						 self.close();
					});
</script>
</head>
<body>

</body>
</html>