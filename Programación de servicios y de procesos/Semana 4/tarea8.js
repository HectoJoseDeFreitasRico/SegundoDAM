var id;																//originalmente le asigno un identificador a este objeto
var otros;															// asigno una variable que recibira la coleccion de datos que corresponde a los otros objetos
var comida;															//asigno una variabble que correspondera a la coleccion de datos que corresponde a la comida
onmessage = function(datos){										//esta funcion se ejecuta cuando recibo un mensaje
	id = datos.data.id;												//mi identificador es el que le pasa a la funcion principal
	otros = datos.data.otros										// recojo los datos de los otros objetos y los pongo dentro de la variable
	comida = datos.data.comida										// recojo los datos de la comida y los pongo en la variable
	//console.log(otros)
}

var temporizador;													//como en un momento voy a tener un bucle, arranco una variable temporizador
inicio();															// llamo a la funcion de inicio que se ejecuta una vez
var posx = Math.random()*512										// cuando el personaje nace, le aplico una posicion x aleatoria
var posy = Math.random()*512										// cuando el personaje nace, le aplico una posicion y aleatoria
var cr = Math.round(Math.random()*256);								// le pongo un color rojo aleatorio
var cg = Math.round(Math.random()*256);								//le pongo un color verde aleatorio
var cb = Math.round(Math.random()*256);								//le pongo un color azul aleatorio
var tam = 2;														//le pongo un tamaño inicial de dos que luego ya cambiaremos
var direccion = Math.random()*Math.PI*2								//le doy una direccion inicial aleatoria entre 0 y 360º
var velocidad = Math.random()/2+0.3									// le doy una velocidad inicial aleatoria
var energia = Math.random()*50+50;									// le proporciono una energia inicial aleatoria		
var hambre = 100-Math.random()*50+50;								// le doy una cantidad inicial de hambre aleatoria
var muerto = false;													// cuando el personaje arranca por defecto no esta muerto
var dormido = false;												// cuando el personaje arranca por defecto no esta dormido
var hambriento = false;												// cuando el personaje arranca por defecto no esta hambriento

function inicio(){													// ejecuto la funcion de inicio													
	temporizador = setTimeout("bucle()", 1000)						// la funcion de inicio de momento lo unico que hace es llamar al bucle
}

function colisionabordes(){											// esta funcion busca los bordes y conecta las colisiones
	if(posx  < 0 || posx > 512 || posy < 0 || posy > 512){			// si es cierto que el personaje esta fuera de los rangos de la imagen
		direccion += Math.PI;										// en ese caso el personaje pega la vuelta
	}
}

function mueve(){													// esta funcion se encarga de gestionar el movimiento del personaje
	posx += Math.cos(direccion)*velocidad*3							// actualizamos la posicion x en base al coseno trigonometrico de la direccion por la velocidad
	posy += Math.sin(direccion)*velocidad*3							// actualizamos la posicion y en base al coseno trigonometrico
	energia-=0.1;													// cuando el personaje se esta moviendo inevitablemente pierde un poco de energia
	hambre+=0.1;													// y cuando el personaje se esta moviendo gana un poquito de hambre
}

function cambiadireccion(){											// esta funcion controla que el personaje vaya cambiando poco a poco de direccion
	direccion += (Math.random()-0.5)/4								// le añadimos un pequeño componente aleatorio al angulo de direccion del personaje 
	//posx += Math.cos(direccion)*velocidad*3
	//posy += Math.sin(direccion)*velocidad*3
}

