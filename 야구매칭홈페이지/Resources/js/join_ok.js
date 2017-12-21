function joinOk(evt){
	var Write = document.joinForm;
	
	if (!Write.join_userid.value) {
		alert("아이디를 입력하세요.");
		Write.join_userid.focus(); 
        return false;
	}
	//alert(Write.flag.value);
	if(Write.flag.value == "true"){
		alert("아이디를 체크를 해주세요");		
        return false;
	}

	if (!Write.join_passwd.value) {
		alert("비밀번호를 입력하세요.");
		Write.join_passwd.focus(); 
		return false;
	}else if(Write.join_passwd.value.length < 10){
		alert("비밀번호를 10자리 이상 입력하세요.");
		Write.join_passwd.focus(); 
		return false;
	}
	
	if(!Write.join_repasswd.value){
		alert("비밀번호 확인을 입력하세요.");
		Write.join_repasswd.focus(); 
		return false;
	}else if(Write.join_repasswd.value != Write.join_passwd.value){
		alert("비밀번호 확인이 다릅니다. 다시 입력하세요");
		Write.join_repasswd.focus(); 
		return false;
	}

	if (!Write.join_name.value) {
		alert("이름을 입력하세요.");
		Write.join_name.focus(); 
		return false;
    }

	if (!Write.join_address.value) {
		alert("주소를 입력하세요.");		
		return false;
    }
	
	if (!Write.join_tel.value) {
		alert("전화번호를 입력하세요.");
		Write.join_tel.focus(); 
		return false;
    }
	
	if (!Write.join_email1.value) {
		alert("이메일을 입력하세요.");
		Write.join_email1.focus(); 
		return false;
    }	
	
	if (Write.join_birthday.value.length < 1) {
		alert("생년월일을 입력하세요.");
		Write.join_birthday.focus(); 
		return false;
    }		

	Write.submit();	
}

function idCheck(){
	var userid = document.getElementById("join_userid").value;
	
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=320;    //띄울 창의 넓이
	sh=200;    //띄울 창의 높이

	ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	 	 
	var list = "width="+sw+", height="+sh+",top="+mt+",left="+ml;
	
	window.open("idcheck.jsp?userid=" + userid, "_blank", list);
}