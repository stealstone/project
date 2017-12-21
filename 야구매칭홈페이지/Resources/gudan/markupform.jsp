<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>구단 마크 업로드</title>
<style type="text/css">
	h5{
		margin-top: 0px;
	}
	div, input[type="submit"]{
		text-align: center;
	}
	#ok{
		margin-top: 20px;
	}
</style>
<script>	
	function uploadok(){
		if(document.forms[0].markupload.value != ""){
			document.forms[0].submit();	
		}
		self.close();
	}
</script>
</head>
<body>	
	<form action="markup.jsp" method="post" enctype="multipart/form-data">
		<h5>구단 마크 올리기</h5>
		<div>
			<label>파일 경로 : </label><input type="file" name="markupload"/>
		</div>
		<div>
			<input type="button" value="확인" id="ok" onclick="uploadok()"/>
		</div>		
	</form>
</body>
