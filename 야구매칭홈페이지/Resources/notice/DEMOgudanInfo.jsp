<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
 <head>
  <title> 2사만루</title>
  <meta charset="utf-8" />
  <script type="text/javascript" language="JavaScript" src="js/gudantab.js" charset="UTF-8"></script>
 <link rel="stylesheet" type="text/css" href="css/gudaninfo.css">	
 </head>
 
 <body>
 <header>  
 	<h1>2사 만루<em>구단 페이지</em></h1>	 
	<input type="button" class="btn_close" value="닫기" />
	<input type="button" class="btn_join" value="구단가입하기" />
	<!-- <input type="button" class="btn_matching" value="매칭신청하기" /> --> 
  </header>

  <aside>
  <div id="sidebar" >
  	<div style="margin:10px">
		<img class="gudanlogo" src="" width="50px" height="50px"/>
		<h3>(구단 이름)<br />(구단주)</h3>
		<h4>연고지 : (연고지)</h4>	
	</div>
	<!-- 	<img src=""  width="231px" height="190px" />	 -->		
  </div>
  </aside>

<section>
  <div id="center">
 
  <ul id="gudantab">
		<a href="javascript:whenGudantab('01')" id="gudantab_a01" class="on">구단정보</a>
		<a href="javascript:whenGudantab('02')" id="gudantab_a02" class="">구단기록 </a>
		<a href="javascript:whenGudantab('03')" id="gudantab_a03" class="">선수정보</a>
  </ul>
  	<div id=gudantab01>
  		<div id="image">
			<table>
				<tr>
					<!-- <img src="" width="152px" height="147px" />
					<img src=""  width="152px" height="147px" />
					<img src="" width="152px" height="147px" />
					<img src=""  width="153px" height="147px" />  -->
				</tr>
			</table>
		</div>
		<div id="divHongbo" style="margin-top:40px;">
			<fieldset>
		  		<legend>
		  			<h3>홍보글</h3>
		  		</legend>
		  		<p></p>
		  	</fieldset>
		</div>
		<div id="divVisited">
			<fieldset>
		  		<legend>
		  			<h3>방명록</h3>
		  		</legend>
		  		<!-- <p></p>
				<p></p> -->
		  		<input type="text" id="text" />
		  		<input type="button" id="go" value="취소" /> 	
		  		<input type="button" id="go" value="등록" />
		  	</fieldset>
		</div>
	</div>
	<div id="gudantab02" style="display:none;">
		<div id="gudan_result">
			<h2>구단기록</h2>
			  <table width="660px">
				<thead>
					<tr>		
						<th >날짜</th>
						<th>상대구단</th>
						<th>승</th>
						<th>무</th>
						<th>패</th>
						<th>스코어</th>
						<th>승점</th>
						<th>총점</th>			
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- <td>2014.12.12</td>
						<td>롯데자이언츠</td>
						<td>ㅇ</td>
						<td></td>
						<td></td>
						<td>5:2</td>
						<td>5</td>
						<td>1205</td> -->
					</tr>
				</tbody>
			  </table>
			  
		 </div>		
	</div>
	<div id="gudantab03" style="display:none;">
			<h2>선수정보</h2>
			<div>
	  			<table width="660px">
					<thead>
						<tr>
							<th>가입날짜</th>
							<th>이름</th>
							<th>나이</th>
							<th>연고지</th>
							<th>포지션</th>
							<th>사진</th>			
						</tr>
						<tr>
							<!-- <td>2014-12-10</td>
							<td>이승엽</td>
							<td>35</td>
							<td>대구</td>
							<td>내야수</td>
							<td><img src="images/y2.jpg" width="50px"height="50px" /></td> -->							
						</tr>				
			
					</thead>
			  	</table>			  
			</div>
		</div>	
	 </div>
  </section>
 </body>
</html>
