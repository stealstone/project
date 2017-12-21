function login(){
	var log = document.forms[0];
	
	if (!log.userid.value) {
		alert("아이디를 입력하세요.");
		Write.userid.focus(); 
        return false;
	}
	
	if(!log.pass.value){
		alert("비밀번호를 입력하세요.");		
        return false;
	}
	
	log.submit();
}

function logincheck(){	
	alert("로그인 해주세요.");    
}