<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.GudanMemberBean" />

<jsp:useBean id="ic" class="Baseball.libs.control.InsertGudanMemberController" /> 
<jsp:useBean id="sc" class="Baseball.libs.control.SelectGudanMemberController" /> 

<%
	GudanBean gudan = (GudanBean)session.getAttribute("gudan");
	MemberBean me = (MemberBean)session.getAttribute("me");
	int guno = gudan.getGuno();
	String w = "w";
	GudanMemberBean gmb = new GudanMemberBean();
	gmb.setMemId(me.getUserid());
	gmb.setGumcomfirm(w);
	gmb.setGumpostion("");
	gmb.setGuno(gudan.getGuno());
	int gunoDB = sc.getGuno(me.getUserid());
	
	if(guno == gunoDB){%>
	<script>
	alert("구단가입 신청이 있습니다.");
	location.href = "../common/gudanpage1.jsp?gname=" + "<%=gudan.getGudan()%>"; 
	</script>
<%  }else if(guno != gunoDB){
	ic.gmemberinsert(gmb);%>
	<script>
	alert("구단가입 신청이 되었습니다.");
	location.href = "../common/gudanpage1.jsp?gname=" + "<%=gudan.getGudan()%>"; 
	</script>
	
	<% }%>
