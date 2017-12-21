<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 권한</title>
<link rel="stylesheet" type="text/css" href="../css/member_adminview.css">
</head>
<body>
	<div id="divAdmin">
	<h2>이사만루 웹 페이지 관리</h2>
	<!-- 구단 정보 폼 -->
	<div>
		<h3>매칭 정보</h3>
		<form id="formGudanSelect">
			<table id="tableMatching">
				<tbody>
					<tr>
						<th>번호</th>
						<th>구단</th>							
						<th>구단</th>
						<th>매칭 날짜</th>
						<th>상태</th>							
					</tr>		
					<tr>
						<td>test</td>
						<td>test</td>
						<td>test</td>
						<td>test</td>
						<td>test</td>
					</tr>
				</tbody>
			</table>
			<br />			
		</form>
	</div>
	
	<!-- 패널티 관리 폼 -->
	<div>
		<h3>패널티 관리</h3>
		<form id="formPenalty">
			<p>
				<label><input type="checkbox" /> 삼성 라이온즈</label><br />
				<label><input type="checkbox" /> 성남성남</label><br />
				<label><input type="checkbox" /> 넥센 히어로즈</label><br />
				<label><input type="checkbox" /> LG 트윈즈</label><br />
				<label><input type="checkbox" /> s프랜즈</label><br />
				<label><input type="checkbox" /> 아이언몬스터즈</label><br />
				<label><input type="checkbox" /> 슽모리츠</label><br />
				<label><input type="checkbox" /> (주)효성</label><br />
				<label><input type="checkbox" /> 알고스</label><br />
				<label><input type="checkbox" /> 11번가 와이번스</label><br />
				<label><input type="checkbox" /> 배트맨</label><br />				
			</p>
			<input type="button" id="btnPanelty" class="float_right" value="패널티 부과" />
		</form>
	</div>
	
	</div>
</body>
</html>