<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="java.util.StringTokenizer" />
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:useBean id="dc" class="Baseball.libs.control.DeleteController" />

<%
	String userid1 = request.getParameter("userid");
	String userid = CharConversion.entoutf8(userid1);	
	
	StringTokenizer st = new StringTokenizer(userid);
	Vector<String> vector = new Vector<String>(1,1);
	
	while (st.hasMoreElements()) { 
		vector.add(st.nextToken(",")); 			
	}
	int row = dc.memberDelete(vector);
	if(row == 0){ 
%>
<script>
	alert("회원 삭제가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>	
	location.href="manager.jsp";	 
</script>
<% } %>

    