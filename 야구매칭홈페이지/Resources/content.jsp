<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/imgslide.css">
<script type="text/javascript" src="../js/maintab.js" ></script> 
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.slides.min.js"></script> 

<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="Baseball.libs.model.MainTabBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="mtsc1" class="Baseball.libs.control.MainTabSelectController" />
<jsp:useBean id="mtsc2" class="Baseball.libs.control.MainTabSelectController" />
<jsp:useBean id="mtsc3" class="Baseball.libs.control.MainTabSelectController" />
<jsp:useBean id="mtsc4" class="Baseball.libs.control.MainTabSelectController" />

<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	Vector<MainTabBean> note_vector = mtsc1.select_notetab();
	Vector<MainTabBean> mat_vector = mtsc2.select_machtab();
	Vector<MainTabBean> pro_vector = mtsc3.select_protab();
	Vector<MainTabBean> free_vector = mtsc4.select_freetab();
	
%>
	
<script>
    $(function() {
      $('#slides').slidesjs({
        width: 940,
        height: 528,        
        play: {
          active: true,
          auto: true,
          interval: 4000,
          swap: true
        }
       
      });
    });
</script>

<!-- 이미지 -->

	<div id="slides">
	      <img src="../images/5.jpg"  >
	      <img src="../images/2.jpg"  >
	      <img src="../images/4.jpg"  >
	      <img src="../images/9.jpg"  >
	</div>


<!-- 공지사항, 이벤트 탭 -->

<div class="section">
	<div class="tab tab_type1">
		<a href="javascript:whenTab('01')" id="tab_a01" class="_tab_title _no_title t1 on" data-tabgrounp="no" data-tabname="notice"><span>공지사항</span></a>
		<a href="javascript:whenTab('02')" id="tab_a02"class="_tab_title _no_title t2 " data-tabgrounp="no" data-tabname="event"><span>이벤트</span></a>
	</div>
	
		<ul id="tab01" class="_no_content _notice list" style="height: 125px;">
			<% if(note_vector == null){ %>
					<li>공지 사항이 없습니다.</li>
			<% }else{
					for(int i=0; i<note_vector.size(); i++){
						MainTabBean mtb = note_vector.get(i);
						if(me == null){
			%>
							<li>								 
								<%=mtb.getTitle()%>
								<span class="date"><%=mtb.getDate() %></span>
							</li>
			<% 			
						}else{
			%>
							<li>									
								<a href="../gesipan_notice/noticeview.jsp?idx=<%=mtb.getIndex() %>" class="_board_link"><%=mtb.getTitle()%></a> 
								<span class="date"><%=mtb.getDate() %></span>
							</li>
			<%				
						}
					}
			   }
			%>
		</ul>	       

		<ul id="tab02" class="_no_content _event list" style="display: none; height: 125px;">
			<li>진행중인 이벤트가 없습니다.</li>
		</ul>		              
</div>
	
<!-- 매칭, 홍보,자유, qna 탭 -->
	
<div class="section">
 		<!-- [D] 선택tab on 추가 -->
<div class="tab tab_type2">
    <a href="javascript:whenTab('03')" id="tab_a03" class="_tab_title _co_title t1 on" data-tabgrounp="co" data-tabname="game"><span>매칭게시판</span></a>
    <a href="javascript:whenTab('04')" id="tab_a04"  class="_tab_title _co_title t2" data-tabgrounp="co" data-tabname="free"><span>자유게시판</span></a>
    <a href="javascript:whenTab('05')" id="tab_a05"  class="_tab_title _co_title t3" data-tabgrounp="co" data-tabname="pro"><span>홍보게시판</span></a>   
</div>

<ul id="tab03"class="_co_content _game list" style="height: 125px;">
	<% if(mat_vector == null){ %>
		<li><em>매칭게시판 게시물이 없습니다.</em></li>
	<% }else{
			for(int i=0; i<mat_vector.size(); i++){
				MainTabBean mtb = mat_vector.get(i);
				if( (me == null) || (me.getGrade().equals("1"))){
	%>
					<li>					
						<%=mtb.getTitle()%>
						<span class="date"><%=mtb.getDate() %></span>
					</li>
	<% 			
				}else{
	%>
					<li>					
						<a href="../gesipan_promotion/" class="_board_link"><%=mtb.getTitle()%></a>
						<span class="date"><%=mtb.getDate() %></span>
					</li>
	<%				
				}
			}
		}
	%>
</ul>

<ul id="tab04" class="_co_content _free list" style="display: none; height: 125px;">
     <% if(free_vector == null){ %>
		<li><em>자유게시판 게시물이 없습니다.</em></li>
	<% }else{
			for(int i=0; i<free_vector.size(); i++){
				MainTabBean mtb = free_vector.get(i);
				if(me == null){
	%>
				<li>					
					<%=mtb.getTitle()%>
					<span class="date"><%=mtb.getDate() %></span>
				</li>
	<% 			
				}else{
	%>
				<li>					
					<a href="../gesipan_free/freeview.jsp?idx=<%=mtb.getIndex() %>" class="_board_link"><%=mtb.getTitle()%></a>
					<span class="date"><%=mtb.getDate() %></span>
				</li>
	<%				
				}
			}
		}
	%>
</ul>

<ul id="tab05" class="_co_content _pro list" style="display: none; height: 125px;">
   <% if(pro_vector == null){ %>
		<li><em>홍보게시판 게시물이 없습니다.</em></li>
	<% }else{
			for(int i=0; i<pro_vector.size(); i++){
				MainTabBean mtb = pro_vector.get(i);
				if(me == null){
	%>
					<li>					
						<%=mtb.getTitle()%>
						<span class="date"><%=mtb.getDate() %></span>
					</li>
	<% 			
				}else{
	%>
					<li>					
						<a href="#" class="_board_link"><%=mtb.getTitle()%></a>
						<span class="date"><%=mtb.getDate() %></span>
					</li>
	<%				
				}
			}
		}
	%>
</ul>

</div>	