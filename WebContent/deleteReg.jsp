<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mgr" class="tt.Connect"/>
<jsp:useBean id="bean" class="tt.JqGridBean"/>
<%

String msg="실패";	
boolean result=false;

String[] value=request.getParameterValues("chk");
if(request.getParameterValues("chk")==null){

%>
<script>
alert("선택한 값이 없습니다.");
location.href="list.jsp";
</script>
<%
}
else{
int[] nos=new int[value.length];
for(int i=0;i<value.length;i++){
	nos[i]=Integer.parseInt(value[i]);
	out.print(nos[i]+"<br>");
	result=mgr.delete(nos[i]);
}


if(result){
	msg="삭제완료";
}

%>

<script>
alert("<%=msg%>");
location.href="list.jsp";


</script>

<%}%>