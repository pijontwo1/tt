<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mgr" class="tt.Connect"/>
<jsp:useBean id="bean" class="tt.JqGridBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
String team=request.getParameter("team");
String project_no=request.getParameter("project_no");
String project_name=request.getParameter("project_name");
String division=request.getParameter("division");
String client=request.getParameter("client");
String date=request.getParameter("date");
String m7=request.getParameter("m7");
String input=request.getParameter("input");

int sales=Integer.parseInt(request.getParameter("sales"));
int m1=Integer.parseInt(request.getParameter("m1"));
int m2=Integer.parseInt(request.getParameter("m2"));
int m3=Integer.parseInt(request.getParameter("m3"));
int m4=Integer.parseInt(request.getParameter("m4"));
int m5=Integer.parseInt(request.getParameter("m5"));
int m6=Integer.parseInt(request.getParameter("m6"));
int m8=m1+m2+m3+m4+m5+m6;
int profit=Integer.parseInt(request.getParameter("profit"));
int rate=Integer.parseInt(request.getParameter("rate"));

String msg="입력실패";
	
boolean result;
result=mgr.insert(team, project_no, project_name, division, client, date, sales, m1, m2, m3, m4, m5, m6, m7, m8, profit, rate, "admin");
if(result){
	msg="완료";
}
%>

<script>
location.href="input.jsp"
	alert("<%=msg%>");

</script>
