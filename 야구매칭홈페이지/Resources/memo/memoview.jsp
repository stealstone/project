<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.MemberBean" />    
<jsp:directive.page import="Baseball.libs.model.MemoBean" />
<jsp:useBean id="ss" class="Baseball.libs.control.MemoSelectService" />
 
<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	int idx = Integer.parseInt(request.getParameter("idx"));	
	MemoBean mb = ss.getmemo(idx, me.getUserid());

%>   
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쪽지 글</title>

<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/memoview.css">
<script>
	function back(){
		location.href = "memolist.jsp?page=1";
	}
	
	function rewrite(){
		var x=document.getElementById("infoTable").rows[0].cells; 		
		location.href = "memorewrite.jsp?receive="+x[1].innerHTML;
	}

</script>
</head>
<body> 	
 	
<!-- ========== header ==========  -->
		 
	<header id="header">			
		<jsp:include page="../common/header.jsp" />
	</header>
				
<!-- ========== container ========== -->

	<div id="divContainer">
		<!---@@   sidebar  @@-->
		<div id="divSide">
			<jsp:include page="../common/sidebar.jsp" />
		</div>
		
		<!---@@  content  @@-->	
						
		<div id="divContent">	 				
			<h2>쪽지 내용</h2>	
			<form>	 
				<hr>
				<table class="tblViewInfo" id="infoTable">
					<tr>
						<th>보낸 사람</th>
						<td><%=mb.getSendid() %></td>						
					</tr>
					<tr>
						<th>받은 시간</th>	
						<td><%=mb.getDate() %></td>					
					</tr>
				</table>
				<hr>
				<table class="tblViewInfo" id="infocontent">	
					<tr>
						<th>내용</th>
						<td><%=mb.getContent() %></td>						
					</tr>				
				</table>
				<hr>
				<div id="memoview_btn">
					<input type="button" value="확인" onclick="back()">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="답장" onclick="rewrite()">			
				</div>
			</form>
			
		<!-- divContent 끝 -->
			
		</div> 	
	</div> 		
	<!-- divContainer 끝 -->
<!-- ============= footer   ============== -->
		  	
	<footer id="footer">			
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
</body>
</html>