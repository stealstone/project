<%@page import="Baseball.libs.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="nss" class="Baseball.libs.control.NoticeSelectService" />
<jsp:useBean id="nss1" class="Baseball.libs.control.NoticeSelectService" />

<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	String strPage = request.getParameter("page");
	if(strPage == null) strPage = "1";
	int pageSize = 7;
	int pageCount = nss.getNoticePageCount(pageSize);
	int currentPage = Integer.parseInt(strPage); 	
	Vector<GesipanBean> vector = nss1.Notice_all_select();	
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/notice_list.css">
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
					<h2 class="text_align_center">공지사항</h2>
						<br />
									
						<table class="bbsList">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>							
									<th>작성 날짜</th>
									<th>조회수</th>					
								</tr>
							</thead>
							
							<tbody>
								<%
									if(vector == null){
								%>
										<tr>
											<td colspan="4">공지사항이 없습니다</td>
										</tr>										
								<%
									}else{
										int start = (currentPage - 1) * pageSize;
										int count = 0;
										for(int i = start ; i < vector.size() && count < pageSize; i++){
											GesipanBean gb = vector.get(i);										
                                %>
                                		<tr onmouseover="this.style.backgroundColor='#DDDDDD';" onmouseout="this.style.backgroundColor='white';">
                                			<td> <%=gb.getIdx() %> </td>
                                			<td>
                                				<a href="../gesipan_notice/noticeview.jsp?idx=<%=gb.getIdx() %>">
                                					<%= gb.getSubject() %>
                                				</a>
                                			</td>
                                			<td> <%= gb.getDate() %> </td>
                                			
                                			<td> <%= gb.getViews() %> </td>
                                		</tr>
                                <% 
                                		count++;
                                		}
                                	} 
                                %>
							</tbody>							
						</table>
						<br /><br />
						
						<table style="width:100%;margin-left:auto;margin-right:auto;">
							<tr>
								<td align="center">
									<% if(currentPage == 1){ %>
										[이전]
									<%}else { %>
										[<a href="noticelist.jsp?page=<%=currentPage - 1%>">이전</a>]
									<%} %>
									
									<% for(int i = 1 ; i <= pageCount ; i++){  %>
											<% if(i == currentPage){ %>
												<span style="font-size:1.2em;color:red"><%=i %></span>&nbsp;&nbsp;
											<%}else{ %>
											    <a style="text-decoration:none" href="noticelist.jsp?page=<%=i%>"><%=i %></a>&nbsp;&nbsp;
											<%} %>
									<% }  %>
									
									<% if(currentPage == pageCount){ %>
										[다음]
									<% }else{ %>
										[<a href="noticelist.jsp?page=<%=currentPage + 1%>">다음</a>]
									<% } %>
								</td>						
							</tr>
						</table>
						<!-- 버튼 -->	
						<% if(me.getGrade().equals("4")){ %>							
							<a href="../gesipan_notice/noticewrite.jsp"><img id="btnWrite" src="../images/write.gif" ></a>
						<% } %>				
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