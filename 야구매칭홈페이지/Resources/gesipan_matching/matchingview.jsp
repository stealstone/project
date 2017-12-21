
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MemberBean"%>
 
<jsp:directive.page import="java.text.SimpleDateFormat" />     
<jsp:directive.page import="java.util.Date" />    
<jsp:directive.page import="java.util.Vector" />    
<jsp:directive.page import="Baseball.libs.model.GesipanBean" />
<jsp:directive.page import="Baseball.libs.model.MatchBean" />
<jsp:directive.page import="Baseball.libs.model.MatchingBean" />
<jsp:useBean id="ss" class="Baseball.libs.control.SelectService" />  
<jsp:useBean id="ss1" class="Baseball.libs.control.SelectService" />  
<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" />  
<jsp:useBean id="mss1" class="Baseball.libs.control.MatchingSelectService" />  
<jsp:useBean id="mss2" class="Baseball.libs.control.MatchingSelectService" />
<jsp:useBean id="mss3" class="Baseball.libs.control.MatchingSelectService" />
<jsp:useBean id="us" class="Baseball.libs.control.UpdateService" />
<jsp:directive.page import="Baseball.libs.model.CommentBean" />

<%	
	int idx = Integer.parseInt(request.getParameter("idx"));	
	GesipanBean gb = ss.getGesipan(idx);
	MemberBean me = (MemberBean)session.getAttribute("me");	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 글</title>

<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_matchinglist.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_view.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="../js/gudanpage.js" type="text/javascript"></script>
<script type="text/javascript">

function Check(){
	var Write = document.formComment;	
	Write.submit();
}

function CommentDelete(idx,idx2){	
	location.href= "matchingcommentdelete_ok.jsp?gesipanidx=" + idx + "&commentidx="+idx2;
}

