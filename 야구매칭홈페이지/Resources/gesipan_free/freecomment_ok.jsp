<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="Baseball.libs.model.MemberBean"%>
<jsp:useBean id="cb" class="Baseball.libs.model.CommentBean" />
<jsp:useBean id="fis" class="Baseball.libs.control.FreeInsertService" />
<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.Date" />
<jsp:directive.page import="java.util.GregorianCalendar" />


<% request.setCharacterEncoding("utf-8"); %>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	MemberBean me = (MemberBean)session.getAttribute("me");	
	String text = request.getParameter("textComment");	
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String date = formatter.format(new java.util.Date()); 
	Date da = formatter.parse(date);
	
	cb.setGesipanidx(idx);
	cb.setId(me.getUserid());
	cb.setReply(text);
	cb.setDate(da);
	
	int row = fis.insert_comment(cb); 
	if(row == 0){
%>

<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	location.href="../gesipan_free/freeview.jsp?idx=<%=idx%>&flag=false";
</script>
<% } %>