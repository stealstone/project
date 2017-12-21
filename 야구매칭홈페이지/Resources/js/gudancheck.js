function gcheck(){
	var gname = document.getElementById("gudan").value;
		$.get('./searchgudan.jsp?gname=' + gname, function(data){
			$('#divR').html(data);
		});	
		
} 