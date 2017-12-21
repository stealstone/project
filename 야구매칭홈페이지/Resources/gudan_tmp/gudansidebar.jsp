<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.GudanBean" />

<%
	GudanBean gudan = (GudanBean)session.getAttribute("gudan");
%>  

	<div id="sidebar" > 
		<img class="gudanlogo" src="images/mark.jpg" width="231px" height="190px"/>
		<h3 style="color:white;font-family: 'Hanna';text-shadow:1px 1px 3px black;">연고지 : <%=gudan.getLoc() %></h3>	
  </div>

