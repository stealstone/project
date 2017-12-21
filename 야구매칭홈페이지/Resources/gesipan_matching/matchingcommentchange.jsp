<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="us" class="Baseball.libs.control.UpdateService" />
    
<% String idx = request.getParameter("idx");
	
	

%>
<head>
<style>
textarea{
	width:400px;
}
</style>
</head>
<body>
	<form>
		<table>
			<textarea id="taComment" name="taComment" size="400"></textarea>
			<input type="button" onclick="Check()" value="덧글 수정">		
		</table>		
	</form>
</body>
