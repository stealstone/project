<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MatchingBean"%>
<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" /> 
<jsp:useBean id="mus" class="Baseball.libs.control.MatchingUpdateService" /> 
<jsp:useBean id="mds" class="Baseball.libs.control.MatchingDeleteService" />             
<jsp:useBean id="mds2" class="Baseball.libs.control.MatchingDeleteService" />             
    
<% request.setCharacterEncoding("utf-8"); %>
    
<%	/* update */
	int matchingidx = Integer.parseInt(request.getParameter("idx"));
	int gesipanidx = Integer.parseInt(request.getParameter("gesipanidx"));
	MatchingBean mb = mss.getMatching(matchingidx);
	
	mb.setMacondition("matched");
	
	int row = mus.update(matchingidx, mb);
	if(row == 0){
%>
<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
	<script>
		alert("수락되었습니다.");
	</script>
	<%	/* delete */
		int row1 = mds.delete(gesipanidx);
		if(row1 ==0){
	%>
		<script>
			alert("failure");
			history.go(-1);
		</script>
		<%}else if(row1 == 1){%>		
			<% 
				int row2 = mds2.delete2(mb.getMadate(), mb.getMaforteam());
				if(row2 ==0){
			%>
				<script>
					alert("failure");
					history.go(-1);
				</script>
				<%}else if(row2 ==1 ){ %>
				<script>					
					location.href="../gesipan_matching/matchingview.jsp?idx=<%=gesipanidx%>";
				</script>
		<%} %>
	<%} %>
<% } %>