<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sc" class="Baseball.libs.control.SelectGudanController" />

<%
	String gudan = request.getParameter("gudan_name");
	if(gudan == null) gudan = "";
	
	boolean flag = true;
	if(!gudan.equals("")){
		flag = sc.gnamecheck(gudan);
	}
%>
<head>
	<script>
		function gnamecheck(){
			if(!document.getElementById("gudan").value){
				alert("구단명을 입력하세요");
				document.forms[0].gudan.focus();
			}else{
				document.forms[0].submit();
			}		
		}
		function Close(){
			if((document.getElementById("check").value != "false") || document.getElementById("gudan").value == ""){
				alert("안돼")
				opener.document.getElementById("gudan_name").value = 
				    document.getElementById("gudan").value;
				opener.document.getElementById("flag").value = "true";	
				//alert("창을 닫기 전에 \n아이디 중복 검사를 하셔야 합니다.");
				//document.forms[0].userid.focus();
				self.close();
			}else{
				alert("된다")
				opener.document.getElementById("gudan_name").value = 
					    document.getElementById("gudan").value;
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
			<td>구단명 : </td>
			<td><input type="text" id="gudan" name="gudan" value="<%=gudan %>" /></td>
			<td>
			<a href="javascript:gnamecheck()">구단명 검색</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<% if(flag && !gudan.equals("")){ %>
			<span style="color:red;font-size:1.1em;font-weight:bold">
			[<%=gudan %>]는 이미 사용중인 구단명입니다.
			</span>
			<%}else if(!flag && !gudan.equals("")){ %>
			<span style="color:green;font-size:1.2em;font-weight:bold">
			[<%=gudan %>]는 사용가능한 구단명입니다.
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





