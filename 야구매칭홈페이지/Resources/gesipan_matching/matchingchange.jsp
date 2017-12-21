<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="ss" class="Baseball.libs.control.SelectService" /> 

<%	
	int idx = Integer.parseInt(request.getParameter("idx"));	
	GesipanBean gb = ss.getGesipan(idx);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 수정</title>

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
		/* if (!Write.selectId.value) {
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
		}    	 */
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
				<h2>글 수정</h2>
				<hr>
				<form action='matchingchange_ok.jsp' method="post" name="writeForm">
					<input type="hidden" name="idx" value="<%=idx %>" />										
					<table id="tblWrite">					
						<tr>
							<td>지역</td>
							<td>
								<select name="loc" id="selectLoc" disabled>
									<option value="" >-선택-</option>
  									<option value="서울"<% if(gb.getPlace().equals("서울")){ %> selected <% }%>>서 울</option>
  									<option value="인천"<% if(gb.getPlace().equals("인천")){ %> selected <% }%>>인 천</option>
								    <option value="경기"<% if(gb.getPlace().equals("경기")){ %> selected <% }%>>경 기</option>
								    <option value="충북"<% if(gb.getPlace().equals("충북")){ %> selected <% }%>>충 북</option> 
								    <option value="충남"<% if(gb.getPlace().equals("충남")){ %> selected <% }%>>충 남</option>
  									<option value="전북"<% if(gb.getPlace().equals("전북")){ %> selected <% }%>>전 북</option>
								    <option value="전남"<% if(gb.getPlace().equals("전남")){ %> selected <% }%>>전 남</option>
								    <option value="경북"<% if(gb.getPlace().equals("경북")){ %> selected <% }%>>경 북</option>
								    <option value="경남"<% if(gb.getPlace().equals("경남")){ %> selected <% }%>>경 남</option>
								    <option value="강원"><% if(gb.getPlace().equals("제주")){ %> selected <% }%>강 원</option>
								    <option value="제주">제 주</option>
							    </select>
							</td>
						</tr>														
						<tr>
							<td>제목</td>
							<td>
								<input type='text' size='53' maxlength='53' name='title' value="<%=gb.getSubject() %>"/>
							</td>
						</tr>	
														
						<tr>
							<td>경기 날짜</td>
							<td>
								<input type='date' name='date' disabled value='<%=gb.getSdate()%>'/>
							</td>
						</tr>
						<tr>
							<td>경기 시간</td>
							<td>
								<%
									/* Start시간 String나누기 */
									String tempStart = gb.getStart();
									String tempApm = tempStart.substring(0,2);						
									
									int i = tempStart.indexOf(":");
									String tempOclock,tempMinute;
									if(i==3){
										tempOclock = tempStart.substring(2,3);
										tempMinute = tempStart.substring(4,6);
									}else{
										tempOclock = tempStart.substring(2,4);
										tempMinute = tempStart.substring(5,7);
									}
									
								%>
								<select name="start_apm" disabled>
									<option value="AM"
									<% if(tempApm.equals("AM")){ %> selected <% }%>									
										>AM</option>
									<option value="PM"
									<% if(tempApm.equals("PM")){ %> selected <% }%>
										>PM</option>
								</select> 
								
								<select name="start_oclock" disabled>
									<option value="0"<%if(tempOclock.equals("0")){%>selected<%}%>>0</option>
									<option value="1"<%if(tempOclock.equals("1")){%>selected<%}%>>1</option>
									<option value="2"<%if(tempOclock.equals("2")){%>selected<%}%>>2</option>
									<option value="3"<%if(tempOclock.equals("3")){%>selected<%}%>>3</option>
									<option value="4"<%if(tempOclock.equals("4")){%>selected<%}%>>4</option>
									<option value="5"<%if(tempOclock.equals("5")){%>selected<%}%>>5</option>
									<option value="6"<%if(tempOclock.equals("6")){%>selected<%}%>>6</option>
									<option value="7"<%if(tempOclock.equals("7")){%>selected<%}%>>7</option>
									<option value="8"<%if(tempOclock.equals("8")){%>selected<%}%>>8</option>
									<option value="9"<%if(tempOclock.equals("9")){%>selected<%}%>>9</option>
									<option value="10"<%if(tempOclock.equals("10")){%>selected<%}%>>10</option>
									<option value="11"<%if(tempOclock.equals("11")){%>selected<%}%>>11</option>
									
								</select>시
								<select name="start_minute" disabled>
									<option value="00"<%if(tempMinute.equals("00")){%>selected<%}%>>00</option>
									<option value="30"<%if(tempMinute.equals("30")){%>selected<%}%>>30</option>
								</select>분
								 ~
								 <%
								 	/* Close 시간 String 나누기 */
									String tempClose = gb.getClose();
									String tempApm2 = tempClose.substring(0,2);						
									
									int j = tempClose.indexOf(":");
									
									String tempOclock2,tempMinute2;
									if(j==3){
										tempOclock2 = tempClose.substring(2,3);
										tempMinute2 = tempClose.substring(4,6);
									}else{
										tempOclock2 = tempClose.substring(2,4);
										tempMinute2 = tempClose.substring(5,7);
									}
								
								%>		
								<select name="close_apm" disabled>
									<option value="AM"<% if(tempApm2.equals("AM")){ %> selected <% }%>>AM</option>
									<option value="PM"<% if(tempApm2.equals("PM")){ %> selected <% }%>>PM</option>
								</select> 
								<select name="close_oclock" disabled>
									<option value="0"<%if(tempOclock2.equals("0")){%>selected<%}%>>0</option>
									<option value="1"<%if(tempOclock2.equals("1")){%>selected<%}%>>1</option>
									<option value="2"<%if(tempOclock2.equals("2")){%>selected<%}%>>2</option>
									<option value="3"<%if(tempOclock2.equals("3")){%>selected<%}%>>3</option>
									<option value="4"<%if(tempOclock2.equals("4")){%>selected<%}%>>4</option>
									<option value="5"<%if(tempOclock2.equals("5")){%>selected<%}%>>5</option>
									<option value="6"<%if(tempOclock2.equals("6")){%>selected<%}%>>6</option>
									<option value="7"<%if(tempOclock2.equals("7")){%>selected<%}%>>7</option>
									<option value="8"<%if(tempOclock2.equals("8")){%>selected<%}%>>8</option>
									<option value="9"<%if(tempOclock2.equals("9")){%>selected<%}%>>9</option>
									<option value="10"<%if(tempOclock2.equals("10")){%>selected<%}%>>10</option>
									<option value="11"<%if(tempOclock2.equals("11")){%>selected<%}%>>11</option>
								</select>시
								<select name="close_minute" disabled>
									<option value="00"<%if(tempMinute2.equals("00")){%>selected<%}%>>00</option>
									<option value="30"<%if(tempMinute2.equals("30")){%>selected<%}%>>30</option>
								</select>분
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<%String content = gb.getPosts();
							   	content = content.replace("&lt;","<");
								content = content.replace( "&gt;", ">");
								content = content.replace("\'", "'");
								content = content.replace("<br />","\r\n");
								%>
							   	<textarea id="CheckEditor" name="Contents" ><%=content %></textarea>
					         </td>
						</tr>
					</table>
					<div id="divBtnContain">	
						<input type='button' value ="수정 완료" onclick="Check()" />
						<input type='reset' value="수정 취소"  onclick="javascript:history.back()"/>
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