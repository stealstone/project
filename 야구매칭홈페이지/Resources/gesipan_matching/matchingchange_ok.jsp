<%@page import="Baseball.libs.model.MemberBean"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:directive.page import="com.oreilly.servlet.*" />
<jsp:directive.page import="com.oreilly.servlet.multipart.*" />   
<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.GregorianCalendar" />
<jsp:directive.page import="java.util.Date" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:useBean id="us" class="Baseball.libs.control.UpdateService" />
<jsp:useBean id="gb" class="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />

<% request.setCharacterEncoding("utf-8"); %>

<script type="text/javascript">
</script>

<%
	
	/*idx*/
	int idx = Integer.parseInt(request.getParameter("idx"));
	gb.setIdx(idx);	
	/*제목*/
	String title = request.getParameter("title");
	 title = title.replace("<", "&lt;");
	title = title.replace(">", "&gt;");
	title = title.replace("'", "\'"); 
	gb.setSubject(title);
	/* 경기날짜 */
	String sdate = request.getParameter("date");	
	Calendar cal = new GregorianCalendar(
	Integer.parseInt(sdate.substring(0, 4)), 
	Integer.parseInt(sdate.substring(5,7))-1,
	Integer.parseInt(sdate.substring(8)));
	Date da = cal.getTime();
	gb.setSdate(da);
	/*시작*/
	String startapm = request.getParameter("start_apm");
	String startoclock = request.getParameter("start_oclock");
	String startminute = request.getParameter("start_minute");
	startoclock += ":";
	startoclock += startminute;
	startapm += startoclock;
	gb.setStart(startapm);
	/*종료*/
	String closeapm = request.getParameter("close_apm");
	String closeoclock = request.getParameter("close_oclock");
	String closeminute = request.getParameter("close_minute");
	closeoclock += ":";
	closeoclock += closeminute;
	closeapm += closeoclock;
	gb.setClose(closeapm);	
	/*지역*/
	gb.setPlace(request.getParameter("loc"));	
	/*내용*/
	String contents = request.getParameter("Contents");
	contents = contents.replace("<", "&lt;");
	contents = contents.replace(">", "&gt;");
	contents = contents.replace("'", "\'");
	contents = contents.replace("\r\n", "<br />"); 
	gb.setPosts(contents);	
	System.out.println(gb.getIdx()+gb.getSubject());
	
	int row = us.update(gb);
	if(row == 0){
%>

<script>
	alert("Failure");
	history.go(-1);
</script>
<% }else if(row == 1){ %>
<script>
	alert("수정이 완료 되었습니다.");
	location.href="../gesipan_matching/matchingview.jsp?idx=<%=idx%>";
</script>
<% } %>