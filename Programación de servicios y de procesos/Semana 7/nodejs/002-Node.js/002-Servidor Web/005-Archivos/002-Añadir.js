var archivos = require('fs');
archivos.appendFile("nuevo.txt","Este es el contenido\n",function(err){
	if(err) throw err;
	console.log("mision cumplida");
})