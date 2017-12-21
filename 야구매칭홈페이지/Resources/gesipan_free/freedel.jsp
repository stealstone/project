<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fds" class="Baseball.libs.control.FreeDeleteService" />
<jsp:useBean id="fds1" class="Baseball.libs.control.FreeDeleteService" />

<%
	
	String idx1 = request.getParameter("idx");
  	int idx = Integer.parseInt(idx1);
	fds.FreeCommentAlldelete(idx);
	int row = fds1.Freedelete(idx);
	if(row == 0){
%>
<script>
	alert("삭제가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("성공적으로 삭제했습니다.");
	location.href="freelist.jsp?page=1";
</script>
<% } %>