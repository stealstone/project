<%@page import="Baseball.libs.model.MatchBean"%>
<%@page import="Baseball.libs.model.MemberBean"%>
<%@page import="Baseball.libs.model.GudanBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MatchBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectGudanController" />
<jsp:useBean id="sc1" class="Baseball.libs.control.SelectGudanMemberController" />
<jsp:useBean id="sc2" class="Baseball.libs.control.SelectGudanMemberController" />
<jsp:useBean id="sc3" class="Baseball.libs.control.MatchSelectService" />
<jsp:useBean id="uc" class="Baseball.libs.control.UpdateGudanController" />
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:directive.page import="java.util.Vector" />
<%
 	String gname1 = request.getParameter("gname");
	String gname = CharConversion.entoutf8(gname1);
	if(gname == null) gname = "";
	
	GudanBean gudan = sc.getGudan(gname);		
	session.setAttribute("gudan", gudan);	
%> 
<!DOCTYPE html>
<html lang="ko">
 <head>
  <title><%=gudan.getGudan() %></title>
  <meta charset="utf-8" />
  <script type="text/javascript" src="./js/gudantab.js" charset="UTF-8"></script>
  <link rel="stylesheet" href="css/lavish-bootstrap.css">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.2.js"></script>
 <link rel="stylesheet" type="text/css" href="./css/gudan_gudanview.css">
 <link rel="stylesheet" type="text/css" href="./css/gudan_gudanheader.css">
 <link rel="stylesheet" type="text/css" href="./css/gudan_gudansidebar.css">
 <script type="text/javascript" src="./js/jquery-1.11.2.js"></script>	
 <script type="text/javascript">
	 function surak(id,guno){
 		$.get('../../gudan/apply.jsp?id=' + id + '&guno=' + guno, function(data){
 			$('#gudantab03').html(data);
 		});
 	}
 	function gujul(id,guno){
 		$.get('../../gudan/refuse.jsp?id=' + id + '&guno=' + guno, function(data){
 			$('#gudantab03').html(data);
 		});
 	}
 	function g(){
		var intr = document.getElementById("intro").value;
 		$.get('../../gudan/intro.jsp?intro=' + intr, function(data){
 			alert(data);
 			$('#intro_out').html(data);
 		});
 	}
	
</script>   
    	
 </head>
 
 <body>
  <header>  
 	<jsp:include page="./gudanheader.jsp" />
  </header>

  <aside>
  	<jsp:include page="./gudansidebar.jsp" />
  </aside>