function buscocomida(){												// esta funcion se encarga de la busqueda de comida
	if(hambriento == true){											// solo se ejecuta en el caso que el personaje este hambriento
		//console.log(hambre);
		for(var i = 0;i<comida.length;i++){							// miramos donde estan todos los comederos
			var a = posx - comida[i].x;								// para cada uno de los comederos sacamos la distancia en horizontal
			var b = posy - comida[i].y;								// sacamos a continuacion la distacia vertical
			var distancia = Math.sqrt( a*a + b*b);					// y mediante esta formula calculamos el modulo de la distancia
			if(distancia < 50){										// en el caso que la distancia sea menor que 50, es decir, cerca
				var angleRadians = Math.atan2(comida[i].y - posy, comida[i].x - posx);	//me dirijo hacia ese comedero
				direccion = angleRadians;							// actualizo mi angulo
				if(distancia < 10){									// y en el caso de que la distancia sea poca
					hambre -=0.7;									// rebajo mi cantidad de hambre, lo que quiere decir ess que estoy comiendo
				}
			}
		}
	}
}

function evitarse(){												// esta funcion gestiona que los personajes se eviten entre si
	for(var i = 0;i<otros.length;i++){								// mira donde estan todos y cada uno del resto de personajes
		var a = posx - otros[i].x;									// sacamos la distancia en horizontal 
		var b = posy - otros[i].y;									// sacamos la distancia en vertical
		var distancia = Math.sqrt( a*a + b*b);						// para cada uno de los personajes miro mi distancia con respecto a ellos
		if(distancia < 5 && otros.id != id && distancia > 3 && hambriento == false){		// y en el caso de que el personaje este cerca
			var angleRadians = Math.atan2(posy - comida[i].y, posx - comida[i].x);			// busco el angulo de escape
			direccion = angleRadians+Math.PI/2						// y lo aplico a mi angulo 
			posx += Math.cos(direccion)*velocidad*3					// actualizo mi posicion x con respecto a ese nuevo angulo
			posy += Math.sin(direccion)*velocidad*3					// actualizo mi posicion y con respecto a ese nuevo angulo
			tam = 5 												// y temporalmente cambia mi tamaño simplemente para que se sepa que he colisionado
		}
	}
}

function duerme(){													// esto es lo que ocurre cuando el personaje duerme
	energia+=0.7;													// su energia se recupera
	hambre-=0.1;													// pero cuidado porque su hambre tambien sube
}

function muerte(){													// esto es lo que ocurre cuando muere
	if(hambre > 100){
		muerto = true;												//por defecto la variable muerte se pone verdadero
		cr = 0;														//su color se vuelve negro
		cg = 0;
		cb = 0;
	}
}

function bucle(){													// esta es la funcion bucle que se ejecuta constantemente
	if(hambre < 0){hambre = 0}										// no es posible tener hambre negativa
	if(energia > 100){energia = 100}								// no es posible tener mas de  puntos de energia
	if(muerto == false){											// si el personaje esta vivo
		buscocomida();												// activamos la funcion busqueda de comida
		tam = energia/10;											// su tamaño esta en funcion a su energia
		colisionabordes();											// activamos la funcion de colision de bordes
		cambiadireccion();											// activamos la funcion de cambio de direccion
		if(energia < 20){dormido = true;}							// si el personaje tiene poca energia se queda dormido
		if(dormido == true){duerme();}								// si el personaje esta dormido se ejecuta la funcion dormir
		if(energia > 80){dormido=false;}							// si la energia del personaje esta por encima de 80 deja de dormir
		if(dormido == false){mueve();}								// si el personaje ya no esta dormido se puede mover
		if(hambre > 80){hambriento = true}							// si el nombre dle personje esta por encima de 80 quiere decir que estaba hambriento
		if(hambre < 20){hambriento = false;direccion = Math.random()*Math.PI*2;}	// si el hombre esta por debajo de 20 deja de estar hambriento
		evitarse();													// activamos la funcion de evitarse
	}
	postMessage({id:id,x:posx,y:posy,mir:cr,mig:cg,mib:cb,tam:tam})	// pasamos a la funcion principal los datos del personaje
	clearTimeout(temporizador)										// limpiamos el temporizador anterior
	temporizador = setTimeout("bucle()", 33)						// y creamos un temporizador recursivo que se llama asimismo para hacer otra vuelta del bucle
}