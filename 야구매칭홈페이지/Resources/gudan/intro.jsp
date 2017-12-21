<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="uc" class="Baseball.libs.control.UpdateGudanController" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectGudanController" />
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />

<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	String intro = request.getParameter("intro");
	String intro3 = CharConversion.entoutf8(intro);
	uc.introUpdate(me.getUserid(), intro3);
	String intro1 = sc.getGposts(me.getUserid());
%>	
<%
	out.println(intro1);
%>
