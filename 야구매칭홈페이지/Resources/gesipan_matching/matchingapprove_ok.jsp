<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="Baseball.libs.model.MatchingBean"%>
<%@page import="Baseball.libs.model.MatchBean"%>

<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" /> 
<jsp:useBean id="mis" class="Baseball.libs.control.MatchInsertService" /> 
<jsp:useBean id="mis1" class="Baseball.libs.control.MatchInsertService" /> 
<jsp:useBean id="mis2" class="Baseball.libs.control.MatchingInsertService" /> 
<jsp:useBean id="ugc" class="Baseball.libs.control.UpdateGudanController" /> 
<jsp:useBean id="ugc1" class="Baseball.libs.control.UpdateGudanController" /> 

<%
	int mano = Integer.parseInt(request.getParameter("mano"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	MatchingBean mb = mss.getMatching(mano);
	
	MatchBean mb1 = new MatchBean();
	mb1.setMano(mano);
	mb1.setMatdate(mb.getMadate());
	mb1.setMatgname(mb.getMagname());
	mb1.setMaforteams(mb.getMaforteam());
	mb1.setMaresult(mb.getMaresult());
	
	MatchBean mb2 = new MatchBean();
	mb2.setMano(mano);
	mb2.setMatdate(mb.getMadate());
	mb2.setMatgname(mb.getMaforteam());
	mb2.setMaforteams(mb.getMagname());
	String result = mb.getMaresult();
	
	String matgname = mb.getMagname();
	String maforteam = mb.getMaforteam();
	
	
	if(result.equals("승")){
		ugc.gudanTotWin(matgname);
		ugc1.gudanTotLose(maforteam);
		mb2.setMaresult("패");
	}
	else if(result.equals("무")){
		ugc.gudanTotDraw(matgname);
		ugc1.gudanTotDraw(maforteam);
		mb2.setMaresult("무");
	}else{
		ugc.gudanTotLose(matgname);
		ugc1.gudanTotWin(maforteam);
		mb2.setMaresult("승");
	}
	
	
	mis2.insert_finished(mb,mano);
	int row = mis.insert(mb1);
	
	if(row == 0){
%>

<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("승인되었습니다.");
	<%
	mis1.insert(mb2);	
	%>
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=idx%>";
</script>
<% } %>