function whenGudantab(tab){
 		if(tab == "01"){ 			
 			document.getElementById("gudantab01").style.display = "";
			document.getElementById("gudantab02").style.display = "none";
			document.getElementById("gudantab03").style.display = "none";
			document.getElementById("gudantab04").style.display = "none";
			document.getElementById("gudantab_a01").className="on";
			document.getElementById("gudantab_a02").className="";
			document.getElementById("gudantab_a03").className="";
			document.getElementById("gudantab_a04").className="";
 		} else if(tab == "02") {
 			document.getElementById("gudantab01").style.display = "none";
			document.getElementById("gudantab02").style.display = "";
			document.getElementById("gudantab03").style.display = "none";
			document.getElementById("gudantab04").style.display = "none";
			document.getElementById("gudantab_a01").className="";
			document.getElementById("gudantab_a02").className="on";
			document.getElementById("gudantab_a03").className="";
			document.getElementById("gudantab_a04").className="";
 		} else if(tab == "03") {			
 			document.getElementById("gudantab01").style.display = "none";
			document.getElementById("gudantab02").style.display = "none";
			document.getElementById("gudantab03").style.display = "";
			document.getElementById("gudantab04").style.display = "none";
			document.getElementById("gudantab_a01").className="";
			document.getElementById("gudantab_a02").className="";
			document.getElementById("gudantab_a03").className="on";
			document.getElementById("gudantab_a04").className="";
 		} 	else if(tab =="04"){
 			document.getElementById("gudantab01").style.display = "none";
			document.getElementById("gudantab02").style.display = "none";
			document.getElementById("gudantab03").style.display = "none";
			document.getElementById("gudantab04").style.display = "";
			document.getElementById("gudantab_a01").className="";
			document.getElementById("gudantab_a02").className="";
			document.getElementById("gudantab_a03").className="";
			document.getElementById("gudantab_a04").className="on";
 			
 		}
 }