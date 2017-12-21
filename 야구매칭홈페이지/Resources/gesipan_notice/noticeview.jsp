<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.MemberBean" />    
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="nss" class="Baseball.libs.control.NoticeSelectService" />
<jsp:useBean id="us" class="Baseball.libs.control.UpdateService" /> 

<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	int idx = Integer.parseInt(request.getParameter("idx"));	
	GesipanBean gb = nss.Notice_select(idx);
%>       
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 글</title>

<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_list.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_view.css">

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
		
			<!-- 게시글 기본 폼 -->	
			<form>	 				
				<table id="tblViewInfo">
					<thead>
						<tr>
							<th class="content"><%=idx %></th>
							<td colspan="5" class="content"><%=gb.getSubject() %></td>
						</tr>							
						<tr>
							<th class="content">작성자</th>
							<td class="content">관리자</td>									
							<th class="content">작성 날짜</th>
							<td class="content"><%=gb.getDate() %></td>
							<th class="content">조회수</th>
							<td class="content"><%=gb.getViews() %></td>
						</tr>											
				</table>
				
				<!-- 내용 출력 테이블 -->
				<table id="tblText">
					<tr>
						<td class="content">
							<%= gb.getPosts() %>
						</td>
					</tr>
				</table>
				
				<!-- 버튼 테이블 -->	
				<table id="tblBtn">
				  <tr>
				  	<%
						if(me.getGrade().equals("4")){
					%>			
							<td>																										 						  
								<input type="button" value="수정하기" onclick="location.href='../gesipan_notice/noticere.jsp?idx=<%=idx %>'">&nbsp;
								<input type="button" value="삭제하기" onclick="location.href='../gesipan_notice/noticedel.jsp?idx=<%=idx %>'">&nbsp;
								<input type="button" value="목록으로" onclick="location.href='../gesipan_notice/noticelist.jsp'">
							</td>
					<%
						}else{					
					%>
							<td>														 						  
								<input type="button" value="목록으로" onclick="location.href='../gesipan_notice/noticelist.jsp'">
							</td>
					<%
						}
					%>		
				  </tr>
				</table>
			</form>
			<hr>					
					
		</div> 						
	</div>	
<!-- ============= footer   ============== -->
		  	
	<footer id="footer">			
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
</body>
</html>

<%
	us.updateNoticeReadcount(idx); 
%>