<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.page import="Baseball.libs.utils.CharConversion" />
<jsp:directive.page import="Baseball.libs.model.GudanBean" />
<jsp:directive.page import="Baseball.libs.model.MemberBean" />
<jsp:useBean id="sc1" class="Baseball.libs.control.SelectGudanController" /> 
<%
 	String gname1 = request.getParameter("gname");
	String gname = CharConversion.entoutf8(gname1);
	MemberBean me = (MemberBean)session.getAttribute("me");
	GudanBean gb = sc1.getGudan(gname);
	if(gb != null){
		if(me.getGrade().equals("3") && gb.getGudan().equals(me.getGudan())){
		String str = "<script> window.open('..";
		str += gb.getGpage() + "/gudanview_admin.jsp?gname=" + gb.getGudan();
		str += "','_blank','location=no, directories=no,resizable=no,status=no,";
		str += "toolbar=no,menubar=no, width=990,height=745,left=0, top=0, scrollbars=yes');";
		str += "</script>";
		out.println(str);
		}
		else{
			String str = "<script> window.open('..";
			str += gb.getGpage() + "/gudanview_mem.jsp?gname=" + gb.getGudan();
			str += "','_blank','location=no, directories=no,resizable=no,status=no,";
			str += "toolbar=no,menubar=no, width=990,height=745,left=0, top=0, scrollbars=yes');";
			str += "</script>";
			out.println(str);
		}
	}else{
		System.out.println(gb);
		String strError = "";
		strError += "<script>";
		strError += "alert('찾으시는 구단이 없습니다.');";
		strError += "</script>";
		out.println(strError);
	}
%>
	