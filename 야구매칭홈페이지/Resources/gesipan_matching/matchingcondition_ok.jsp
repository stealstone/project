<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="Baseball.libs.model.MatchingBean"%>
<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" /> 
<jsp:useBean id="mus" class="Baseball.libs.control.MatchingUpdateService" /> 
<% request.setCharacterEncoding("utf-8"); %>

<%
	int idx = Integer.parseInt(request.getParameter("gesipanidx"));
	
	int mano = Integer.parseInt(request.getParameter("mano"));
	MatchingBean mb = mss.getMatching(mano);
	String result = request.getParameter("myresult");
	mb.setMaresult(result);
	
	int row = mus.update(mano, mb);
	if(row == 0){
%>
<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("등록되었습니다.")
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=idx%>";
</script>
<% } %>