<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Baseball.libs.model.MemberBean"%>
<%@page import="Baseball.libs.model.MatchingBean"%>
<jsp:directive.page import="java.util.Vector" />    
<jsp:useBean id="ds" class="Baseball.libs.control.DeleteService" /> 
<jsp:useBean id="ds1" class="Baseball.libs.control.DeleteService" /> 
<jsp:useBean id="ds2" class="Baseball.libs.control.DeleteService" /> 
<jsp:useBean id="ds3" class="Baseball.libs.control.DeleteService" /> 
<jsp:useBean id="mds" class="Baseball.libs.control.MatchingDeleteService" />
<jsp:useBean id="mss" class="Baseball.libs.control.MatchingSelectService" /> 
<jsp:useBean id="mss1" class="Baseball.libs.control.MatchingSelectService" /> 

<%
System.out.println("dfdf");
MemberBean me = (MemberBean)session.getAttribute("me");
/* String gudan = request.getParameter("gudan");
System.out.println("delete_ok : "+gudan); */
%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	/*matching 테이블내에 게시판 번호가 있는 칼럼들 지우기 */
	Vector<MatchingBean> vector = mss.getMatchings(idx); 
	if(vector == null){
		/*댓글삭제*/
		ds.deleteCommentGesipanid(idx);
		/*게시글 삭제*/
		ds1.delete(idx);		
		
		response.sendRedirect("../gesipan_matching/matchinglist.jsp");
	}else{
		int num = mss1.getIncount(idx);		
		if(num==0){
			/*댓글삭제*/
			ds2.deleteCommentGesipanid(idx);
			/*매칭정보 삭제*/
			mds.delete(idx);
			/*게시글 삭제*/
			ds3.delete(idx);
			response.sendRedirect("../gesipan_matching/matchinglist.jsp");
		}else{
			%>
			<script>
				alert("매칭정보가 남아있으므로 게시글을 삭제할 수 없습니다.");
				history.go(-1);
			</script>
			<%
		}
	}	
 %>