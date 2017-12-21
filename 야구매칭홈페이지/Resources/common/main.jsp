<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
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
				<jsp:include page="../common/content.jsp" />				
			</div>
		</div>
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>
