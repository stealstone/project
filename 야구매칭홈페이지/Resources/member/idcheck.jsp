<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />

<%
	String userid = request.getParameter("userid");
	if(userid == null) userid = "";
	
	boolean flag = true;
	if(!userid.equals("")){
		flag = sc.idcheck(userid);
	}
%>
<head>
	<script>
		function idcheck(){
			if(!document.getElementById("userid").value){
				alert("아이디를 입력하세요");
				document.forms[0].userid.focus();
			}else{
				document.forms[0].submit();
			}		
		}
		function Close(){
			if((document.getElementById("check").value != "false") || document.getElementById("userid").value == ""){
				opener.document.getElementById("join_userid").value = 
				    document.getElementById("userid").value;
				opener.document.getElementById("flag").value = "true";	
				//alert("창을 닫기 전에 \n아이디 중복 검사를 하셔야 합니다.");
				//document.forms[0].userid.focus();
				self.close();
			}else{
				opener.document.getElementById("join_userid").value = 
					    document.getElementById("userid").value;
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
			<td><input type="text" id="userid" name="userid" value="<%=userid %>" /></td>
			<td>
			<a href="javascript:idcheck()">아이디 검색</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<% if(flag && !userid.equals("")){ %>
			<span style="color:red;font-size:1.1em;font-weight:bold">
			[<%=userid %>]는 이미 사용중인 아이디입니다.
			</span>
			<%}else if(!flag && !userid.equals("")){ %>
			<span style="color:green;font-size:1.2em;font-weight:bold">
			[<%=userid %>]는 사용가능한 아이디입니다.
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





