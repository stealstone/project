	function whenTab(tab) {
				if(tab == "01") {					
					document.getElementById("tab01").style.display = "";
					document.getElementById("tab02").style.display = "none";
					document.getElementById("tab_a01").className="_tab_title _no_title t1 on";
					document.getElementById("tab_a02").className="_tab_title _no_title t2";					
				} else if(tab == "02") {
					document.getElementById("tab01").style.display = "none";
					document.getElementById("tab02").style.display = "";
					document.getElementById("tab_a01").className="_tab_title _no_title t1";
					document.getElementById("tab_a02").className="_tab_title _no_title t2 on";
					
				} else if(tab == "03") {
					document.getElementById("tab03").style.display = "";
					document.getElementById("tab04").style.display = "none";
					document.getElementById("tab05").style.display = "none";					
					document.getElementById("tab_a03").className="_tab_title _no_title t1 on";
					document.getElementById("tab_a04").className="_tab_title _no_title t2";
					document.getElementById("tab_a05").className="_tab_title _no_title t3";				
				} else if(tab == "04") {
					document.getElementById("tab03").style.display = "none";
					document.getElementById("tab04").style.display = "";
					document.getElementById("tab05").style.display = "none";				
					document.getElementById("tab_a03").className="_tab_title _no_title t1";
					document.getElementById("tab_a04").className="_tab_title _no_title t2 on";
					document.getElementById("tab_a05").className="_tab_title _no_title t3";					
				} else if(tab == "05") {
					document.getElementById("tab03").style.display = "none";
					document.getElementById("tab04").style.display = "none";
					document.getElementById("tab05").style.display = "";					
					document.getElementById("tab_a03").className="_tab_title _no_title t1";
					document.getElementById("tab_a04").className="_tab_title _no_title t2";
					document.getElementById("tab_a05").className="_tab_title _no_title t3 on";					
				} 
			}
