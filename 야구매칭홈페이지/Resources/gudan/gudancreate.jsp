<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>야구 경기 매칭 사이트</title>
<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/gudan_gudancreate.css">
<script type="text/javascript" src="../js/image.js"></script>
<script type="text/javascript" src="../js/gudan_join.js"></script>
<script type="text/javascript" src="../js/gnamecheck.js"></script>
<script type="text/javascript" src="../js/zipsearch1.js"></script>
</head>
<body> 	 
 	
<!-- ========== header ==========  -->
		 
		<header id="header">			
			<jsp:include page="../common/header.jsp" />
		</header>
				
<!-- ========== container ========== -->

		<div id="divContainer">
			<!---@@   sidebar  @@-->
			<div id="divSide">
				<jsp:include page="../common/sidebar.jsp" />
			</div>
			<!---@@  content  @@-->
			<div id="divContent">			
				
				<h2>구단 창설</h2>
				<hr>
				 <form name=test action="g_insert.jsp" method="post" enctype="multipart/form-data">
				 <input type="hidden" id="flag" name="flag" value="true" />
				 <table id="gudan_join">
				   <tr id="mark_tr">
				   	<td class="title"><b>구단마크</b></td>
				   	<td><div id="mark"></div></td>
				   </tr>
				   <tr class="col">
				   	<td class="title"></td>
				   	<td><input type="file" id="markupload" name="markupload" onchange="InputImage()"/> </td>
				   </tr>
				   <tr class="col">
				    <td class="title"><b>구단명</b></td>
				    <td> <input type="text" id="gudan_name" name="gudan_name" size="15" maxlength="10"/></td>
				    <td> <input type="button" value="중복체크" onclick="gnamecheck()"/></td>
				    <td class="pilsu"><font color='red'><b>*필수</b></font></td>
				   </tr>
				   <!-- <tr class="col">
				    <td class="title"><b>구단창설일</b></td>
				    <td colspan="2"><input type="date" name="start_date" size="15"></td>
				    <td class="pilsu"><font color='red'><b>*필수</b></font></td>
				   </tr>  -->  
				   <tr class="col">
				    <td class="title"><b>연고지</b></td>
				    <td><input type="text" name="zip" size="15" readonly="readonly"></td>
				    <td><input type="button" value="검색" onclick="postcheck1()"/></td>
				    <td class="pilsu"><font color='red'><b>*필수</b></font></td>
				   </tr>
				   <tr id="detail_tr">
				    <td class="title"><b>구단 소개</b></td>
				    <td colspan="2"><textarea cols="35" name="detail" ></textarea></td>
				    <td class="pilsu"><font color='red'><b>*필수</b></font></td>
				   </tr>   				 
				  </table>  
				  <hr> 
				  <div>
				     <input type="button" value="구단창설" onclick="gudanjoinOk()"/>
				     <input type="button" value="재작성" onClick="window.location.reload()"/>
				  </div>
				 </form> 
				 
			</div>
		</div> 
		
<!-- ============= footer   ============== -->
		  	
		<footer id="footer">			
			<jsp:include page="../common/footer.jsp" />
		</footer>
	
</body>
</html>