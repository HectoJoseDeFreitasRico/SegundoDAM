var archivos = require('fs');
archivos.writeFile("nuevo.txt","Este es el contenido 2\n",function(err){
	if(err) throw err;
	console.log("mision cumplida");
})