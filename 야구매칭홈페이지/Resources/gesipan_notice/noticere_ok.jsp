<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.Date" />
<jsp:directive.page import="java.util.GregorianCalendar" />
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:directive.page import="Baseball.libs.model.GesipanDAO" />
<jsp:useBean id="nus" class="Baseball.libs.control.NoticeUpdateService" />

<%	
	request.setCharacterEncoding("utf-8");

	String idx1 = request.getParameter("idx");
	int idx = Integer.parseInt(idx1);
	String title = request.getParameter("title");
	
	String content = request.getParameter("Contents");
	content = content.replace("<", "&lt;");
	content = content.replace(">", "&gt;");
	content = content.replace("'", "\'");
	content = content.replace("\r\n", "<br />");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String date = formatter.format(new java.util.Date()); 
	Date da = formatter.parse(date);
			
	GesipanBean gb = new GesipanBean();
	gb.setDate(da);
	gb.setSubject(title);
	gb.setPosts(content);
		
	int row = nus.Noticeupdate(idx, gb);
	if(row == 0){
%>
<script>
	alert("수정 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("수정 되었습니다.");
	location.href="noticelist.jsp?page=1";
</script>
<% } %>