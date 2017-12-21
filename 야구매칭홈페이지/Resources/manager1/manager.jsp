<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.AdminMatchingBean" />    
<jsp:directive.page import="Baseball.libs.model.MemoBean" />
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />
<jsp:useBean id="sgc" class="Baseball.libs.control.SelectGudanController" />
<jsp:useBean id="mc" class="Baseball.libs.control.MatchController" />
  
<%
	//MemberBean me = (MemberBean)session.getAttribute("me");
	String index = request.getParameter("index");
	
	Vector<MemberBean> member_vector = sc.getAllmember("admin");	
	Vector<GudanBean> gudan_vector = sgc.getAllgudan();
	Vector<AdminMatchingBean> match_vector = mc.getAllmatch();	
%> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매니저 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/managerpage.css">
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<script>
	//탭.
	function init_tabs() {
		$(".tab_content").css("display","none");
		if (!$('ul.tabs').length) { return; }
		$('div.tab_content_wrap').each(function() {
			$(this).find('div.tab_content:first').show();
		});
		$('ul.tabs a').click(function() {
			if (!$(this).hasClass('current')) {
				$(this).addClass('current').parent('li').siblings('li').find('a.current').removeClass('current');
				$($(this).attr('href')).show().siblings('div.tab_content').hide();
			}
			this.blur();
			return false;
		});		
	}
	
	$(document).ready(function() {
		init_tabs();      
		
		//체크박스
		var tblhead1 = $("#finish_head");
		var tblhead2 = $("#gudaninfo");
		var tblhead3 = $("#meminfo");	
		
		var tbl1 = $("#finish");	
		var tbl2 = $("#gudan");	
		var tbl3 = $("#mem");	
		
        
        // 테이블 헤더에 있는 checkbox 클릭시
        $(":checkbox", tblhead1).click(function(){
            // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
            if( $(this).is(":checked") ){
                $(":checkbox", tbl1).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl1).removeAttr("checked");
            }

            // 모든 체크박스에 change 이벤트 발생시키기                
            $(":checkbox", tbl1).trigger("change");
    	});
        
        $(":checkbox", tblhead2).click(function(){
            // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
            if( $(this).is(":checked") ){
                $(":checkbox", tbl2).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl2).removeAttr("checked");
            }

            // 모든 체크박스에 change 이벤트 발생시키기                
            $(":checkbox", tbl2).trigger("change");
    	});
        
        $(":checkbox", tblhead3).click(function(){
            // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
            if( $(this).is(":checked") ){
                $(":checkbox", tbl3).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl3).removeAttr("checked");
            }

            // 모든 체크박스에 change 이벤트 발생시키기                
            $(":checkbox", tbl3).trigger("change");
    	});
        
	});
	
	function delete_mem(){
		var ch = document.getElementsByName("memcheck");		
		var userid = "userid=";
		var count = 0;
		for(var i=0; i<ch.length; i++){
			if(ch[i].checked == true){
				userid += ch[i].id+",";
				count++;
			}
		}
		if(count != 0){
			userid = userid.substring(0, userid.length-1);
			var rst = confirm("정말 삭제 하시겠습니까?");
			if(rst){
				location.href = "memberdelete.jsp?"+userid;
			}
		}else{
			alert("아이디를 선택해 주세요.");
		}	
	}
	
	function set_point(){
		var ch = document.getElementsByName("gudancheck");
		var gudanName = "gudanName=";
		var count = 0;
		for(var i=0; i<ch.length; i++){
			if(ch[i].checked == true){
				gudanName += ch[i].id+",";
				count++;
			}
		}
		if(count != 0){
			gudanName = gudanName.substring(0, gudanName.length-1);
			var rst = confirm("정말 패널티를 주시겠습니까?");
			if(rst){			
				location.href = "gudanpoint.jsp?"+ gudanName; 
			}
		}else{
			alert("구단을 선택해 주세요.");
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
			<div id="divContent">			
				<div id="container">
					<h2>관리자 페이지</h2>
					<!-- 탭시작 -->
					<div class="tab-wrap">
						<ul class="tabs">
							<li>
								<a href="#tab_content_primary_01">매칭 현황</a>
							</li>
							<li>
								<a href="#tab_content_primary_02">구단 관리</a>
							</li>
							<li>
								<a href="#tab_content_primary_03">회원 관리</a>
							</li>							
						</ul>
						<div class="tab_content_wrap">
						
							<div id="tab_content_primary_01" class="tab_content">
								<form action="">
									<h3>경기 완료 목록</h3>		
									<table id="finish_head">
											<tr>
												<th class="list1"><input type="checkbox"/></th>
												<th class="list2">신청 구단</th>
												<th class="list3">상대 구단</th>
												<th class="list4">종료 시간</th>
												<th class="list5">상 태</th>											
											</tr>																		
									</table>	
									<div class="scroll">
										<table id="finish">
											<%
													if(match_vector == null){
												%>
														<tr>
															<td colspan="4">내용이 없습니다.</td>
														</tr>
												<%
													}else{
														for(int i=0; i<match_vector.size(); i++){
															AdminMatchingBean amb = match_vector.get(i);
												%>		
															<tr>
																<td class="list1"><input type="checkbox" name="gudancheck" id="<%=amb.getIdx()%>"/></td>
																<td class="list2"><%=amb.getHomegudan() %></td>
																<td class="list3"><%=amb.getAwaygudan() %></td>
																<td class="list4"><%=amb.getCloseTime() %></td>
																<td class="list5"><%=amb.getCon() %></td>
															</tr>
												<%
														}
													}
												%>																		
										</table>										
									</div>									
									
									<div class="formbtn">
										<input type="button" value="패널티 부여" >									
									</div>		
								</form>				
							</div>
							
							<div id="tab_content_primary_02" class="tab_content">
								<form action="">
									<h3>구단 목록</h3>	
									<table id="gudaninfo">
											<tr>
												<th class="list1"><input type="checkbox"/></th>
												<th class="list2">구단명</th>
												<th class="list3">구단주</th>
												<th class="list4">구단등급</th>
												<th class="list5">점수</th>											
											</tr>									
									</table>
																		
									<div class="scroll">
										<table id="gudan">
											<%
													if(gudan_vector == null){
												%>
														<tr>
															<td colspan="4">내용이 없습니다.</td>
														</tr>
												<%
													}else{
														for(int i=0; i<gudan_vector.size(); i++){
															GudanBean gb = gudan_vector.get(i);
												%>		
															<tr>
																<td class="list1"><input type="checkbox" name="gudancheck" id="<%=gb.getGudan()%>"/></td>
																<td class="list2"><%=gb.getGudan() %></td>
																<td class="list3"><%=gb.getGid() %></td>
																<td class="list4"><%=gb.getRating() %></td>
																<td class="list5"><%=gb.getTot() %></td>
															</tr>
												<%
														}
													}
												%>																																									
										</table>										
									</div>									
									
									<div class="formbtn">										
										<input type="button" value="패널티 부여" onclick="set_point()">										
									</div>
								</form>							
							</div>
							
							<div id="tab_content_primary_03" class="tab_content">
								<form>
									<h3>회원 목록</h3>	
									<table id="meminfo">
											<tr>
												<th class="list1"><input type="checkbox"/></th>
												<th class="list2">아이디</th>
												<th class="list3">이름</th>
												<th class="list4">구단명</th>
												<th class="list5">등급</th>											
											</tr>										
									</table>
									
									<div class="scroll">
										<table id="mem">										
												<%
													if(member_vector == null){
												%>
														<tr>
															<td colspan="4">내용이 없습니다.</td>
														</tr>
												<%
													}else{
														for(int i=0; i<member_vector.size(); i++){
															MemberBean mb = member_vector.get(i);
												%>		
															<tr>
																<td class="list1"><input type="checkbox" name="memcheck" id="<%=mb.getUserid() %>" /></td>
																<td class="list2"><%=mb.getUserid() %></td>
																<td class="list3"><%=mb.getName() %></td>
																<td class="list4"><%=mb.getGudan() %></td>
																<td class="list5"><%=mb.getGrade() %></td>
															</tr>
												<%
														}
													}
												%>																																									
										</table>										
									</div>	
												
									<div class="formbtn">
										<input type="button" value="추방" onclick="delete_mem()">										
									</div>
								</form>											
							</div>	
													
						</div><!-- //tab_content_wrap -->
					</div><!-- //tab-wrap -->
					<!-- // 탭끝 -->
				   
				</div>
				<!-- #container -->
			</div>
		</div> 
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>    