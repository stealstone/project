<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.MemoBean" />
<jsp:useBean id="is" class="Baseball.libs.control.MemoInsertService" />
 
<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	
	request.setCharacterEncoding("utf-8");
	String receivid = request.getParameter("receive");
	
	String content = request.getParameter("detail");
	content = content.replace("<", "&lt;");
	content = content.replace(">", "&gt;");
	content = content.replace("'", "\'");
	content = content.replace("\r\n", "<br />");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy-MM-dd [HH:mm]");
	String date = formatter.format(new java.util.Date()); 
	
	MemoBean memo = new MemoBean();
	memo.setSendid(me.getUserid());
	memo.setReceivid(receivid);
	memo.setContent(content);
	memo.setDate(date);
	
	int row = is.insert(memo);
	if(row == 0){
%>
<script>
	alert("쪽지 보내기가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("쪽지를 성공적으로 보냈습니다.");
	location.href="memolist.jsp?page=1";
</script>
<% } %>