function check_only(chk){
    var obj = document.getElementsByName("checkApply");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function btnDelete(){
	var Write = document.formDelete;	
		if (window.confirm("정말 삭제하시겠습니까?")==true) {
			Write.submit();
		}else{
			return;
		}
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
<%		
	String userid = me.getUserid();
%>
	<div id="divContent">
		<!-- 글 정보 테이블 -->	
		<table id="tblViewInfo">			
			<thead>						
				<tr>							
					<!-- 인덱스 번호 -->														
					<th><%=idx %></th>
					<!-- 글 제목 -->							
					<td colspan="7"><%=gb.getSubject() %></td>
				</tr>
				<tr>
					<th>작성자</th>							
					
					<td><%=gb.getId() %></td>
					<th>구단</th>
										
					
					<td><a href="#" onclick="gudanPage1('<%=gb.getGname()%>')">
							<%=gb.getGname() %></a></td>
					<th>작성 날짜</th>
					<td><%=gb.getDate() %></td>
					<th>조회수</th>
					<td><%=gb.getViews() %></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><%=gb.getPlace() %></td>							
					<th>경기 날짜</th>
					<td><%=gb.getSdate() %></td>
					<th >경기 시간</th>
					<td colspan="3"><%=gb.getStart() %> ~ <%=gb.getClose() %></td>
				</tr>
			</thead>					
		</table>
		<!-- 경기 신청 테이블 -->	
		<form action="matchingapply_ok.jsp" method="post">
			<input type="hidden" name="idx" value="<%=idx %>"/>
			<input type="hidden" name="date" value="<%=gb.getSdate() %>"/>					
			<input type="hidden" name="start" value="<%=gb.getStart() %>"/>
			<input type="hidden" name="close" value="<%=gb.getClose() %>"/>
			<input type="hidden" name="place" value="<%=gb.getPlace() %>"/>
			<input type="hidden" name="gudan" value="<%=gb.getGname() %>"/>
			<%
			if(!me.getUserid().equals(gb.getId())&&!userid.equals("admin")) {%>
				<%
				int num = mss2.getIncount(idx);
				if(num==0){%>
					<%int num1 = mss3.getAlreadyApply(idx,me.getGudan());
						if(num1==0){%>	
						<input type="submit" value="매칭 신청"  />
					<%
						}else{ %>
						<input type="submit" value="매칭 신청 완료" disabled />
					<%} %>
				<%}else{%>
					<input type="submit" value="매칭 완료" disabled />
				<%}	%>
			<%}%>				
		</form>
		<!-- 경기 신청 목록 테이블 -->
		<table id="tblMatching" style="margin-left:auto;margin-right:auto">
		<%
			Vector<MatchingBean> vector = mss.getMatchings(idx); 
			if(vector == null){
		%>
		<tr style="colspan:2;"><td>신청이 없습니다.</td></tr>
		<% } else {
			MatchingBean mb1 = mss1.getMatchingTomagno(idx);		
			if(mb1.getMacondition()==null){
				int count = 0;%>				
				<thead>
					<tr>
						<th>신청 구단</th>
						<th></th>
					</tr>
				<%
				for(int i = count ; i < vector.size() ; i++){
					MatchingBean mb = vector.get(i);
               %>				
					<tr>
						<td><%=mb.getMaforteam() %></td>
						<%if(me.getUserid().equals(gb.getId())) {%>
						<td><input type="button" value="수락하기" onclick="location.href='matchingaccept.jsp?idx=<%=mb.getMano()%>&gesipanidx=<%=idx%>'"></td>
						<%} %>
					</tr>
				</thead>
				<%
				count++;
			}//end for
		}else if(mb1.getMacondition().equals("matched")){ %>
		<form action="matchingcondition_ok.jsp" method="post">
			<table id="tblSelectResult">	
				<input type="hidden" name="gesipanidx" value="<%=idx %>"/>			
				<input type="hidden" name="mano"value="<%=mb1.getMano() %>"/>									
				<tr>
					
					<%if(me.getGudan()==null){ %>
						<td>매칭이 끝난 글입니다.</td>
						<%}else{
							/* 시간 계산*/
							Date da = new Date();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHHmm");		
							String matchdate = sdf.format(mb1.getMadate());
							String nowdate = sdf.format(da);
							/*str형 매칭 날짜*/
							String matchdate1 = matchdate.substring(0,4);
							String matchdate2 = matchdate.substring(5,7);
							String matchdate3 = matchdate.substring(8,10);								
							String Strmatchdate = matchdate1+matchdate2+matchdate3;
							/*str형 현재 날짜*/
							String nowdate1 = nowdate.substring(0,4);
							String nowdate2 = nowdate.substring(5,7);
							String nowdate3 = nowdate.substring(8,10);								
							String Strnowdate = nowdate1+nowdate2+nowdate3;
							/*매칭 종료 시간*/
							int i = mb1.getMaclose().indexOf(":");								
							String matchtime1=null;
							String matchtime2=null;
							if(i==4){
							matchtime1 = mb1.getMaclose().substring(2,4);
							matchtime2 = mb1.getMaclose().substring(5,7);
							}else{
								matchtime1 = mb1.getMaclose().substring(2,3);
								matchtime2 = mb1.getMaclose().substring(4,6);
							}
							int Intmatchtime = Integer.parseInt(matchtime1+matchtime2);
							/*현재 시간*/							
							String nowtime1 = nowdate.substring(10,12);
							String nowtime2 = nowdate.substring(12,14);								
							int Intnowtime = Integer.parseInt(nowtime1+nowtime2);
							/*매칭 시간의 apm기준*/
							String matchapm = mb1.getMaclose().substring(0,2);
							int ApmIntmatchTime=0;
							 if(matchapm.equals("AM")){
								ApmIntmatchTime=Intmatchtime;
							}else{
								ApmIntmatchTime=Intmatchtime+1200;	//pm일경우 1200더하기
							}
							 
							/*경기 시간이 지나지 않았는데 게시글에 들어올경우*/
							if(Integer.parseInt(Strmatchdate)>Integer.parseInt(Strnowdate)){%>
								<td>아직 <font style="font-weight:bold"><%=mb1.getMaforteam() %></font>와 경기시간이 지나지 않았습니다.</td>
							<%}else{
								 if(Integer.parseInt(Strmatchdate)==Integer.parseInt(Strnowdate)
										 &&ApmIntmatchTime>Intnowtime){%>
									 <td>아직 <font style="font-weight:bold"><%=mb1.getMaforteam() %></font>와 경기시간이 지나지 않았습니다.</td>

							<%}else{
								if(Integer.parseInt(Strmatchdate)+1<=Integer.parseInt(Strnowdate)
										&&ApmIntmatchTime<Intnowtime){
								%>
									<td>결과 기록 시간이 초과되었습니다.</td>
								<%}else{%>
						<td><%=mb1.getMagname() %></td>
						<td>&nbsp;
						<select name="myresult" id="selectResult" style="width:70px"
						<%
						if(!me.getGudan().equals(mb1.getMagname())){%>
							disabled 
						<% } %>
							>
						<%if(mb1.getMaresult()==null){%>
							<option value="" selected>-선택-</option>
							<option value="승" >승</option>
							<option value="무" >무</option>
							<option value="패">패</option>
						<%}else if(mb1.getMaresult().equals("승")){%>
							<option value="" >-선택-</option>
							<option value="승" selected>승</option>
							<option value="무" >무</option>
							<option value="패">패</option>
						<%}else if(mb1.getMaresult().equals("무")){%>
							<option value="" >-선택-</option>
							<option value="승" >승</option>
							<option value="무" selected>무</option>
							<option value="패">패</option>
						<%}else{%>
							<option value="" >-선택-</option>
							<option value="승" >승</option>
							<option value="무" >무</option>
							<option value="패" selected>패</option>
							<%	}	%>
						</select>&nbsp;&nbsp;
						</td>
						<td><%=mb1.getMaforteam() %></td>
						<td><font id="fontResult">&nbsp;&nbsp;
						<%
							if(mb1.getMaresult()==null){%>선택중<%
							}else if(mb1.getMaresult().equals("승")){%>패<%
							}else if(mb1.getMaresult().equals("무")){%>무<%
							}else if(mb1.getMaresult().equals("패")){%>승<%
							}
						%></font></td>
						<%if(me.getGudan().equals(mb1.getMagname())){
								if(mb1.getMaresult()==null){	%>
								<td><input type="submit" value="확인" /></td>
							<%}else{ %>
							<%} %>
						<%} %>
						<%if(me.getGudan().equals(mb1.getMaforteam())){ %>
							<%
								if(mb1.getMaresult()==null){%>
								<td>&nbsp;&nbsp;&nbsp;아직 상대팀이 결과를 등록하지 않았습니다.</td>											
								<%}else{%>
									<td>&nbsp;&nbsp;&nbsp;<input type="button" value="승인" onclick="location.href='matchingapprove_ok.jsp?mano=<%=mb1.getMano()%>&idx=<%=idx%>'"/></td>
									<td>&nbsp;&nbsp;<input type="button" value="거절" onclick="location.href='matchingapprove_not_ok.jsp?mano=<%=mb1.getMano()%>&idx=<%=idx%>'" /></td>
								<%
									}
							}else{	
								}
							}
							}
							%>
						</tr>
					</table>
				</form>
				<%	}
					}
				}
			}
			%>
			</table>
			<!-- 내용 출력 테이블 -->
			<table id="tblText">					
				<tr>
					<td id="tdPosts">
						<%=gb.getPosts() %>
					</td>
				</tr>
			</table>
			
			
		<hr>
		
		<!------ 댓글 ------> 			
		
		<%	
			Vector<CommentBean> vector1 = ss1.matchingdp_select(idx); 
		%>
		<div id="divComment">
			<form method="get">
				<table>						
					<%
						if(vector1 == null){
					%>
					<tr colspan="3">작성된 댓글이 없습니다.</tr>
					<% } else {
						int count = 0;
						int CommentIdxCount = 0;
						for(int i = count ; i < vector1.size() ; i++){
							CommentBean cb = vector1.get(i);
							CommentIdxCount=count+1;
                       %>
					<tr>							
						<!-- 댓글 이름ID -->
						<td ><%=cb.getId() %></td>
						<!-- 댓글 내용 -->
						<td indx="<%=CommentIdxCount %>" id="tdReply01" class="tdR01" name="tdReply01" style=""><%=cb.getReply() %> </td>	
						<!-- 댓글 날짜 -->
						<td><%=cb.getDate() %></td>
						<%if(cb.getId().equals(userid)) {%>
						<!-- 삭제 버튼 -->			
						<td><input type="button" value="삭제" onclick="CommentDelete(<%=idx%>,<%=cb.getIdx()%>) "/><td>
						<%} %>
					</tr>
					<%
							count++;
							}	//end for
						}	//end if
					%>
				</table>
			</form>
			<form name="formComment" action="matchingcomment_ok.jsp" method="post" onsubmit="return false;">
				<fieldset>
			        <div>
			        	<input type="hidden" name="idx" value="<%=idx %>"/>
	                    <textarea class="" id="textareaReplyInsert" name="textComment" size="400"></textarea>
	                    
	                    <input type="button" id="btnCommentInsert" class="" onclick="Check()" value="덧글쓰기">
	                    
			        </div>
		        </fieldset>
		    </form>
		</div>
		
		<!-- 버튼 테이블 -->
		<form action="matchingdelete_ok.jsp" method="post" name="formDelete">	
		<table id="tblBtn">
			<tr>
				<td>
				<div style="float:right;padding-right:20px;">
					<input type="hidden" name="idx" value="<%=idx %>" />
					<% if(userid.equals(gb.getId())){ %>
					<input type="button" value="수정하기" onclick="location.href='matchingchange.jsp?idx=<%=idx%>'">&nbsp;
					<input type="button" value="삭제하기" onclick="btnDelete()">&nbsp;
					<%
						}else{}
					%>
					<input type="button" value="목록으로" onclick="location.href='../gesipan_matching/matchinglist.jsp'">
				</div>
				</td>
			</tr>
		</table>
		</form>				
	</div>				
	<!-- divContent 끝 -->
		
</div>
<!-- divContainer 끝 -->
<!-- ============= footer   ============== -->
		  	
<footer id="footer">			
		<jsp:include page="../common/footer.jsp" />
</footer>
	
</body>
</html>

<%
	int row = us.updateReadcount(idx);
%>
