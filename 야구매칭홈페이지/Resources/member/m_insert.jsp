<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.GregorianCalendar" />
<jsp:directive.page import="java.util.Date" />
<jsp:directive.page import="Baseball.libs.model.MemberJoinBean" />
<jsp:useBean id="ic" class="Baseball.libs.control.InsertController" /> 

<%
 	request.setCharacterEncoding("utf-8");
 %>

<%
	String userid = request.getParameter("join_userid");
	String passwd = request.getParameter("join_passwd");
	String name = request.getParameter("join_name");
	String address = request.getParameter("join_address");
	String tel = request.getParameter("join_tel");
	
	String email1 = request.getParameter("join_email1");
	String email2 = request.getParameter("join_email2");
	String eamil = email1+"@"+email2;
	
	String gender = request.getParameter("join_gender");
	
	String birthday = request.getParameter("join_birthday");
	Calendar cal = new GregorianCalendar(
	Integer.parseInt(birthday.substring(0, 4)), 
	Integer.parseInt(birthday.substring(5,7)),
	Integer.parseInt(birthday.substring(8)));
	Date d = cal.getTime();
	
	String position = request.getParameter("join_position");
	
	String club = null;
	
	MemberJoinBean mb = new MemberJoinBean(userid, passwd, name, address,
			   eamil, gender, d, position, tel, "1", club);
	
	int row = ic.insert(mb);
	if(row == 0){
%>
	<script>
		alert("Failure");
		history.go(-1);
	</script>
<%}else if(row == 1){ %>
	<script>
		alert("회원가입 되셨습니다.");
		location.href = "../index.jsp";
	</script>
<% } %>

<%
	//response.sendRedirect("../index.html");
%>