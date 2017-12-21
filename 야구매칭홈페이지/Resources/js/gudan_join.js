function gudanjoinOk(evt){
	var Write = document.test;
	
	if (!Write.markupload.value) {
		alert("엠블럼을 넣으세요.");
		Write.markupload.focus(); 
		return false;
    }
	
	if (!Write.gudan_name.value) {
		alert("구단명을 입력하세요.");
		Write.gudan_name.focus(); 
        return false;
	}
	//alert(Write.flag.value);
	/*if(Write.flag.value == "true"){
		alert("구단명 중복확인을 체크를 해주세요");		
        return false;
	}*/

	if (!Write.zip.value) {
		alert("연고지를 입력하세요.");
		Write.zip.focus(); 
		return false;
    }

	if (!Write.detail.value) {
		alert("구단 소개를 입력하세요.");	
		Write.detail.focus();
		return false;
    }

	Write.submit();	
}