function logout(){
	var ok = confirm("정말 로그아웃 하시겠습니까?");
	
	if(ok){
		document.logoutform.submit();
	}
	
}