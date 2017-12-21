<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_list.css">
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
			
				<!--  @@@@@@@ 게시판 시작 @@@@@@@ -->	
							
				<div>
					<h2 class="text_align_center">Q&A 게시판</h2>
						<br />
						<table class="bbsList">
							<tbody>
							<tr>
								<th>번호</th>
								<th>제목</th>							
								<th>작성자</th>
								<th>작성 날짜</th>					
							</tr>
				
							<tr>
								<td>test</td>
								<td><a href="../gesipan_qna/qnaview.jsp">test</a></td>
								<td>test</td>
								<td>test</td>
							</tr>											
							
						</tbody></table>
					<!-- 버튼 -->
					<form>
						<a href="../gesipan_qna/qnawrite.jsp"><img id="btnWrite" src="../images/write.gif" ></a></td>
					</form>
				</div>
				<!-- 게시판 끝 -->
					
			</div>
		</div> 
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>