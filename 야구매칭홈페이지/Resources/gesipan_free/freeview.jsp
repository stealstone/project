<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:directive.page import="java.util.Vector" />     
<jsp:directive.page import="Baseball.libs.model.MemberBean" />    
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:directive.page import="Baseball.libs.model.CommentBean" />
<jsp:useBean id="fss" class="Baseball.libs.control.FreeSelectService" />
<jsp:useBean id="fss1" class="Baseball.libs.control.FreeSelectService" />
<jsp:useBean id="fus" class="Baseball.libs.control.FreeUpdateService" />


<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	String flag = request.getParameter("flag");
	if(flag == null) flag = "true";
	int idx = Integer.parseInt(request.getParameter("idx"));	
	GesipanBean gb = fss.Free_select(idx);
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

<script>
function Check(){
	var Write = document.formComment;	
	Write.submit();
}

function CommentDelete(idx,idx2){	
	location.href= "matchingcommentdelete_ok.jsp?gesipanidx=" + idx + "&commentidx="+idx2;
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
			<form>
			<!-- 게시글 기본 폼 -->			 				
				<table id="tblViewInfo">
					<thead>
						<tr>
							<th class="content"><%=idx %></th>
							<td colspan="5" class="content"><%=gb.getSubject() %></td>
						</tr>							
						<tr>
							<th class="content">작성자</th>
							<td class="content"><%=gb.getId() %></td>									
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
			</form>
			
				<!------ 댓글 ------> 			
			
			<%	
				Vector<CommentBean> vector1 = fss1.freeComment_select(idx); 
			%>
			<div id="divComment">
				<form method="get">
					<table>						
						<%
							if(vector1 == null){
						%>
									<tr>
										<td colspan="4">작성된 댓글이 없습니다.</td>
									</tr>
						<% } else {								
								for(int i = 0; i < vector1.size() ; i++){
									CommentBean cb = vector1.get(i);									
	                     %>
									<tr>							
										<!-- 댓글 이름ID -->
										<td><%=cb.getId() %></td>
										<!-- 댓글 내용 -->
										<td id="tdReply01" class="tdR01"><%=cb.getReply() %> </td>	
										<!-- 댓글 날짜 -->
										<td><%=cb.getDate() %></td>
										<%if(cb.getId().equals(me.getUserid())){ %>
											<!-- 삭제 버튼 -->			
											<td>
												<input type="button" value="삭제" onclick="location.href='../gesipan_free/freecomment_del.jsp?idx=<%=cb.getIdx()%>&gidx=<%=idx %>'" />
											</td>
										<%}else{ %>
											<td> </td>
										<%} %>
									</tr>
						<%
								}	//end for
							}	//end if
						%>
						</table>
					</form>
					
					<form name="formComment" action="freecomment_ok.jsp" method="post">
					<fieldset>
				        <div>			
				        	<input type="hidden" name="idx" value="<%=idx%>" />	        	
		                    <input type="text" maxlength="40" id="textareaReplyInsert" name="textComment" size="400"/>		                    
		                    <input type="button" id="btnCommentInsert" class="" onclick="Check()" value="덧글쓰기">
		                    
				        </div>
			        </fieldset>
			    </form>
				</div>
				<hr>
				
				<!-- 버튼 테이블 -->	
				<form>
					<table id="tblBtn">
					  <tr>
					  	<%
							if(me.getUserid().equals(gb.getId())){
						%>			
								<td>																										 						  
									<input type="button" value="수정하기" onclick="location.href='../gesipan_free/freere.jsp?idx=<%=idx %>'">&nbsp;
									<input type="button" value="삭제하기" onclick="location.href='../gesipan_free/freedel.jsp?idx=<%=idx %>'">&nbsp;
									<input type="button" value="목록으로" onclick="location.href='../gesipan_free/freelist.jsp'">
								</td>
						<%
							}else{					
						%>
								<td>														 						  
									<input type="button" value="목록으로" onclick="location.href='../gesipan_free/freelist.jsp'">
								</td>
						<%
							}
						%>		
					  </tr>
					</table>
				</form>			
							
					
		</div> 						
	</div>	
<!-- ============= footer   ============== -->
		  	
	<footer id="footer">			
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
</body>
</html>

<%
	if(flag.equals("true")){
		fus.updateFreeReadcount(idx);
	}
%>