<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Vector" />
<jsp:directive.page import="Baseball.libs.model.ZipcodeBean" />
<jsp:useBean id="sc" class="Baseball.libs.control.SelectController" />
    
 <%
	String keyword = request.getParameter("keyword");
	if(keyword == null) keyword = "";
	else keyword = entoutf8(keyword);
	
	Vector<ZipcodeBean> vector = null;
	
	if(!keyword.equals("")){
		vector = sc.select_zipcode(keyword);
	}
%>    
<jsp:declaration>
	private String entoutf8(String en){
		String utf8 = null;
		try{
			utf8 = new String(en.getBytes("ISO8859_1"), "utf-8");
		}catch(java.io.UnsupportedEncodingException ex){}
		return utf8;
	}
</jsp:declaration>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title> 주소 검색 창</title>
		<script>
			function Close(){
				var select_list = document.getElementById('ziplist');
				var strArray = select_list.value.split(' ');
				if(select_list == null){					
					self.close();
				}else if(strArray[0] == '서울' || strArray[0] == '울산' || strArray[0] == '대전'
						|| strArray[0] == '대구' || strArray[0] == '부산' || strArray[0] == '인천'
							|| strArray[0] == '광주'){
					opener.document.test.zip.value = strArray[0];				
					self.close();
				}
				else{
					opener.document.test.zip.value = strArray[0] + " "+ strArray[1];				
					self.close();
					}
				}
		</script>
	</head>
<body>
	<table align="center" style="border:1px solid blue;width:600px">
	<tr>
	<td align="center">
	<p>찾고자 하시는 읍/면/동의 이름을 입력한 후, 검색 버튼을 눌러주세요.</p>
	<form method="get">
		<table>
		<tr>
			<td>읍/면/동이름 : </td>
			<td><input type="text" name="keyword" value="<%=keyword%>"><input type="submit" value="검색"></td>
		</tr>
		<% 	if(vector == null && !keyword.equals("")){   %>
				<script>
					alert('귀하가 요청하신 검색결과가 없습니다');
					history.back();
				</script>
		<% 	}else if(!keyword.equals("")){  %>
		<tr>
			<td align='center' colspan='2'>
			<select id="ziplist">
			<option>--선택--</option>
		<% 	for(int i = 0 ; i < vector.size() ; i++){
					ZipcodeBean zip = vector.get(i);
					String str = zip.toString();  %>
					<option value="<%=zip %>"><%=str %></option>
		<%	}  %>
			</select>
			</td>
		</tr>
		<%}  %>
		<tr>
			<td colspan="2" align="center"><input type="button" value="창닫기" onclick="Close()"></td>
		</tr>
		</table>
		</form>
		</td>
		</tr>
		</table>
	</body>
</html>