<section>
  <div id="center">
 
  <ul id="gudantab">
		<a href="javascript:whenGudantab('01')" id="gudantab_a01" class="on">구단정보</a>
		<a href="javascript:whenGudantab('02')" id="gudantab_a02" class="">구단기록 </a>
		<a href="javascript:whenGudantab('03')" id="gudantab_a03" class="">선수정보</a>
		<a href="javascript:whenGudantab('04')" id="gudantab_a04" class="">라인업</a>
  </ul>
  	<div id=gudantab01>
  		<div id="image">
			<table>
				<tr>
					<!-- <img src="" width="152px" height="147px" />
					<img src=""  width="152px" height="147px" />
					<img src="" width="152px" height="147px" />
					<img src=""  width="153px" height="147px" />  -->
				</tr>
			</table>
		</div>
		<div id="divHongbo" style="margin-top:40px;">
			<fieldset>
		  		<legend>
		  			<h3 style="color:black;font-family: 'Hanna'; text-shadow:1px 1px 3px white;">홍보글</h3>
		  		</legend>
		  			<div id='intro_out' style="color:#3B36D1"><%=gudan.getIntro() %></div>
		  			<form>
					<textarea  id='intro' class="form-control"></textarea>
					<button type="button" class="btn btn-sm btn-primary" id="go" onclick="javascript:g()" style="float:right">수정 </button>
					</form>
		  	</fieldset>
		</div>
		<div id="divVisited" style="margin-top:20px;">
			<fieldset>
		  		<legend>
		  			<h3 style="color:black;font-family: 'Hanna';text-shadow:1px 1px 3px white;">방명록</h3>
		  		</legend>
		  		<!-- <p></p>
				<p></p> -->
		  		<input type="text" id="text" class="form-control"/>
			  		<form>
					  		<button type="button" class="btn btn-sm btn-primary" id="go" onclick="" style="float:right;">취소 </button> 	
					  		<button type="button" class="btn btn-sm btn-primary" id="go" onclick="" style="float:right; margin-right: 5px">등록 </button>
			  		</form>
		  		</fieldset>
		</div>
	</div>
	<div id="gudantab02" style="display:none;">
		<div id="gudan_result">
			<h2 style="color:black;font-family: 'Hanna';text-shadow:1px 1px 3px white; text-align: center">구단기록</h2>
			  <table class="table table-striped">
					<tr>		
						<th>날짜</th>
						<th>상대구단</th>
						<th>승</th>
						<th>무</th>
						<th>패</th>
						<th>승점</th>		
					</tr>
			  </table>
			  
			  <table class="table table-hover">
			  	<%
			  		Vector<MatchBean> vector2 = sc3.selectResult(gudan.getGudan());
			  		if(vector2 != null){
			  		for(int i = 0; i < vector2.size(); i++){
			  		 MatchBean matb = vector2.get(i);%>
			  			<tr>		
						<td><%=matb.getMatdate() %></td>
						<td><%=matb.getMaforteams() %></td>
						<%
						if(matb.getMaresult().equals("승")){%>
						<td>승</td>
						<td></td>
						<td></td>
						<td>+3</td>
						<%}if(matb.getMaresult().equals("무")){%>
						<td></td>
						<td>무</td>
						<td></td>
						<td>+1</td>
						<%}if(matb.getMaresult().equals("패")){%>
						<td></td>
						<td></td>
						<td>패</td>
						<td>-2</td>	
					</tr>
			  		<%}}} else{	}%>
					
			  </table>
		 </div>		
	</div>
		<div id="gudantab03" style="display:none;">

					<div id="Join_member">
			  			<table class="table table-striped" style="margin-bottom: 0px">
								<caption><img src="./images/gu_meminfo.png" width="65" height="22"/></caption>
									<tr>
										<th>이름</th>
										<th>생년월일</th>
										<th>연고지</th>
										<th>포지션</th>
										<th>추방여부</th>		
									</tr>
				</table>
						</div>

							<div class="Join_member3">
							<table class="table table-hover" style="margin-bottom: 0px">
							<%
							Vector<MemberBean> vector = sc1.getId(gudan.getGuno(), "y");
							if(vector != null){
							for(int i=0; i < vector.size(); i++){
								MemberBean mb = vector.get(i);%>
								<tr>
									<td><%=mb.getName() %></td>
									<td><%=mb.getBirthday() %> </td>
									<td><%=mb.getAddress() %> </td>
									<td><%=mb.getPosition() %></td>
									<td><img class="join" src="./images/out.png" onclick="gujul('<%=mb.getUserid()%>',<%=gudan.getGuno()%>)" />
								</tr>
							</div>
							<%}} else{%>
							<tr>
							<td colspan="4"> 구단에 가입한 사람이 없습니다. </td>
							</tr> 
							<%} %>
							</table>  	
						
							</div>
					
					<div id="Join_member1">
			  			<table class="table table-striped" style="margin-bottom: 0px">
							<thead id="join_status">
								<caption><img src="./images/team_join_status.PNG" width="80" height="30"/></caption>
									<tr>
										<th>이름</th>
										<th>생년월일</th>
										<th>연고지</th>
										<th>포지션</th>
										<th>입단결정</th>		
									</tr>
							</thead>
						</table>  	
						
					</div>
							
							<div class="Join_member2">
							<table class="table table-hover" style="margin-bottom: 0px">
							<%
							Vector<MemberBean> vector1 = sc2.getId(gudan.getGuno(), "w");
							System.out.println(vector1);
							if(vector1 != null){
								for(int i=0; i < vector1.size(); i++){
								MemberBean mb1 = vector1.get(i);
								String id = mb1.getUserid();
							%>
								<tr>
									<td><%=mb1.getName() %></td>
									<td><%=mb1.getBirthday() %> </td>
									<td><%=mb1.getAddress() %> </td>
									<td><%=mb1.getPosition() %></td>
									<td><img class="join" src="./images/surak.png" onclick="javascript:surak('<%=id%>',<%=gudan.getGuno()%>)" />&nbsp;&nbsp;&nbsp;
									<img class="join" src="./images/gujul.png" onclick="gujul('<%=id%>',<%=gudan.getGuno()%>)"/></td>
								</tr>
							
							<%}
							} else{%>
							<tr>
							<td colspan='5'> 가입한 신청한 사람이 없습니다. </td> 
							</tr>
							<%} %>	
							</table>				
			 				</div>
					
				</div>		
		
		<div id="gudantab04" style="display:none;">		
	
			<input type="image" class="float_left" src="../images/lineup.png" />
			<form>
			<table class="float_left">
				<tbody>
					<tr >
						<td>포수</td>
						<td>
							<select>
								<option value="">김희진</option>
								<option value="">이수덕</option>
								<option value="">김준수</option>
								<option value="">이정현</option>
								<option value="">유현석</option>
							</select>
						</td>			
					</tr>
					<tr>
						<td>1루수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>2루수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>3루수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>유격수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>좌익수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>중견수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>우익수</td>
						<td>
							<select>								
							</select>
						</td>			
					</tr>
					<tr>
						<td>투수</td>
						<td>
							<select>								
							</select>
						</td>
					</tr>
				</tbody>				
			</table>
			<input type="button" id="btnLineupConfirm" value="라인업 수정 완료" />
			</form>
		</div>		
		
	 </div>
  </section>
 </body>
</html>
