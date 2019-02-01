<%@page import="tt.Select_option_bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="tt.Connect" />
<jsp:useBean id="bean" class="tt.JqGridBean" />
<jsp:useBean id="bean1" class="tt.Select_option_bean" />
<jsp:setProperty property="*" name="bean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>
<style type="text/css">
.frm1 {
	
}

.t1, tr, th, td {
	border: 1px solid #000000;
	border-collapse: collapse;
	text-align: center;
}

.t1 {
	width: 100%;
}

input {
	width: 100px;
	padding: 0 0 0 0;
}
</style>
</head>
<body>

	<h1 align="center">입력폼</h1>

	<form method="post" action="inputReg.jsp" class="frm1">
		<table class="t1">
			<tr>
				<th rowspan="2">주관팀</th>
				<th rowspan="2">PJT NO.</th>
				<th rowspan="2">PJT NAME</th>
				<th rowspan="2">매출 구분</th>
				<th rowspan="2">발주처</th>
				<th rowspan="2">매출 일자</th>
				<th rowspan="2">매출액</th>
				<th colspan="7">실적 제조 원가 (제조 직접비 = 자재비 + 노무비 + 경비)</th>
				<th rowspan="2">매출 이윤</th>
				<th rowspan="2">이윤율</th>
				<th rowspan="2">입력자</th>
			</tr>
			<tr>
				<th>판금/도장</th>
				<th>전기자재</th>
				<th>구조자재</th>
				<th>노무비(외주)</th>
				<th>경비</th>
				<th>외주 TURNKEY</th>
				<th>기타</th>
				<!-- <th>소계</th> -->
			</tr>
			<tr>
				<td><select name="team">
						<%
							for (int i = 0; i <= 100; i++) {
								Select_option_bean sob = mgr.select(i,1);
								if (sob.getNo() != 0) {
						%>
						<option value="<%=sob.getOption_name()%>"><%=sob.getOption_name() %></option>
						<%
							}
							}
						%>

				</select></td>
				<td><input name="project_no" required></td>
				<td><input name="project_name" required></td>
				<td><input name="division" required></td>
				<td><input name="client" required></td>
				<td><input type="date" name="date" required></td>
				<td><input type="number" name="sales" required></td>
				<td><input type="number" name="m1" required></td>
				<td><input type="number" name="m2" required></td>
				<td><input type="number" name="m3" required></td>
				<td><input type="number" name="m4" required></td>
				<td><input type="number" name="m5" required></td>
				<td><input type="number" name="m6" required></td>
				<td><input name="m7"></td>
				<!-- <td><input type="number" name="m8" required></td> -->
				<td><input type="number" name="profit" required></td>
				<td><input type="number" name="rate" required></td>
				<td><input name="input" value="admin"></td>
			</tr>
		</table>

		<p>

			<input type="submit" value="등록하기"> <input type="reset"
				value="리셋하기"> <input type="button" value="처음으로"
				onclick="javascript:location.href='index.jsp'">
	</form>




</body>
</html>