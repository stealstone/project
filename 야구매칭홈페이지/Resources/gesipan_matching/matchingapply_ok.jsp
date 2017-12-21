<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MemberBean"%>      
<%@page import="Baseball.libs.model.MatchingBean"%>        
<jsp:directive.page import="java.util.Vector" />      
<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.GregorianCalendar" />
<jsp:directive.page import="java.util.Date" />
<jsp:useBean id="mb" class="Baseball.libs.model.MatchingBean" />
<jsp:useBean id="mis" class="Baseball.libs.control.MatchingInsertService" /> 
<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" /> 

<% request.setCharacterEncoding("utf-8"); %>

<%	
	MemberBean me = (MemberBean)session.getAttribute("me");

	int gesipanidx = Integer.parseInt(request.getParameter("idx"));
	Vector<MatchingBean> vector =mss.getMatchings(gesipanidx);	
	
	/*게시판 번호*/
	mb.setMagno(gesipanidx);
	/* 경기날짜 */
	String sdate = request.getParameter("date");
	Calendar cal = new GregorianCalendar(
	Integer.parseInt(sdate.substring(0, 4)), 
	Integer.parseInt(sdate.substring(5,7))-1,
	Integer.parseInt(sdate.substring(8)));
	Date da = cal.getTime();
	mb.setMadate(da);	
	/*시작*/
	mb.setMastart(request.getParameter("start"));	
	/*경기종료시간*/
	mb.setMaclose(request.getParameter("close"));
	/*경기 지역*/
	mb.setMaplace(request.getParameter("place"));	
	/*신청한 구단*/ 
		
	mb.setMaforteam(me.getGudan());
	/*신청받은 구단*/
	mb.setMagname(request.getParameter("gudan"));	
	
	if(vector == null){
	
	int row = mis.insert(mb);
	if(row == 0){
%>
<script>
	alert("실패하셨습니다.");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("신청에 성공하셨습니다.");
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=gesipanidx%>";
</script>
<% 
		}
	}	
	else{
		int count = 0;
		for(int i = count ; i < vector.size() ; i++){
			MatchingBean mb1 = vector.get(i);			
			if(mb1.getMaforteam().equals(me.getGudan())){			
			%>
			<script>
				alert("이미 경기신청을 하셨습니다.");		
				history.go(-1);
			</script>
			<%
			}
			count++;			
		}
		int row = mis.insert(mb);
		if(row == 0){
	%>
	<script>
		alert("구단에 가입하신후 신청해주세요.");
		history.go(-1);
	</script>
	<% }else if(row == 1){ %>
	<script>
		alert("경기 신청이 되었습니다.");
		location.href="../gesipan_matching/matchingview.jsp?idx=<%=gesipanidx%>";
	</script>
	<%
		}
	}
%>