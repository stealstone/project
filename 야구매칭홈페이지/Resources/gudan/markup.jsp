<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:directive.page import="com.oreilly.servlet.*" />
<jsp:directive.page import="com.oreilly.servlet.multipart.*" />  

<% request.setCharacterEncoding("utf-8"); %>

<%

  	String uploadPath = application.getRealPath("/images/temp");
  	int size = 10*1024*1024;        // 업로드 파일 최대 크기 지정
  
  	// 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달, 
  	//업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
  	MultipartRequest multi = new MultipartRequest(request, 
  							uploadPath, size, 
  							"utf-8", 
  							new DefaultFileRenamePolicy());
 	
   
    String filename = multi.getFilesystemName("markupload");
	if(filename == null) filename = "";
%>




