<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" /> 
<jsp:useBean id="sc1" class="Baseball.libs.control.SelectGudanController" /> 
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:directive.page import="java.util.Vector" />
<%
 	String gname1 = request.getParameter("gname");
	String gname = CharConversion.entoutf8(gname1);
	MemberBean me = (MemberBean)session.getAttribute("me");
	GudanBean gb = sc1.getGudan(gname);
	if(me.getGrade().equals("3") && gb.getGudan().equals(me.getGudan())){
%>
<script>
	location.href = ".." + "<%=gb.getGpage() %>" + "/gudanview_admin.jsp?gname=<%=gb.getGudan()%>";
</script>    
<%}else{ %>

<script>
	location.href = ".." + "<%=gb.getGpage()%>" + "/gudanview_mem.jsp?gname=<%=gb.getGudan() %>";
</script> 
<%} %>