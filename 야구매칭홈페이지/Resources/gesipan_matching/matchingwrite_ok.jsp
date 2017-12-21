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
<jsp:useBean id="is" class="Baseball.libs.control.InsertService" />
<jsp:useBean id="gb" class="Baseball.libs.model.GesipanBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />
<jsp:useBean id="ss" class="Baseball.libs.control.SelectService" />
<jsp:useBean id="msc" class="Baseball.libs.control.MatchingSelectService" />

<% request.setCharacterEncoding("utf-8"); %>

<script type="text/javascript">
</script>

<%	
	/* 신청한 경기날짜와 글쓸때의 경기날짜 중복된다면 */

	String sdate = request.getParameter("date");	
	Calendar cal = new GregorianCalendar(
	Integer.parseInt(sdate.substring(0, 4)), 
	Integer.parseInt(sdate.substring(5,7))-1,
	Integer.parseInt(sdate.substring(8)));
	Date da = cal.getTime();	
	
	MemberBean me = (MemberBean)session.getAttribute("me");	
	int count = msc.count_select(me.getGudan(), da);
	if(count!=0){
%>
	<script>
	alert("경기 신청을 하신 날짜와 중복되므로 다른 날짜를 선택해 주세요.");
	history.go(-1);	
	</script>
<%	
		}else{
		/* 경기날짜가 오늘 이후로 설정하기 위해서 */
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");		
		int inttoday = Integer.parseInt(sdf.format(today));
		int intgame = Integer.parseInt(sdf.format(da));		
		if(inttoday >= intgame){
		%>
		<script>
			alert("오늘 이후로 경기 날짜를 선택해 주세요.");
			history.go(-1);
		</script>		
		<%}else{
			int count2=ss.getIncount(me.getGudan(), da);
			if(count2!=0){
				%>
				<script>
					alert("경기 신청을 하신 날짜와 중복되므로 다른 날짜를 선택해 주세요.")
					history.go(-1);
				</script>
			<%}else{
				
				String startapm = request.getParameter("start_apm");
				String startoclock = request.getParameter("start_oclock");
				String startminute = request.getParameter("start_minute");
				
				String closeapm = request.getParameter("close_apm");
				String closeoclock = request.getParameter("close_oclock");
				String closeminute = request.getParameter("close_minute");
				
				if((startapm.equals(closeapm))&&(startoclock.equals(closeoclock))){//apm이 같고 시작시간과종료시간이 같으면
					%>
					<script>
					alert("경기의 시작시간과 종료시간이 같습니다.")
					history.go(-1);
					</script>
					<%
				}
				else{
					if(startapm.equals(closeapm)&&Integer.parseInt(startoclock)>Integer.parseInt(closeoclock)){
						%>
						<script>
						alert("시작시간과 종료시간의 설정에 오류가 있습니다.")
						history.go(-1);
						</script>
						<%
					}else if((!startapm.equals(closeapm))&&Integer.parseInt(startoclock)<Integer.parseInt(closeoclock)){
						%>
						<script>
						alert("시작시간과 종료시간의 설정에 오류가 있습니다.")
						history.go(-1);
						</script>
						<%
					}else{
						/*id*/	
						gb.setId(me.getUserid());
						/*구단이름*/
						MemberBean me1 = sc.getmember(gb.getId());
						gb.setGname(me1.getGudan());	
						/*제목*/
						String title = request.getParameter("title");
						 title = title.replace("<", "&lt;");
						title = title.replace(">", "&gt;");
						title = title.replace("'", "\'"); 
						gb.setSubject(title);
						/*내용*/
						String contents = request.getParameter("Contents");
						contents = contents.replace("<", "&lt;");
						contents = contents.replace(">", "&gt;");
						contents = contents.replace("'", "\'");
						contents = contents.replace("\r\n", "<br />");
						
						gb.setPosts(contents);
						/*작성날짜*/   
						/* 는 DAO에서 작성 */	
						/* 경기날짜 */	
						gb.setSdate(da);
						
						/*시작*/
						startoclock += ":";
						startoclock += startminute;
						startapm += startoclock;
						gb.setStart(startapm);
						/*종료*/	
						closeoclock += ":";
						closeoclock += closeminute;
						closeapm += closeoclock;
						gb.setClose(closeapm);	
						/*지역*/
						gb.setPlace(request.getParameter("loc"));						
						int row = is.insert(gb);
						if(row == 0){
					%>					
					<script>
						alert("Failure");
						history.go(-1);
					</script>
					<% }else if(row == 1){ %>
					<script>
						alert("작성되었습니다.");
						location.href="../gesipan_matching/matchinglist.jsp?page=1";
					</script>
					<%
							}
						}		
					}
				}
			}
		}
	
	%>
