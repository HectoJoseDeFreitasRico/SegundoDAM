/*En la funcion de inicia cargamos todas las condiciones iniciales del juego*/
function inicio(){
	/*Creo una instancia del objeto personaje de los elementos de la coleccion*/
	for(var i = 0;i<numeropersonajes;i++){
		arraypersonajes[i] = new Personaje;
}
	/*Ahora lanzo la ejecucion del bucle*/
	temporizador = setTimeout("bucle()",1000);
	
	/*Este bloque de codigo define que es lo que ocurre cuando el protagonista pulsa las teclas de direccion*/
	$(document).keydown(function(e){
		if(e.key == "w"){direccion = 1;}
		if(e.key == "s"){direccion = 2;}
		if(e.key == "a"){direccion = 3;}
		if(e.key == "d"){direccion = 4;}
	})
	/*Esto ocurre cuando se despulsa las teclas de direccion*/
	$(document).keyup(function(e){
		if(e.key == "w"){direccion = 0;}
		if(e.key == "s"){direccion = 0;}
		if(e.key == "a"){direccion = 0;}
		if(e.key == "d"){direccion = 0;}
	})
	/*Cuando la ventana se reescala, calculamos de nuevo las proporciones de los contenedores en base a la ventana*/
	$(window).resize(function(){
		anchuranavegador = window.innerWidth;
		alturanavegador = window.innerHeight;
		document.getElementById("lienzo").height = alturanavegador;
		document.getElementById("lienzo").width = anchuranavegador;
		document.getElementById("fondo").height = alturanavegador;
		document.getElementById("fondo").width = anchuranavegador;
		document.getElementById("contenedor").height = alturanavegador;
		document.getElementById("contenedor").width = anchuranavegador;
	})
	
}