function back() {
		location.href="memolist.jsp?page=1";
}

function memoOk(evt){
	var Write = document.memowrite_form;
	
	if (!Write.receive.value) {
		alert("아이디를 입력하세요.");
		Write.receive.focus(); 
        return false;
	}
	
	if(Write.flag.value == "true"){
		alert("아이디를 체크를 해주세요");		
        return false;
	}	
	
	if (!Write.detail.value) {
		alert("내용을 입력 해주세요.");
		Write.detail.focus(); 
		return false;
    }		

	Write.submit();	
}

function memoreOk(evt){
	var Write = document.memowrite_form;
		
	if (!Write.detail.value) {
		alert("내용을 입력 해주세요.");
		Write.detail.focus(); 
		return false;
    }		

	Write.submit();	
}

function receiveCheck(){
	var receiveid = document.getElementById("receive").value;
	
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=380;    //띄울 창의 넓이
	sh=100;    //띄울 창의 높이

	ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	 	 
	var list = "width="+sw+", height="+sh+",top="+mt+",left="+ml;
	
	window.open("receivecheck.jsp?receiveid=" + receiveid, "_blank", list);
}