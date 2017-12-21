<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="nds" class="Baseball.libs.control.NoticeDeleteService" />

<%
	String idx = request.getParameter("idx");		
	int row = nds.Noticedelete(Integer.parseInt(idx));
	if(row == 0){
%>
<script>
	alert("삭제가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("성공적으로 삭제했습니다.");
	location.href="noticelist.jsp?page=1";
</script>
<% } %>