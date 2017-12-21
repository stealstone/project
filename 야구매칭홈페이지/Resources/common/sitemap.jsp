
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_sitemap.css">
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
				
					<!-- 이미지 -->
					<img id="sitemap_img" src="../images/sitemap_img.png" />
					<!-- 리스트 -->
					<div id="divSMLogin">
						<ul>
							<li>회원정보관리</li>
							<ul>
								<li><a href="#">로그인</a></li>							
								<li><a href="#">회원가입</a></li>
								<li><a href="#">구단정보보기</a></li>		
								<li><a href="#">회원정보보기</a></li>	
							</ul>
						</ul>
					</div>
				
					<div id="divSMBoard">
						<ul>
							<li>게시판</li>
								<ul>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">매칭게시판</a></li>
									<li><a href="#">홍보게시판</a></li>
									<li><a href="#">자유게시판</a></li>
									<li><a href="#">Q&A게시판</a></li>
								</ul>
						</ul>
					</div>										
				</div>
			</div> 
		</div>
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>