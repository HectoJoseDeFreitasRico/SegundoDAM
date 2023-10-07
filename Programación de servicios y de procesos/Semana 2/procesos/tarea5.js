onmessage = function(datos){
	//Calculo 1
	console.log(datos);
	console.log("tu edad es "+datos.data.edad);
	console.log("tu nombre es "+datos.data.nombre);
	//Calculo 1
	console.log("vamos con un calculo")
	var numero = 0.000000423343;
	var iteraciones = 10000000000;
	for(var i = 0;i<iteraciones;i++){
		numero = numero*1.00000000000005435;
				
	}
postMessage(numero)
}