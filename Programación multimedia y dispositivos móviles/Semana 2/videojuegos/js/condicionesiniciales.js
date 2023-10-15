/* Capturamos el lienzo y lo introduciomos dentro de una variable contexto */
var contexto = document.getElementById("lienzo").getContext("2d");
/*Aqui voy a declarar las variables globales a todo el programa*/
var temporizador;
var anchuranavegador = window.innerWidth;
var alturanavegador = window.innerHeight;
document.getElementById("lienzo").height = alturanavegador;
document.getElementById("lienzo").width = anchuranavegador;
document.getElementById("fondo").height = alturanavegador;
document.getElementById("fondo").width = anchuranavegador;
document.getElementById("contenedor").height = alturanavegador;
document.getElementById("contenedor").width = anchuranavegador;
/*En esta zona vamos a cargar las imagenes que vamos a utilizar en el videojuego*/
var imagennpc1 = new Image();
imagennpc1.src = "img/personajerojo.png";
var imagenpersonaje = new Image();
imagenpersonaje.src = "img/personajeverde.png";

/*Introduzco la lista de los personajes*/
var numeropersonajes = 100;
var arraypersonajes = new Array();

//PROPIEDADES PROTAGONISTAS
var posx = 0;
var posy = 0;
var estadoanimacion = 0;
var angulo = 0;
var velocidad = 6;
var direccion = 0;
/*Aqui introducimos las condiciones minimas y maximas del terreno en el cual se moveran los npcs*/
var terrenox1 = 600;
var terrenoy1 = -200;
var terrenox2 = 1400;
var terrenoy2 = 600;
