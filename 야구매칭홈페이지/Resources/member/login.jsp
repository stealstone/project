<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />
<jsp:useBean id="sc1" class="Baseball.libs.control.SelectController" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />

<%
    String userid = request.getParameter("userid");
	String passwd = request.getParameter("pass");
	int flag = sc.login(userid, passwd);
	if(flag == -1){
%>    
<script>
	alert("등록되지 않는 아이디입니다.\n확인 후 회원가입해 주세요.");	
	history.back();
</script>
<% }else if(flag == 0){ %>
<script>
	alert("패스워드가 일치하지 않습니다.\n확인 후 다시 로그인 해 주세요.");
	history.back();
</script>
<%}
	else if(flag == 1){
		MemberBean me = sc1.getmember(userid);		
		session.setAttribute("me", me);
		response.sendRedirect("../common/main.jsp");
	}
%>