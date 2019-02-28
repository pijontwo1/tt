<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js"></script>

</head>
<body>

<button onclick="send();">전송</button>
<div id="test"></div>

<script type="text/javascript">

function send() {
	$.ajax({
		url:"t2.jsp",
		type:"post",
		data:{num1:10,num2:20},
		success: function(data) {
			$("#test").html("10+20= "+$.trim(data));
		},
		error: function(data) {
			alert("error");
		}
		});
	
}

</script>

</body>
</html>