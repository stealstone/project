function postcheck(){
	 cw=screen.availWidth;     //화면 넓이
	 ch=screen.availHeight;    //화면 높이

	 sw=620;    //띄울 창의 넓이
	 sh=180;    //띄울 창의 높이

	 ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	 mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
	 
	 window.open("../member/zipsearch.jsp", "_blank", 
			 		"width="+sw+", height="+sh+",top="+mt+",left="+ml);
}