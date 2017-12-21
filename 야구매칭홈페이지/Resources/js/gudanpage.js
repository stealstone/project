function gudanPage(){
	window.open("../gudan/gudanpage.jsp", "_blank",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=990,height=745,left=0, top=0, scrollbars=yes');
}

function gudanPage1(gname){
	alert(gname);
	window.open("../common/gudanpage1.jsp?gname=" + gname, "_blank",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=990,height=745,left=0, top=0, scrollbars=yes');
}