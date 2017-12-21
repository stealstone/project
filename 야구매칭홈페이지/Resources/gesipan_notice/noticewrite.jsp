<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
window.onload=function()
{
	//CKEDITOR.replace('CheckEditor');	
}
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
					<h2>새글쓰기</h2>
					<hr>
					<form action='noticewrite_ok.jsp' method="post" name="noticewrite">										
						<table id="tblWrite">									
							<tr>
								<td>제목</td>
								<td>
									<input type='text' size='53' maxlength='53' name="title" />
								</td>
							</tr>	
							<tr>
								<td colspan="2">
						         	<textarea id="CheckEditor" name="Contents"></textarea>
						         </td>
							</tr>								
						</table>	
						<hr>
						<div id="divBtnContain">	
							<input type='button' value ="글 올리기" onclick="Check()" />
							<input type='reset' value="다시 작성하기" />
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