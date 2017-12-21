
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판 글</title>

<link rel="stylesheet" type="text/css" href="../css/common_main.css">
<link rel="stylesheet" type="text/css" href="../css/common_content.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_list.css">
<link rel="stylesheet" type="text/css" href="../css/gesipan_view.css">
<style type="text/css">
</style>
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
		
			<!-- 게시글 기본 폼 -->	
			<form>	 
				
				<!-- 
				| 게시글 번호 | 											게시글 제목         		                  					    |
				| 작성자        | -------------------- 	  |  게시날짜    | ---------------  |  조회수	  | ----------------|
										
				 -->		
				 <!-- 글 정보 테이블 -->		
				<table id="tblViewInfo">
					<thead>
						<tr>
							<th>0001</th>
							<td colspan="5">다음 한국시리즈 우승은 누가 될까요?</td>
						</tr>							
						<tr>
							<th>작성자</th>
							<td>홍길동</td>									
							<th>작성 날짜</th>
							<td>2014.12.24</td>
							<th>조회수</th>
							<td>20</td>
						</tr>											
				</table>
				
				<!-- 내용 출력 테이블 -->
				<table id="tblText">
					<tr>
						<td>
						<p>안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안</p>
						<p>안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안</p>
						<p>안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안</p>
						<p>안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안</p>
						<p>안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안안녕하세용안</p>
						</td>
					</tr>
				</table>
				
				<!-- 버튼 테이블 -->	
				<table id="tblBtn">
				  <tr>
					<td>																					 						  
						<input type="button" value="수정하기">&nbsp;
						<input type="button" value="삭제하기">&nbsp;
						<input type="button" value="목록으로" 
					  onclick="location.href='../gesipan_promotion/promotionlist.jsp'">
					</td>
				  </tr>
				</table>
			</form>
			<hr>		
			<!------ 댓글 ------> 
			<div id="divComment">
				<form>
					<table>
						<tr>
							<td>고길동</td>
							<td>안녕하세요! </td>
							<td>2014.12.11</td>
						</tr>
					</table>						
				</form>						
				
				<form name="formComment" action="" method="post" onsubmit="return false;">
					<fieldset class="">		    	
				        <div>
		                    <textarea id="" class=""  name="" size="400"></textarea>
		                    <input type="button" id="" class="" onclick="" value="덧글쓰기">
				        </div>
			        </fieldset>
			    </form>
			</div>	
			
			
						
					
		</div> 						
	</div>	
	
<!-- ============= footer   ============== -->
		  	
	<footer id="footer">			
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
</body>
</html>