<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />  
<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	String g = sc.getpage(me.getUserid());
	if(me.getGrade().equals("3")){
%>
<script>
	location.href = ".." + "<%=g %>" + "/gudanview_admin.jsp?gname=<%=me.getGudan() %>";
</script>    
<%}else{ %>

<script>
	location.href = ".." + "<%=g %>" + "/gudanview_mem.jsp?gname=<%=me.getGudan() %>";
</script> 
<%} %>