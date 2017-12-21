<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MemberBean"%>
<jsp:useBean id="cb" class="Baseball.libs.model.CommentBean" />
<jsp:useBean id="is" class="Baseball.libs.control.InsertService" />


<% request.setCharacterEncoding("utf-8"); %>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	cb.setGesipanidx(idx);
	MemberBean me = (MemberBean)session.getAttribute("me");	
	/* 댓글 아이디 */
	cb.setId(me.getUserid());
	/* 댓글 내용 */
	String text = request.getParameter("textComment");
	text = text.replace("<", "&lt;");
	text = text.replace(">", "&gt;");
	text = text.replace("'", "\'");
	cb.setReply(text);
	/* 날짜는 DAO 에서 */
	
	int row = is.insert_comment(cb); 
	if(row == 0){
%>

<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=idx%>";
</script>
<% } %>