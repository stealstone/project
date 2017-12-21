<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="java.util.StringTokenizer" />
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:useBean id="ugc" class="Baseball.libs.control.UpdateGudanController" />

<%
	String gudanName1 = request.getParameter("gudanName");
	String gudanName = CharConversion.entoutf8(gudanName1);
		
	StringTokenizer st = new StringTokenizer(gudanName);
	Vector<String> vector = new Vector<String>(1,1);
	
	while (st.hasMoreElements()) { 
		vector.add(st.nextToken(",")); 			
	}
	int row = ugc.pointUpdate(vector);
	if(row == 0){
%> 
<script>
	alert("패널티 부여가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>	
	location.href="manager.jsp";	
</script>
<% } %>
    