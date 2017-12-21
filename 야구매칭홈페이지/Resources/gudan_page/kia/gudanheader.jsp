<%@page import="Baseball.libs.model.GudanBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="ic" class="Baseball.libs.control.InsertGudanMemberController" />

<%
	GudanBean gudan = (GudanBean)session.getAttribute("gudan");
	MemberBean me = (MemberBean)session.getAttribute("me");
	String grade = me.getGrade();
%>  
<script>
	function join(){
		location.href='../../gudan/gm_insert.jsp';
	}
</script>
<script type="text/javascript">
	function close(evt){
		window.close();
	}
</script>
	<div id="header">
		<h1><a href="../../common/gudanpage1.jsp?gname=<%=gudan.getGudan() %>" style="text-decoration: none; color:white;font-family: 'Hanna';text-shadow:1px 1px 3px black;"><%=gudan.getGudan() %>구단 페이지</a></h1>	 
	<form id="gu_btn1">
		<div class="gu_btn">
		<% if(grade.equals("1")){ %>
			<button type="button" class="btn btn-primary" onClick="join()">구단가입</button>
		<%} %>
		</div>
	</form>
	</div>	