$(document).ready(function(){
	console.log("pagina lista");
	$("td").dblclick(function(){
		$(this).attr('contenteditable','true').blur(function(){
			selector = $(this)
			console.log("salgo");
			selector.attr('contenteditable','false');
			var valorenviar = selector.text();
			var tabla = selector.attr("tabla");
			var columna = selector.attr("columna");
			var Identificador = selector.attr("Identificador");
			
			console.log("voy a poner el valor "+valorenviar+" en la tabla "+tabla+", en la columna "+columna+" y en el Identificador "+Identificador);
			$("#ajax").load("inc/ajaxmodifica.php?valor="+valorenviar+"&tabla="+tabla+"&columna="+columna+"&Identificador="+Identificador)
		})
	})
})