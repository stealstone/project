<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="java.util.StringTokenizer" />
<jsp:useBean id="ds" class="Baseball.libs.control.MemoDeleteService" />
 
<%
	String idxs = request.getParameter("idxs");
	System.out.println(idxs);
	StringTokenizer st = new StringTokenizer(idxs);
	Vector<Integer> vector = new Vector<Integer>(1,1);
	
	while (st.hasMoreElements()) { 
		vector.add(Integer.parseInt(st.nextToken(","))); 			
	}	
	
	int row = ds.delete(vector);
	if(row == 0){
%>
<script>
	alert("쪽지 삭제가 실패했습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>	
	location.href="memolist.jsp?page=1";
</script>
<% } %>