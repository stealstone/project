<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.MemoBean" />
<jsp:useBean id="ss" class="Baseball.libs.control.MemoSelectService" />
<jsp:useBean id="ss1" class="Baseball.libs.control.MemoSelectService" />

<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	String strPage = request.getParameter("page");
	request.getParameterValues("");
	if(strPage == null) strPage = "1";
	int pageSize = 7;
	int pageCount = ss.getPageCount(pageSize, me.getUserid());
	int currentPage = Integer.parseInt(strPage);	
	Vector<MemoBean> vector = ss1.select_all(me.getUserid());
	if(vector != null){
		for(int i=0; i < vector.size(); i++){			
			String content = vector.get(i).getContent();
			content = content.replace("&lt;","<");
			content = content.replace("&gt;",">");
			content = content.replace("\'","'");
			content = content.replace("<br />","\r\n");
			vector.get(i).setContent(content); 
		}		
	}
%> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/memolist.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	var tbl = $("#memolist");
       
       // 테이블 헤더에 있는 checkbox 클릭시
       $(":checkbox:first", tbl).click(function(){
           // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
           if( $(this).is(":checked") ){
               $(":checkbox", tbl).attr("checked", "checked");
           }
           else{
               $(":checkbox", tbl).removeAttr("checked");
           }

           // 모든 체크박스에 change 이벤트 발생시키기                
           $(":checkbox", tbl).trigger("change");
   	});
 });

function isCheck(){
	var ch = document.getElementsByName("memocheck");
	var idxs = "idxs=";
	var count = 0;
	for(var i=0; i<ch.length; i++){
		if(ch[i].checked == true){
			idxs += ch[i].id+",";
			count++;
		}
	}
	if(count != 0){
		idxs = idxs.substring(0, idxs.length-1);
		var rst = confirm("정말 삭제 하시겠습니까?");
		if(rst){
			location.href = "memodelete.jsp?"+idxs;
		}
	}else{
		alert("쪽지를 선택해 주세요.");
	}	
}

function goWrite(){
	location.href = "memowrite.jsp";
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
				<div>
					<form>
					<h2 class="text_align_center">쪽 지</h2>
						<br />
						<table id="memolist" class="bbsList" style="table-layout:fixed">
							<thead>
								<tr>
									<th class="list_check"><input type="checkbox"/></th>
									<th class="list_send">보낸이</th>							
									<th>내용</th>
									<th class="list_date">작성 날짜</th>					
								</tr>												
							</thead>
							
							<tbody>
								<%
									if(vector == null){
								%>
										<tr>
											<td colspan="4">쪽지가 없습니다.</td>
										</tr>										
								<%
									}else{
										int start = (currentPage - 1) * pageSize;
										int count = 0;
										for(int i = start ; i < vector.size() && count < pageSize; i++){
											MemoBean mm = vector.get(i);										
                                %>
                                		<tr onmouseover="this.style.backgroundColor='gray';" onmouseout="this.style.backgroundColor='white';">
                                			<td class="list_check">
                                				<input type="checkbox" id="<%=mm.getIdx() %>" name="memocheck" />                                  				                            				
                                			</td>
                                			<td class="list_send">
                                				<a href="memoview.jsp?idx=<%=mm.getIdx() %>">
                                					<%= mm.getSendid() %>
                                				</a>
                                			</td>
                                			<td style="text-overflow : ellipsis;overflow : hidden;">
                                				<a href="memoview.jsp?idx=<%=mm.getIdx() %>">
                                					<nobr><%= mm.getContent() %></nobr>
                                				</a>
                                			</td>
                                			<td class="list_date">
                                				<a href="memoview.jsp?idx=<%=mm.getIdx() %>">
                                					<%= mm.getDate() %>
                                				</a>
                                			</td>
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
										[<a href="memolist.jsp?page=<%=currentPage - 1%>">이전</a>]
									<% } %>
									
									<% for(int i = 1 ; i <= pageCount ; i++){  %>
											<% if(i == currentPage){ %>
												<span style="font-size:1.2em;color:red"><%=i %></span>&nbsp;&nbsp;
											<%}else{ %>
											    <a style="text-decoration:none" href="memolist.jsp?page=<%=i%>"><%=i %></a>&nbsp;&nbsp;
											<%} %>
									<% }  %>
									
									<% if(currentPage == pageCount){ %>
										[다음]
									<% }else{ %>
										[<a href="memolist.jsp?page=<%=currentPage + 1%>">다음</a>]
									<% } %>
								</td>						
							</tr>
						</table>			
						<div id="divSubmit">
							<input type="button" value="쓰기" onclick="goWrite()">
							<input type="button" value="삭제" onclick="isCheck()">
						</div>
					</form>
				</div>				
			</div>
		</div> 
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>