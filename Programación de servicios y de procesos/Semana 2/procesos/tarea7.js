onmessage = function(datos){

		//console.log(datos);
		var destino = 0;
		//recorro los pixeles uno a uno
		for(var i = 0;i<datos.data.px.data.length-8;i+=4){
		//en principio supongo que no hay un borde en el pixel que estoy registrando
			var borde = false;
			//para cada uno de los pixeles compruebo si hay mucha diferencia de color o no la hay
			//pixel arriba izquierda
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i-(datos.data.mianchurabucket*4)-4]) > datos.data.miumbral){borde = true;}	
			//pixel arriba 
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i-(datos.data.mianchurabucket*4)]) > datos.data.miumbral){borde = true;}	
			//pixel arriba derecha
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i-(datos.data.mianchurabucket*4)+4]) > datos.data.miumbral){borde = true;}
			//pixel izquierda
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i-4]) > datos.data.miumbral){borde = true;}
			//pixel derecha
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i+4]) > datos.data.miumbral){borde = true;}	
			//pixel abajo izquierda
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i+(datos.data.mianchurabucket*4)-4]) > datos.data.miumbral){borde = true;}
			//pixel abajo 
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i+(datos.data.mianchurabucket*4)]) > datos.data.miumbral){borde = true;}
			//pixel abajo derecha
			if(Math.abs(datos.data.px.data[i] - datos.data.px.data[i+(datos.data.mianchurabucket*4)+4]) > datos.data.miumbral){borde = true;}	
			//en caso de que haya borde, pinto de negro
			if(borde == true){
				datos.data.pxdestino.data[i] = 0;
				datos.data.pxdestino.data[i+1] = 0;
				datos.data.pxdestino.data[i+2] = 0;
				datos.data.pxdestino.data[i+3] = 255;
				//en caso de que no haya un border, pinto blanco
			}else{
				datos.data.pxdestino.data[i] = 255;
				datos.data.pxdestino.data[i+1] = 255;
				datos.data.pxdestino.data[i+2] = 255;
				datos.data.pxdestino.data[i+3] = 255;
				}
			}
		json = {mix:datos.data.mix,miy:datos.data.miy,resultado:datos.data.pxdestino,miidworker:datos.data.idworker}
		postMessage(json)
}