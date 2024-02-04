var servidor = require('http');

servidor.createServer(function(req,res){
	res.writeHead(200,{'Content-Type':'text/html'});
	res.write("<h1>Hola mundo desde Node.js</h1>");
	switch(req.url){
		case "/":
			res.end("Esta es la pagina principal");
			break;
		case "/sobremi":
			res.end("Esta en la pagina sobre mi");
			break;
		case "/contacto":
			res.end("Estas en la pagina de contacto");
			break;
		default:
			res.end("Pagina no encontrada");
	}
	console.log("Alguien ha cargado la web");
}).listen(8080)