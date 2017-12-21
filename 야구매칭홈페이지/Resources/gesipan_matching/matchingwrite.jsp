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
/* window.onload=function()
{
CKEDITOR.replace('CheckEditor');	
} */
function Check(evt){
	var Write = document.writeForm;
		if (!Write.selectId.value) {
			alert("지역을 입력하세요.");
			Write.selectId.focus(); 
	        return false;
		}

		if (!Write.inputTitle.value) {
			alert("제목를 입력하세요.");
			Write.inputTitle.focus(); 
	        return false;
		}    
		if (!Write.inputDate.value) {
			alert("경기 날짜를 입력하세요.");
			Write.inputDate.focus(); 
	        return false;
		}    
		if (!Write.CheckEditor.value) {
			alert("내용을 입력하세요.");
			Write.CheckEditor.focus(); 
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
				<form action='matchingwrite_ok.jsp' method="post" name="writeForm">										
					<table id="tblWrite">					
						<tr>
							<td>지역</td>
							<td>
								<select name="loc"id="selectId">
									<option value="" >-선택-</option>
  									<option value="서울">서 울</option>
  									<option value="인천">인 천</option>
								    <option value="경기">경 기</option>
								    <option value="충북">충 북</option> 
								    <option value="충남">충 남</option>
  									<option value="전북">전 북</option>
								    <option value="전남">전 남</option>
								    <option value="경북">경 북</option>
								    <option value="경남">경 남</option>								   
  									<option value="강원">강 원</option>
								    <option value="제주">제 주</option>
							    </select>
							</td>
						</tr>														
						<tr>
							<td>제목</td>
							<td>
								<input type='text' size='53' maxlength='53' name='title' id="inputTitle"/>
							</td>
						</tr>	
														
						<tr>
							<td>경기 날짜</td>
							<td>
								<input type='date' name='date' id="inputDate" />
							</td>
						</tr>
						<tr>
							<td>경기 시간</td>
							<td>
								<select name="start_apm">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</select> 
								<select name="start_oclock">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
								</select>시
								<select name="start_minute">
									<option value="00">00</option>
									<option value="30">30</option>
								</select>분
								 ~
								<select name="close_apm">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</select> 
								<select name="close_oclock">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>									
								</select>시
								<select name="close_minute">
									<option value="00">00</option>
									<option value="30">30</option>
								</select>분
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
					         	<textarea id="CheckEditor" name="Contents"></textarea>
					         </td>
						</tr>								
					</table>	
					<div id="divBtnContain">	
						<input type='button' value ="글 올리기" onclick="Check()" />
						<input type='reset' value="다시 작성하기"/>
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