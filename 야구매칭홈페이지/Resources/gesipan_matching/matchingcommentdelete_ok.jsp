<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MemberBean"%>
<jsp:useBean id="ds" class="Baseball.libs.control.DeleteService" /> 

<% request.setCharacterEncoding("utf-8"); %>


<%	
	int gesipanIdx = Integer.parseInt(request.getParameter("gesipanidx"));
	System.out.println(gesipanIdx);
	int commentIdx = Integer.parseInt(request.getParameter("commentidx"));
	System.out.println("ok안"+commentIdx);
	ds.deleteComment(commentIdx);
%>
<script>
	alert("댓글이 삭제되었습니다.");
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=gesipanIdx%>";
</script>