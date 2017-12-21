<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
    
<%
	MemberBean me = (MemberBean)session.getAttribute("me");
	if(me == null){
%>
		<script>
			function logcheck1(){
				alert("로그인 해주세요");
				return false;
			}
			function logcheck2(){
				alert("로그인 해주세요");
				return false;
			}
			function logcheck3(){
				alert("로그인 해주세요");
				return false;
			}
			function logcheck4(){
				alert("로그인 해주세요");
				return false;
			}
			function logcheck5(){
				alert("로그인 해주세요");
				return false;
			}
		</script>
<%
	}else if(me.getGrade().equals("1")){
%>
		<script>
			function logcheck1(){
				var notice = document.getElementById("notice");
				notice.href = "../gesipan_notice/noticelist.jsp";				
			}			
			function logcheck2(){
				var mach = document.getElementById("mach");
				mach.href = "../gesipan_matching/matchinglist.jsp";	
			}
			function logcheck3(){
				var ad = document.getElementById("ad");
				ad.href = "../gesipan_promotion/promotionlist.jsp";
			}
			function logcheck4(){
				var free = document.getElementById("free");
				free.href = "../gesipan_free/freelist.jsp";
			}
			function logcheck5(){
				var qa = document.getElementById("qa");
				qa.href = "../gesipan_qna/qnalist.jsp";
			}
		</script>
<%
	}else{
%>
		<script>
			function logcheck1(){
				var notice = document.getElementById("notice");
				notice.href = "../gesipan_notice/noticelist.jsp";				
			}			
			function logcheck2(){
				var mach = document.getElementById("mach");
				mach.href = "../gesipan_matching/matchinglist.jsp";
			}
			function logcheck3(){
				var ad = document.getElementById("ad");
				ad.href = "../gesipan_promotion/promotionlist.jsp";
			}
			function logcheck4(){
				var free = document.getElementById("free");
				free.href = "../gesipan_free/freelist.jsp";
			}
			function logcheck5(){
				var qa = document.getElementById("qa");
				qa.href = "../gesipan_qna/qnalist.jsp";
			}
		</script>
<%
	}
%>
 
<link rel="stylesheet" type="text/css" href="../css/common_header.css">
<!-- @@   logo @@-->

<div id="divLogo">
	<a href="../common/main.jsp"><img src="../images/logo1.png"></a>
</div>

<!--@@ navigation @@-->		
		
<nav id="gnb">
	<ul>	
		<li id="gnb1"><a href="#" onclick="logcheck1()" id="notice">공지사항</a></li>					
		<!-- 1번 상단메뉴 -->
		<li id="gnb2" ><a href="#" onclick="logcheck2()" id="mach">매칭게시판</a></li>
		<!-- 2번 상단메뉴 -->
		<li id="gnb3"><a href="#" onclick="logcheck3()" id="ad">홍보게시판</a></li>
		<!-- 3번 상단메뉴 -->					
		<li id="gnb4"><a href="#" onclick="logcheck4()" id="free">자유게시판</a></li>
		<!-- 4번 상단메뉴 -->
		<li id="gnb5"><a href="#" onclick="logcheck5()" id="qa">Q&A게시판</a></li>					
	</ul>
</nav>	