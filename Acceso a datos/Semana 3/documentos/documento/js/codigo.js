$(document).ready(function(){
	$("#tipotexto").change(function(){
		$("#pagina").append("<"+$(this).val()+">"+$(this).val()+"</"+$(this).val()+">");
					
	})
				
	$("#selectfont").change(function(){
		$("#pagina").append("<span style='font-family:"+$(this).val()+"'>"+$(this).val()+"</span>");
	})
				
	$("#fontsize").change(function(){
		$("#pagina").append("<span style='font-size:"+$(this).val()+"px'>"+$(this).val()+"</span>");
	})
				
	$("#bold").click(function(){
		$("#pagina").append("<span style='font-weight:bold'>Negrita</span>");
	})
				
	$("#cursive").click(function(){
		$("#pagina").append("<span style='font-style:italic'>Cursiva</span>");
	})
				
	$("#underline").click(function(){
		$("#pagina").append("<span style='text-decoration:underline'>Subrayado</span>");
	})
	
	$("#orderedlist").click(function(){
		$("#pagina").append("<ol><li></li></ol>");
	})
	
	$("#unorderedlist").click(function(){
		$("#pagina").append("<ul><li></li></ul>");
	})
				
	$("#fontcolor").change(function(){
		$("#pagina").append("<span style='color:"+$(this).val()+"'>"+$(this).val()+"</span>");
	})
	
	$("#alignleft").click(function(){
		$("#pagina").append("<div style='text-align:left'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</div>");
	})
	
	$("#alignright").click(function(){
		$("#pagina").append("<div style='text-align:right'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</div>");
	})
	
	$("#aligncenter").click(function(){
		$("#pagina").append("<div style='text-align:center'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</div>");
	})
	
	$("#alignjustify").click(function(){
		$("#pagina").append("<div style='text-align:justify'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</div>");
	})
				
	$("#guardar").click(function(){
		$.ajax({
			url: "guarda.php",
			data: {datos: $("#pagina").html(),nombredocumento:$("#documentname").val()},
			type: "POST",
			success: function(result){
			}
		})
	})
})