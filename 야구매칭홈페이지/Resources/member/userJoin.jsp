<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 창</title>
				
		<link rel="stylesheet" type="text/css" href="../css/common_main.css">
		<link rel="stylesheet" type="text/css" href="../css/member_memberjoin.css">		
		<script type="text/javascript" src="../js/join_ok.js"></script>
		<script type="text/javascript" src="../js/zipsearch.js"></script>		
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
				
			</div>
			<!---@@  content  @@-->
			<div id="divContent">	
				<hr>
				<div id="join_title">			
					<img src="../images/join.png" width="100" height="75"/>
				</div>
				<form method="post" action="m_insert.jsp" name="joinForm" id="joinForm">
					<input type="hidden" id="flag" name="flag" value="true" />	
					<table id="member_join">
						<tr>
						<td>					
							<tr class="col">
								<td width="100" align="right">
									<font><b>아이디</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="text" id="join_userid" maxlength="12" name="join_userid" size="25">&nbsp;&nbsp;
									<input type="button" value="중복 체크" onclick="idCheck()"/>						
								</td>
							</tr>		
							
							<tr class="col">
								<td align="right">
									<font><b>비밀번호</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="password" maxlength="20" name="join_passwd" size="25">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>확인</b>
									<input type="password" maxlength="20" name="join_repasswd" size="25">						
								</td>
							</tr>					
								
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>성명</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="text" name="join_name" size="25">
													 						
								</td>
							</tr>
							
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>연고지</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="text" id="join_address"  name="join_address" size="25" readonly="readonly">&nbsp;&nbsp;
									<input type="button" value="주소 검색" onclick="postcheck()" />		
								</td>
							</tr>					
											
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>전화번호</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="search" name="join_tel" size="30">
								</td>
							</tr>
							
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>Email</b></font>
								</td>	
								<td>&nbsp;&nbsp;
									<input type="text" size="10" name="join_email1">@								 									 
									 <select id="join_email2" name="join_email2">							
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="user">직접입력</option>
									</select> 
								</td>
							</tr>	
							
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>성별</b></font>
								 </td>	
								 <td>&nbsp;&nbsp;
								 	<input type="radio" name="join_gender" value="남자" checked="checked">남자&nbsp;	
								 	<input type="radio" name="join_gender" value="여자">여자														
								 </td>
							</tr>		
										
							
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>생년월일</b></font>
								 </td>	
								 <td>&nbsp;&nbsp;
								 	<input type="date" name="join_birthday" size="30">&nbsp;&nbsp;
																		
								 </td>
							</tr>
							
							<tr class="col">
								<td align="right">
									<font color="#000000"><b>주요 포지션</b></font>
								 </td>	
								 <td>&nbsp;&nbsp;
								 	<input type="radio" name="join_position" value="투수" checked="checked">투수&nbsp;	
								 	<input type="radio" name="join_position" value="포수">포수&nbsp;
								 	<input type="radio" name="join_position" value="1루수">1루수&nbsp;
								 	<input type="radio" name="join_position" value="2루수">2루수&nbsp;	
								 	<input type="radio" name="join_position" value="3루수">3루수&nbsp;<br>	
								 	&nbsp;&nbsp;
								 	<input type="radio" name="join_position" value="유격수">유격수&nbsp;	
								 	<input type="radio" name="join_position" value="좌익수">좌익수&nbsp;
								 	<input type="radio" name="join_position" value="중견수">중견수&nbsp;
								 	<input type="radio" name="join_position" value="우익수">우익수&nbsp;													
								 </td>
							</tr>		
							
						    <tr>
							<td >&nbsp;</td>
					       	</tr>
					     	</table>
					     	<hr>
					     	<div>
								<input type="button" value="확인" id="ok" onclick="joinOk()" />
								<input type="button" value="취소" onClick="window.location.reload()" />
							</div>
					</form>
		
     </div>
    </div>          	
	</body>
	
	<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
</html>