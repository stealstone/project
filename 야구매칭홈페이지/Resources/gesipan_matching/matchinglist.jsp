<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:directive.page import="java.util.Date" />
<jsp:useBean id="ss" class="Baseball.libs.control.SelectService" />
<jsp:useBean id="ss1" class="Baseball.libs.control.SelectService" />

    
<%
	String strPage = request.getParameter("page");
	if(strPage == null) strPage = "1";
	int pageSize = 20;
	int pageCount = ss.getPageCount(pageSize); 
	int currentPage = Integer.parseInt(strPage);
	Vector<GesipanBean> vector = ss1.matchinggp_all_select();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_matchinglist.css">
<script type="text/javascript">
function block(){
	alert("이미 매칭이 끝난 글입니다.");
	window.herf="../gesipan_matching/matchinglist.jsp";
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
			
				<!--  @@@@@@@ 게시판 시작 @@@@@@@ -->	
							
				<div>
					<h2>매칭 게시판</h2>
						<br />						
						
						<table class="bbsList">
							<tbody>
							<tr>
								<th>번호</th>
								<th>지역</th>							
								<th>제목</th>
								<th>작성자</th>
								<th>구단 이름</th>
								<th>작성 날짜</th>
										
							</tr>
							
							 <%
								if(vector == null){
							%>
							<tr>
								<td colspan="7">작성된 글이 없습니다.</td>
							</tr>						
							<% 
									}else{
										int start = (currentPage - 1) * pageSize; 
										int count = 0;
										for(int i = start ; i < vector.size() && count<pageSize ; i++){
											GesipanBean gb = vector.get(i);
											int idx = gb.getIdx();
                             %>
							<tr onmouseover="this.style.backgroundColor='#DDDDDD';" onmouseout="this.style.backgroundColor='white';">
							
								<!-- 번호 -->
								<td ><%=idx %></td>								
								<!-- 지역 -->
								<%
									String place = gb.getPlace();	
								%>
								<td>
									<%=place %>
								</td>								
								<!-- 제목 -->
								<%
									String subject = gb.getSubject();									
								%>								
								<td><a href="matchingview.jsp?idx=<%=idx%>"><%=subject %></a></td>								
								<!-- 작성자 -->
								<%
									String id = gb.getId();
								%>
								<td><%=id %></td>								
								<!-- 구단이름 -->
								<%
									String gname = gb.getGname();
								%>
								<td><%=gname %></td>								
								<!-- 작성날짜 -->
								<%
									Date date = gb.getDate();
								%>
								<td><%=date %></td>
							</tr>							
							<%
										count++;
									}	//end for
								}	//end if
							%>
							
						</tbody></table>
						<!-- 페이지 -->
						<table style="width:100%;margin-left:auto;margin-right:auto;">
							<tr>
								<td align="center">
								<% if(currentPage == 1){ %>
								[이전]
								<%}else { %>
								[<a href="matchinglist.jsp?page=<%=currentPage - 1%>">이전</a>]
								<% } %>
								<%  for(int i = 1 ; i <= pageCount ; i++){  %>
										<% if(i == currentPage){ %>
											<span style="font-size:1.2em;color:red"><%=i %></span>&nbsp;&nbsp;
										<%}else{ %>
									       <a style="text-decoration:none" href="matchinglist.jsp?page=<%=i%>"><%=i %></a>&nbsp;&nbsp;
									    <%} %>
								<% }  %>
								<% if(currentPage == pageCount){ %>
								[다음]
								<% }else{ %>
								[<a href="matchinglist.jsp?page=<%=currentPage + 1%>">다음</a>]
								<% } %>
								</td>						
							</tr>
						</table>
					<!-- 버튼 -->
						
					<form>
						
						<a href="../gesipan_matching/matchingwrite.jsp"><img id="btnWrite" src="../images/write.gif" ></a>
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