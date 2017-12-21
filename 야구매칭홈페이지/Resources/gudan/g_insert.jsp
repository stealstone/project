<%@ page import="Baseball.libs.model.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Calendar" />
<jsp:directive.page import="java.util.GregorianCalendar" />
<jsp:directive.page import="Baseball.libs.model.GudanJoinBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="ic" class="Baseball.libs.control.InsertGudanController" /> 
<jsp:useBean id="uc" class="Baseball.libs.control.UpdateGudanController" /> 
<jsp:useBean id="umc" class="Baseball.libs.control.UpdateController" />
<jsp:useBean id="umc1" class="Baseball.libs.control.UpdateController" /> 
<jsp:directive.page import="com.oreilly.servlet.*" />
<jsp:directive.page import="com.oreilly.servlet.multipart.*" />
<jsp:directive.page import="java.io.FileInputStream" />
<jsp:directive.page import="java.io.FileOutputStream" />
<jsp:directive.page import="java.nio.channels.FileChannel" />
<jsp:directive.page import="java.io.File" /> 
<jsp:directive.page import="java.io.BufferedWriter" />
<jsp:directive.page import="java.io.FileWriter" />
<jsp:directive.page import="java.io.IOException" />
<jsp:directive.page import="org.apache.commons.io.FileUtils" />

