var archivos = require('fs');
archivos.unlink("cambio.txt",function(err){
	if(err) throw err;
	console.log("mision cumplida");
})