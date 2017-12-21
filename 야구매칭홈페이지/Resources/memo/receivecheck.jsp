<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />

<%
	String receiveid = request.getParameter("receiveid");
	if(receiveid == null) receiveid = "";
	
	boolean flag = false;
	if(!receiveid.equals("")){
		flag = sc.idcheck(receiveid);
	}
%>
<head>
	<script>
		function idcheck(){
			if(!document.getElementById("receiveid").value){
				alert("아이디를 입력하세요");
				document.forms[0].receiveid.focus();
			}else{
				document.forms[0].submit();
			}		
		}
		function Close(){
			if((document.getElementById("check").value != "true") || document.getElementById("receiveid").value == ""){
				opener.document.getElementById("receive").value = 
				    document.getElementById("receiveid").value;
				opener.document.getElementById("flag").value = "true";					
				self.close();
			}else{
				opener.document.getElementById("receive").value = 
					    document.getElementById("receiveid").value;
				opener.document.getElementById("flag").value = "false";				
				self.close();
			}
		}
	</script>
</head>
<body>
<form method="get">
	<input type="hidden" id="check" value="<%=flag%>" />
	<table>
		<tr>
			<td>아이디 : </td>
			<td><input type="text" id="receiveid" name="receiveid" value="<%=receiveid %>" /></td>
			<td>
			<a href="javascript:idcheck()">아이디 검색</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<% if(flag && !receiveid.equals("")){ %>
			<span style="color:red;font-size:1.1em;font-weight:bold">
				존재하는 아이디입니다.
			</span>
			<%}else if(!flag && !receiveid.equals("")){ %>
			<span style="color:green;font-size:1.2em;font-weight:bold">
				존재하지 않는 아이디 입니다.
			</span>
			<% } %>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<hr width="80%" />
				<a href="javascript:Close()">확인</a>
			</td>
		</tr>
	</table>	
</form>
</body>