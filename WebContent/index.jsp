<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/clock.css" rel="stylesheet" type="text/css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/clock.js"></script>

<meta charset="UTF-8">
<title>메인</title>

<style type="text/css">

.f1{
padding:5% 0% 0% 50%;
}
.btn{
padding:0% 0% 0% 45%;
}

</style>
</head>
<body>

<div id="clock"></div>


<form action="" class="f1">

</form>

<div class="btn">
<button onclick="javascript:location.href='list.jsp';">목록</button>
<button onclick="location.href='input.jsp'">입력</button>
</div>

</body>
</html>