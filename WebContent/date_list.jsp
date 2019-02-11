<%@page import="tt.JqGridBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="tt.Connect" />
<jsp:useBean id="bean" class="tt.JqGridBean" />
<%
	request.setCharacterEncoding("UTF-8");
String start_date=request.getParameter("start_date");
String end_date=request.getParameter("end_date");
int date_res=0; if(start_date==null||end_date==null){date_res=1;}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>

<link href="css/main.css" rel="stylesheet" type="text/css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script type="text/javascript">

	if (<%=date_res%>==1) {
		alert("날짜를 선택해주세요");
		location.href="list.jsp";
	}
	
	function a() {
		$("#table1").table2excel({
			name : "Excel table",
			filename : "excel table",
			fileext : ".xls",
			exclude_img : true,
			exclude_links : true,
			exclude_inputs : true
		});
	}

	function chk() {
		alert("선택된 값 : " + $("input[name=chk]:checked").map(function() {
			return this.value;
		}).get().join(","));
	}

	function del() {
		$('table').find("input[name=chk]:checked").each(function(i, e) {
			alert(this.value);
		});
	}

	function dod() {
		var con = confirm("삭제하시겠습니까?");
		if (con == true) {
			document.getElementById('frm1').submit();
		} else if (con == false) {
			return;
		}
	}
	
	<%-- function nosort() {
		<%boolean nosort_res=mgr.nosort();%>
		alert("<%=nosort_res%>");
		
	} --%>
	
	function date_list() {
		var d=document.getElementById("start_date").value;
		
		alert(d);
		
		
	}
	
	
	
</script>

</head>
<body>
	<button onclick="javascript:location.href='index.jsp'">메인으로</button>
	<button name="btn1" id="btn1" onclick="a()">Excel 다운로드</button>
	<button name="btn2" id="btn2" onclick="chk()">체크확인</button>
	<button name="btn3" id="btn3" onclick="dod()">삭제</button>
	<!-- <button name="btn4" id="btn4" onclick="nosort()">번호 재정렬</button> -->
	<p>
		<form action="date_list.jsp" method="post">
		시작일 : <input name="start_date" id="start_date" type="date"> 종료일 : <input id="end_date" type="date">
		<button onclick="date_list()">조회</button>
		<button type="submit">조회하기</button>
		</form>
	<p>
	<table id="menutb">
		<tr>
			<th rowspan="2" id="cbox"></th>
			<th rowspan="2" id="no">번호</th>
			<th rowspan="2" id="tm">주관팀</th>
			<th rowspan="2" id="pno">PJT NO.</th>
			<th rowspan="2" id="pn">PJT NAME</th>
			<th rowspan="2" id="di">매출 구분</th>
			<th rowspan="2" id="cl">발주처</th>
			<th rowspan="2" id="da">매출 일자</th>
			<th rowspan="2" id="sa">매출액</th>
			<th colspan="8">실적 제조 원가 (제조 직접비 = 자재비 + 노무비 + 경비)</th>
			<th rowspan="2" id="pr">매출 이윤</th>
			<th rowspan="2" id="ra">이윤율</th>
			<th rowspan="2" id="ipd">최종입력일자</th>
			<th rowspan="2" id="inp">입력자</th>
		</tr>
		<tr>
			<th id="m1">판금/도장</th>
			<th id="m2">전기자재</th>
			<th id="m3">구조자재</th>
			<th id="m4">노무비(외주)</th>
			<th id="m5">경비</th>
			<th id="m6">외주 TURNKEY</th>
			<th id="m7">기타</th>
			<th id="m8">소계</th>
		</tr>

	</table>
	<form id="frm1" action="deleteReg.jsp" method="post">
		<table class="table1" id="table1">

			<tr hidden="1">
				<th id="cbox"></th>
				<th id="no">번호</th>
				<th id="tm">주관팀</th>
				<th id="pno">PJT NO.</th>
				<th id="pn">PJT NAME</th>
				<th id="di">매출 구분</th>
				<th id="cl">발주처</th>
				<th id="da">매출 일자</th>
				<th id="sa">매출액</th>
				<th id="m1">판금/도장</th>
				<th id="m2">전기자재</th>
				<th id="m3">구조자재</th>
				<th id="m4">노무비(외주)</th>
				<th id="m5">경비</th>
				<th id="m6">외주 TURNKEY</th>
				<th id="m7">기타</th>
				<th id="m8">소계</th>
				<th id="pr">매출 이윤</th>
				<th id="ra">이윤율</th>
				<th id="ipd">최종입력일자</th>
				<th id="inp">입력자</th>
			</tr>


			<%

				for (int i = 0; i <= 300; i++) {

					JqGridBean list = mgr.date_list(start_date, end_date,i);
					
					if (list.getNo() != 0) {
			%>
			<tr>
				<td id="cbox"><input id="chk" name="chk" type="checkbox"
					value="<%=i%>"></td>
				<td id="no"><%=list.getNo()%></td>
				<td id="tm"><%=list.getTeam()%></td>
				<td id="pno"><%=list.getProject_no()%></td>
				<td id="pn"><%=list.getProject_name()%></td>
				<td id="di"><%=list.getDivision()%></td>
				<td id="cl"><%=list.getClient()%></td>
				<td id="da"><%=list.getDate()%></td>
				<td id="sa"><%=list.getSales()%></td>
				<td id="m1"><%=list.getM1()%></td>
				<td id="m2"><%=list.getM2()%></td>
				<td id="m3"><%=list.getM3()%></td>
				<td id="m4"><%=list.getM4()%></td>
				<td id="m5"><%=list.getM5()%></td>
				<td id="m6"><%=list.getM6()%></td>
				<td id="m7"><%=list.getM7()%></td>
				<td id="m8"><%=list.getM8()%></td>
				<td id="pr"><%=list.getProfit()%></td>
				<td id="ra"><%=list.getRate()%></td>
				<td id="ipd"><%=list.getInput_date()%></td>
				<td id="inp"><%=list.getInput()%></td>
			</tr>
			<%
				}
				}
			%>

		</table>
	</form>

</body>
</html>
