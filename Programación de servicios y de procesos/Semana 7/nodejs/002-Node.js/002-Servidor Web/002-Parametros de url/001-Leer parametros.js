var servidor = require('http');
var ruta = require('url');

servidor.createServer(function(req,res){
	res.writeHead(200,{'Content-Type':'text/html'});
	var parametros = ruta.parse(req.url,true).query;
	res.write("Tu nombres es: "+parametros.nombre);
	res.end("");
}).listen(8080)