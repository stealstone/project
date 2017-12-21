<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="nss" class="Baseball.libs.control.NoticeSelectService" />
<jsp:useBean id="us" class="Baseball.libs.control.UpdateService" /> 

<%	
	int idx = Integer.parseInt(request.getParameter("idx"));	
	GesipanBean gb = nss.Notice_select(idx);
	
	String content = gb.getPosts();
	content = content.replace("&lt;","<");
	content = content.replace("&gt;",">");
	content = content.replace("\'","'");
	content = content.replace("<br />","\r\n");
	
	gb.setPosts(content);

%>          
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 글 쓰기</title>

<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_write.css">
<script type="text/javascript" src="../js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

function Check(){
	var Write = document.noticewrite;	

	if(!Write.title.value) {
		alert("글 제목을 입력하세요.");	
		Write.title.focus(); 
		return false;
    }

	if(!Write.Contents.value){
        alert("내용을 입력하세요");
        Write.Contents.focus();
        return false;
    }
	
	Write.submit();
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
			
				<!--  form -->	
							
				<div id="divContent">	 
					<h2>공지사항 수정하기</h2>
					<hr>
					<form action='noticere_ok.jsp' method="post" name="noticewrite">										
						<table id="tblWrite">									
							<tr>
								<td>제목</td>
								<td>
									<input type="hidden" name="idx" value="<%=idx %>" />
									<input type='text' size='53' maxlength='53' name="title" value="<%=gb.getSubject() %>" />
								</td>
							</tr>	
							<tr>
								<td colspan="2">
						         	<textarea id="CheckEditor" name="Contents" ><%=gb.getPosts() %></textarea>
						         </td>
							</tr>								
						</table>	
						<hr>
						<div id="divBtnContain">	
							<input type='button' value ="수정하기" onclick="Check()" />							
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