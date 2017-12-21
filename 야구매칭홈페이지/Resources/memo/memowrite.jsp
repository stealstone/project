<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/memowrite.css">
<script type="text/javascript" src="../js/memowrite.js"></script>	

<title>쪽지 쓰기</title>

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
			
				<!--  form -->	
							
			<div id="divContent">	 
				<h2>쪽지 쓰기</h2>
				<hr>
				<form method="post" action="memowrite_ok.jsp" name="memowrite_form">
					<input type="hidden" id="flag" name="flag" value="true" />										
					<table id="tblWrite">
						<tr>
							<th>받는이</th>
							<td><input type="text" id="receive" name="receive" maxlength="15">&nbsp;&nbsp;
							<input type="button" name="r_search" value="아이디 검색" onclick="receiveCheck()"></td>							
						</tr>	
						
						<tr>
							<th>내 용</th>
							<td><textarea cols="26" rows="10" name="detail" ></textarea></td>							
						</tr>				
						
					</table>	
					<div id="divBtnContain">	
						<input type='button' value ="보내기" onclick="memoOk()"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type='button' value="뒤로" onclick="back()" />
					</div>				
				</form>   					
			</div>
			
		</div>
		
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	

</body>
</html>