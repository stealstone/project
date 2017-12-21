<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="java.util.Vector" />
<jsp:useBean id="uc2" class="Baseball.libs.control.UpdateController" /> 
<jsp:useBean id="uc1" class="Baseball.libs.control.UpdateController" /> 
<jsp:useBean id="uc" class="Baseball.libs.control.UpdateGudanMemberController" />    
<jsp:useBean id="sc1" class="Baseball.libs.control.SelectGudanMemberController" />
<jsp:useBean id="sc2" class="Baseball.libs.control.SelectGudanMemberController" /> 
<%
	String id = request.getParameter("id");
	String guno1 = request.getParameter("guno");
	int guno = Integer.parseInt(guno1);
	GudanBean gudan = (GudanBean)session.getAttribute("gudan");
	uc.JoinDelete(id ,guno);
	uc2.updateClub(id, "1", "");
	uc1.updatePage(id, "");
%>
<%
	String strDiv = "";
	strDiv += "<div id=\"Join_member\">";
	strDiv += "<table class='table table-striped'>";
	strDiv += "<caption><img src='./images/gu_meminfo.png' width='65' height='22'/></caption>";
	strDiv += "<tr>";
	strDiv += "<th>이름</th>";
	strDiv += "<th>생년월일</th>";
	strDiv += "<th>연고지</th>";
	strDiv += "<th>포지션</th>";
	strDiv += "<th>추방여부</th>";		
	strDiv += "</tr>";
	strDiv += "</table>";
	strDiv += "</div>";
	strDiv += "<div class='Join_member3'>";
	strDiv += "<table class='table table-hover'>";
%>
<%
	Vector<MemberBean> vector = sc1.getId(gudan.getGuno(), "y");
	if(vector != null){
	for(int i=0; i < vector.size(); i++){
	MemberBean mb = vector.get(i);%>
<%
	strDiv += "<tr>";
	strDiv += "<td>" + mb.getName() + "</td>";
	strDiv += "<td>" + mb.getBirthday()+ "</td>";
	strDiv += "<td>" + mb.getAddress() + "</td>";
	strDiv += "<td>" + mb.getPosition() + "</td>";
	strDiv += "<td><img class='join' src='./images/out.png' onclick='gujul('"+mb.getUserid()+"'," + gudan.getGuno() +")' />";
	strDiv += "</tr>";
	strDiv += "</div>";
%>	
<%}} else{%>
<%
	strDiv += "<tr>";
	strDiv += "<td colspan='4'> 구단에 가입한 사람이 없습니다. </td>";
	strDiv += "</tr>"; 
} %>
<%	strDiv += "</table>";  	
	strDiv += "</div>";
	strDiv += "<div id='Join_member1'>";
	strDiv += "<table class='table table-striped'>";
	strDiv += "<thead id='join_status'>";
	strDiv += "<caption><img src='./images/team_join_status.PNG' width='80' height='30'/></caption>";
	strDiv += "<tr>";
	strDiv += "<th>이름</th>";
	strDiv += "<th>생년월일</th>";
	strDiv += "<th>연고지</th>";
	strDiv += "<th>포지션</th>";
	strDiv += "<th>입단결정</th>";		
	strDiv += "</tr>";
	strDiv += "</thead>";
	strDiv += "</table>";
	strDiv += "</div>";
	strDiv += "<div class='Join_member2'>";
	strDiv += "<table class='table table-hover'>";
%>
<%
	Vector<MemberBean> vector1 = sc2.getId(gudan.getGuno(), "w");
	if(vector1 != null){
	for(int i=0; i < vector1.size(); i++){
	MemberBean mb1 = vector1.get(i);
%>
<%
	strDiv += "<tr>";
	strDiv += "<td>" + mb1.getName() + "</td>";
	strDiv += "<td>" + mb1.getBirthday() + "</td>";
	strDiv += "<td>" + mb1.getAddress() + "</td>";
	strDiv += "<td>" + mb1.getPosition() + "</td>";
	strDiv += "<td><img class='join' src=''./images/surak.png' onclick='javascript:surak('"+ mb1.getUserid() +"',"+gudan.getGuno()+")' />&nbsp;&nbsp;&nbsp;";
	strDiv += "<img class='join' src='./images/gujul.png' onclick='gujul('"+ mb1.getUserid() +"'," + gudan.getGuno() + ")'/></td>";
	strDiv += "</tr>";
%>
<%}
			} else{%>
<%
	strDiv += "<tr>";
	strDiv += "<td colspan='5'> 가입한 신청한 사람이 없습니다. </td>"; 
	strDiv += "</tr>";
} %>
<%	
	strDiv += "</table>";				
	strDiv += "</div>";
	strDiv += "</div>";	
	out.println(strDiv);
%>