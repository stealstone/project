<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="mss" class="Baseball.libs.control.MemoSelectService" />
<link rel="stylesheet" type="text/css" href="../css/common_sidebar_login.css">
<link rel="stylesheet" type="text/css" href="../css/common_sidebar.css">
<script type="text/javascript" src="../js/login.js"></script>
<script type="text/javascript" src="../js/logout.js"></script>
<script type="text/javascript" src="../js/gudanpage.js"></script>
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="../js/gudancheck.js"></script>
<%
	MemberBean me = (MemberBean)session.getAttribute("me");
%>

<!--  @@   login  @@ -->
<% if(me == null){ %>
<form class="form-container" method="post" action="../member/login.jsp">	
	<div class="form-title">아이디</div>
	<input class="form-field" type="text" name="userid" /><br />
	<div class="form-title">패스워드</div>
	<input class="form-field" type="password" name="pass" /><br />
	<div class="submit-container">
		<input type="button" class="submit-button" value="로그인"	onClick="login()" /> 
		<input type="button" class="submit-button" value="회원가입" onClick="location.href='../member/userJoin.jsp'" />
	</div>
</form>
<%}else{ %>
<!-- 로그인될 시 나타날 사이드 바의 데모 화면 (삭제예정)-->
  <div class="form-container" style="margin-top:20px">	
	<div class="submit-container">	
		<div>					
			<font style="float:left;margin-left:10px;"><%= me.getUserid() %>님 안녕하세요!</font>							
			<div style="margin-top:5px;margin-bottom:5px">
				<a href="../memo/memolist.jsp">
				<img src="../images/mail.png" id="imagemail" width="20px">
				<font style="font-size:1.2em;margin-bottom:5px;"><%=mss.count(me.getUserid()) %></font>	</a>
			</div>
		</div>
			<% if((me.getGudan() == null) &&(!me.getGrade().equals("4"))){ %>
				<input type="button" class="submit-button"  value="구단창설"  onClick="location.href='../gudan/gudancreate.jsp'"/>
			<% }else if((me.getGudan() != null) && (!me.getGrade().equals("4"))){ %>
				<input type="button"  class="submit-button" value="구단정보"  onclick="gudanPage()" />
			<% } %>
						
			<% if(me.getGrade().equals("4")){ %>
			<input type="button" class="submit-button"  value="관리"  onclick="location.href='../manager1/manager.jsp'" />
			<% } %>
			<form method="post" action="../member/logout.jsp" name="logoutform" id="logoutform">
				<input type="button"  class="submit-button" value="로그아웃"  onClick="logout()"/>
			</form>
	</div>
  </div>
<% } %>
<!----------------------------------->


<!-- @@ weather @@ -->
<div id="divsearch">
		<input type="text" id="gudan" size="20" />
		<input type="button" class="submit-button" value="구단검색" onclick='gcheck()'/>
</div>
<!-- @@ ranking @@ -->
<div id="divRanking">
	<img src="../images/ranking.png"  />
	
</div>
<div id="divR" style="margin-top:20px">
<a id="aw0" target="_blank" href="/aclk?sa=l&amp;ai=CZlNvr8iwVOieFYb-9QXtlICwDPP0juAFo_mfibUBwI23ARABIMut9yNgm6PphLgpoAGV8svZA8gBAqkCaFAwOOCkDz6oAwHIA8EEqgR1T9Dx0hwxMkfPSuVe9OIpx7mbv2tXw179-uZacTTbvfUHNxt_MbOMqqy73VSGdvLxHIbPEwbtab60WORSQ_3ol5K5k41F2-e4JQ0_DLyUKPzju_6K7SqLixXWPnRjYi58vOWsE3lOxcByN3nH8q6CCKAjQLNAoAYCgAfTjbQm&amp;num=1&amp;sig=AOD64_3VDbXTpCRZfwNtvOHWPg9faYTPig&amp;client=ca-pub-2522582020488831&amp;adurl=http://www.nikestore.co.kr/display/displayShop.lecs%3Fctnakey%3D10114088%26displayNo%3DNK1A21A08A63%26influx_channel_no%3D114624%26influx_channel_detail_no%3D2667558%26utm_source%3DGDN_KW%26utm_medium%3DDA" data-original-click-url="http://googleads.g.doubleclick.net/aclk?sa=l&amp;ai=CZlNvr8iwVOieFYb-9QXtlICwDPP0juAFo_mfibUBwI23ARABIMut9yNgm6PphLgpoAGV8svZA8gBAqkCaFAwOOCkDz6oAwHIA8EEqgR1T9Dx0hwxMkfPSuVe9OIpx7mbv2tXw179-uZacTTbvfUHNxt_MbOMqqy73VSGdvLxHIbPEwbtab60WORSQ_3ol5K5k41F2-e4JQ0_DLyUKPzju_6K7SqLixXWPnRjYi58vOWsE3lOxcByN3nH8q6CCKAjQLNAoAYCgAfTjbQm&amp;num=1&amp;sig=AOD64_3VDbXTpCRZfwNtvOHWPg9faYTPig&amp;client=ca-pub-2522582020488831&amp;adurl=http://www.nikestore.co.kr/display/displayShop.lecs%3Fctnakey%3D10114088%26displayNo%3DNK1A21A08A63%26influx_channel_no%3D114624%26influx_channel_detail_no%3D2667558%26utm_source%3DGDN_KW%26utm_medium%3DDA"><img src="http://pagead2.googlesyndication.com/simgad/15683412650487078963" border="0" width="250" class="img_ad" onload=""></a>
</div>
			
	
	
	