<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="fds" class="Baseball.libs.control.FreeDeleteService" />

<%
	String idx = request.getParameter("idx");
	String gidx1 = request.getParameter("gidx");
	int gidx = Integer.parseInt(gidx1);
	int row = fds.FreeCommentdelete(Integer.parseInt(idx));
	if(row == 0){
%>
<script>
	alert("삭제가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	//alert("성공적으로 삭제했습니다.");
	location.href="freeview.jsp?idx=<%=gidx %>&flag=false";
</script>
<% } %>