<%
 	request.setCharacterEncoding("utf-8");
 %>

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
	
	String emblem = uploadPath + "/" + filename;
	String gudan = multi.getParameter("gudan_name");
	MemberBean me = (MemberBean)session.getAttribute("me");
	String loc = multi.getParameter("zip");
	String intro = multi.getParameter("detail");
	String rating = "2";
		
	GudanJoinBean gb = new GudanJoinBean(gudan, loc, "kk", me.getUserid(), intro, 1000, rating, emblem);
	
	int row = ic.insert(gb);
	if(row == 0){
%>
	<script>
		alert("Failure");
		history.go(-1);
	</script>
<%}else if(row == 1){
	/* gudanDirectory => 0: 아이디 폴더, 1: js 폴더, 2: css 폴더, 3: images 폴더 */
	
	/* gudanDirectory => 0: 아이디 폴더 */		
	String path = application.getRealPath("/gudan_page/" + me.getUserid());	
	
	File gudanDirectory = new File(path); // 폴더명

	if(!gudanDirectory.exists()){ 

		gudanDirectory.mkdirs();
		 System.out.println(gudanDirectory);
	    System.out.println("디렉토리를 생성했습니다.");

	}else{

	    // 폴더가 존재하면 폴더 내 기존 파일 다 삭제
	    File[] gudanFiles = gudanDirectory.listFiles();

	    for (File file : gudanFiles) {
	     file.delete();

	    }

	    System.out.println("폴더내의 기존 파일을 모두 삭제하였습니다.");
	    
	}
	
	/* gudanDirectory => 1: js 폴더  */
	
	File gudanDirectory1 = new File(path + "/js"); // 폴더명

	if(!gudanDirectory1.exists()){ 

		gudanDirectory1.mkdirs();
		
	    System.out.println("js디렉토리를 생성했습니다.");

	}else{

	    // 폴더가 존재하면 폴더 내 기존 파일 다 삭제
	    File[] gudanFiles1 = gudanDirectory1.listFiles();

	    for (File file1 : gudanFiles1) {
	     file1.delete();

	    }

	    System.out.println("js폴더내의 기존 파일을 모두 삭제하였습니다.");
	    
	}
	
	/* gudanDirectory => 2: css 폴더  */
			
	File gudanDirectory2 = new File(path + "/css"); // 폴더명

	if(!gudanDirectory2.exists()){ 

		gudanDirectory2.mkdirs();
	    System.out.println("css디렉토리를 생성했습니다.");

	}else{

	    // 폴더가 존재하면 폴더 내 기존 파일 다 삭제
	    File[] gudanFiles2 = gudanDirectory2.listFiles();

	    for (File file2 : gudanFiles2) {
	     file2.delete();

	    }

	    System.out.println("css폴더내의 기존 파일을 모두 삭제하였습니다.");
	    
	}
	
	/* gudanDirectory => 3: images 폴더  */
	
	File gudanDirectory3 = new File(path + "/images"); // 폴더명

	if(!gudanDirectory3.exists()){ 

		gudanDirectory3.mkdirs();
	    System.out.println("images 디렉토리를 생성했습니다.");

	}else{

	    // 폴더가 존재하면 폴더 내 기존 파일 다 삭제
	    File[] gudanFiles3 = gudanDirectory3.listFiles();

	    for (File file3 : gudanFiles3) {
	     file3.delete();

	    }

	    System.out.println("images 폴더내의 기존 파일을 모두 삭제하였습니다.");
	    
	}
	
	/* inputStream => 0: header, 1: sidebar, 2: admin, 3: member, 4: emblem, 5: lavish-bootstrap.css, 6: header.css, 7: sidebar.css, 8: view.css, 9: gallery.css*/
	
	/* inputStream => 0: header */
	String path1 = application.getRealPath("/");		
	FileInputStream inputStream = new FileInputStream(path1 + "gudan_tmp/gudanheader.jsp");        
	FileOutputStream outputStream = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/gudanheader.jsp");
	  
	FileChannel fcin =  inputStream.getChannel();
	FileChannel fcout = outputStream.getChannel();
	  
	long size1 = fcin.size();
	fcin.transferTo(0, size1, fcout);
	  
	fcout.close();
	fcin.close();
	  
	outputStream.close();
	inputStream.close();	

	/* inputStream =>1: sidebar*/
			
	FileInputStream inputStream1 = new FileInputStream(path1 + "gudan_tmp/gudansidebar.jsp");        
	FileOutputStream outputStream1 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/gudansidebar.jsp");
	  
	FileChannel fcin1 =  inputStream1.getChannel();
	FileChannel fcout1 = outputStream1.getChannel();
	  
	long size2 = fcin1.size();
	fcin1.transferTo(0, size2, fcout1);
	  
	fcout1.close();
	fcin1.close();
	  
	outputStream1.close();
	inputStream1.close();
	
	/* inputStream => 2: admin */
			
	FileInputStream inputStream2 = new FileInputStream(path1 + "gudan_tmp/gudanview_admin.jsp");        
	FileOutputStream outputStream2 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/gudanview_admin.jsp");
	  
	FileChannel fcin2 =  inputStream2.getChannel();
	FileChannel fcout2 = outputStream2.getChannel();
	  
	long size3 = fcin2.size();
	fcin2.transferTo(0, size3, fcout2);
	  
	fcout2.close();
	fcin2.close();
	  
	outputStream2.close();
	inputStream2.close();

	/* inputStream => 3: member */
	FileInputStream inputStream3 = new FileInputStream(path1 + "gudan_tmp/gudanview_mem.jsp");        
	FileOutputStream outputStream3 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/gudanview_mem.jsp");
	  
	FileChannel fcin3 =  inputStream3.getChannel();
	FileChannel fcout3 = outputStream3.getChannel();
	  
	long size4 = fcin3.size();
	fcin3.transferTo(0, size4, fcout3);
	  
	fcout3.close();
	fcin3.close();
	  
	outputStream3.close();
	inputStream3.close();
	
	/* inputStream => 4: emblem */
	
	FileInputStream inputStream4 = new FileInputStream(emblem);        
	FileOutputStream outputStream4 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/images/mark.jpg");
	  
	FileChannel fcin4 =  inputStream4.getChannel();
	FileChannel fcout4 = outputStream4.getChannel();
	  
	long size5 = fcin4.size();
	fcin4.transferTo(0, size5, fcout4);
	  
	fcout4.close();
	fcin4.close();
	  
	outputStream4.close();
	inputStream4.close();
	
	/* 엠블럼 복사가 끝나면 temp 안에 있는거 삭제  */
	File uploadDirectory = new File(uploadPath);
	
	File[] tempFiles = uploadDirectory.listFiles();

    for (File file : tempFiles) {
     file.delete();
    }
	
	/* inputStream => 5: lavish-bootstrap.css */
	
	FileInputStream inputStream5 = new FileInputStream(path1 + "gudan_tmp/css/lavish-bootstrap.css");        
	FileOutputStream outputStream5 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/css/lavish-bootstrap.css");
	  
	FileChannel fcin5 =  inputStream5.getChannel();
	FileChannel fcout5 = outputStream5.getChannel();
	  
	long size6 = fcin5.size();
	fcin5.transferTo(0, size6, fcout5);
	  
	fcout5.close();
	fcin5.close();
	  
	outputStream5.close();
	inputStream5.close();
	
	/* inputStream => 6: header.css */
	
	FileInputStream inputStream6 = new FileInputStream(path1 + "gudan_tmp/css/gudan_gudanheader.css");        
	FileOutputStream outputStream6 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/css/gudan_gudanheader.css");
	  
	FileChannel fcin6 =  inputStream6.getChannel();
	FileChannel fcout6 = outputStream6.getChannel();
	  
	long size7 = fcin6.size();
	fcin6.transferTo(0, size7, fcout6);
	  
	fcout6.close();
	fcin6.close();
	  
	outputStream6.close();
	inputStream6.close();
	
	/* inputStream => 7: sidebar.css */
			
	FileInputStream inputStream7 = new FileInputStream(path1 + "gudan_tmp/css/gudan_gudansidebar.css");        
	FileOutputStream outputStream7 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/css/gudan_gudansidebar.css");
	  
	FileChannel fcin7 =  inputStream7.getChannel();
	FileChannel fcout7 = outputStream7.getChannel();
	  
	long size8 = fcin7.size();
	fcin7.transferTo(0, size8, fcout7);
	  
	fcout7.close();
	fcin7.close();
	  
	outputStream7.close();
	inputStream7.close();
			
	/* inputStream => 8: view.css */
			
	FileInputStream inputStream8 = new FileInputStream(path1 + "gudan_tmp/css/gudan_gudanview.css");        
	FileOutputStream outputStream8 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/css/gudan_gudanview.css");
	  
	FileChannel fcin8 =  inputStream8.getChannel();
	FileChannel fcout8 = outputStream8.getChannel();
	  
	long size9 = fcin8.size();
	fcin8.transferTo(0, size9, fcout8);
	  
	fcout8.close();
	fcin8.close();
	  
	outputStream8.close();
	inputStream8.close();
	
	/* inputStream => 9: gallery.css */
	
	FileInputStream inputStream9 = new FileInputStream(path1 + "gudan_tmp/css/gallery.css");        
	FileOutputStream outputStream9 = new FileOutputStream(path1 + "gudan_page/" + me.getUserid() + "/css/gallery.css");
	  
	FileChannel fcin9 =  inputStream9.getChannel();
	FileChannel fcout9 = outputStream9.getChannel();
	  
	long size10 = fcin9.size();
	fcin9.transferTo(0, size10, fcout9);
	  
	fcout9.close();
	fcin9.close();
	  
	outputStream9.close();
	inputStream9.close();
	
	/* 구단명 파일 생성  */
	File file = new File(path + "/gname.txt");

	// 파일 생성
	 file.createNewFile();

	// 파일쓰기를 위한 객체 생성

	 BufferedWriter wt = new BufferedWriter(new FileWriter(file));

	// 파일에 아래 문자들을 출력 \t 탭띄우기 \n 개행문자
	 wt.write(gudan);
	//wt에 쓰기
	 wt.flush();
	// 파일 핸들 반환
	 wt.close();
	
	File srcDir = new File(path1 + "gudan_tmp/images");
    File destDir = new File(path + "/images");

    try {
        FileUtils.copyDirectory(srcDir, destDir);
    } catch (IOException e) {
        e.printStackTrace();
    }
    
    File srcDir1 = new File(path1 + "gudan_tmp/js");
    File destDir1 = new File(path + "/js");

    try {
        FileUtils.copyDirectory(srcDir1, destDir1);
    } catch (IOException e) {
        e.printStackTrace();
    }
%>
	
	<script>
		alert("구단창설 되셨습니다.");
		location.href = "../index.jsp";
	</script>
	<%
	String p = "/gudan_page/" + me.getUserid();
	String e = "/gudan_page/" + me.getUserid() + "/images/mark.jpg";
	
	uc.pageInsert(gudan, p, e);
	umc1.updatePage(me.getUserid(), p);
	umc.updateClub(me.getUserid(), "3", gudan);
	me.setGrade("3");
	me.setGudan(gudan);
	%>
<% } %>