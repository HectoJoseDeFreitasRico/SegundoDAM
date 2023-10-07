onmessage = function(){
	//Calculo1
			console.log("vamos con el calculo 1")
			var numero = 0.000000423343;
			var iteraciones = 10000000000;
			for(var i = 0;i<iteraciones;i++){
				numero = numero*1.00000000000005435;
				
			}
postMessage(numero)
}