$(document).ready(function(){
	$('select').select2();
	$('body').on('DOMNodeInserted', 'select', function(){
		$(this).select2().on('select2:select', function(e){
			var data = e.params.data;
			console.log(data)
			var valorenviar = data.id
			var texto = data.text
			var tabla = $(this).parent().attr("tabla")
			var columna = $(this).parent().attr("columna")
			var Identificador = $(this).parent().attr("Identificador")
			console.log("voy a poner el valor "+valorenviar+" en la tabla "+tabla+", en la columna "+columna+" y en el Identificador "+Identificador)
			$("#ajax").load("inc/ajaxmodifica.php?valor="+valorenviar+"&tabla="+tabla+"&columna="+columna+"&Identificador="+Identificador)
			$(this).parent().html("<td><b>"+valorenviar+"</b> - "+texto+"</td>");
		});
	})
	$("td").dblclick(function(){
		if($(this).attr("externo") == "no"){
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
		}
		if($(this).attr("externo") == "si"){
			selector = $(this)
			var tabla = selector.attr("tablaexterna");
			var columna = selector.attr("columnaexterna");
			var claveexterna = selector.attr("claveexterna");
			//$(this).html("<select><option>asdf</option></select>")
			$(this).load("inc/ajaxvalores.php?tabla="+tabla+"&columna="+columna+"&claveexterna="+claveexterna);
			$('select').select2();
		}
	})
})