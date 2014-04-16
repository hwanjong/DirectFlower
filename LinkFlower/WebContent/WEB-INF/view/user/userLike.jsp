<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 꽃집</title>

<script type="text/javascript">
//작성을 누르면 실행되는 함수
	function btnOk() {
		var table1 = document.getElementById("table1"); //테이블 을가져온다
		var tr = document.createElement("tr"); //<tr>태그를 만든다.
		var text1 = document.getElementById("text1"); //입력된 text input을 가져온다.
		var today = new Date(); //현재시간을 가져온다
		tr.innerHTML = "<td><SPAN STYLE='background-color:yellow;'>" //html코드를 만든다.
				+ text1.value  //입력된 값을 넣는다.
				+ "&nbsp;&nbsp;"
				+ today  //현재날자를 넣는다.
				+ "</span>&nbsp;<input type='button' value='삭제' onClick='remove(this)' /></td> "; //삭제버튼을 만든다. 클릭시 remove실행
		table1.appendChild(tr); //테이블에 append한다.
		text1.value = ""; //인풋텍스트박스를 초기화한다.
	}

//삭제하는함수
	function remove(obj) {
		var delObj = obj.parentElement.parentElement;//부모의 elements를 얻느다.
		delObj.parentNode.removeChild(delObj); //자식을 삭제한다.
	}
</script>

</head>
<body>
<div>
		<input type="text" id="text1" style="width: 300px;" /> <input
			type="button" value="작성" onClick="btnOk()" />
	</div>
	<table id="table1">
	</table>

</body>
</html>