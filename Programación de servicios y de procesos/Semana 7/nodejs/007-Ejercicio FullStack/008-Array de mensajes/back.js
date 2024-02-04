var servidor = require('http');
var ruta = require('url');
var archivos = require('fs');
var procesador = require('querystring');
var mensajes = []

servidor.createServer(function(req,res){res.writeHead(200,{'ContentType':'text/html'});			
		if(req.url == "/"){
			console.log("principal");
			archivos.readFile('front.html',function(err,data){
				if(err) throw err;
				res.end(data);
			});
		}else if(req.url == "/recibe"){
			console.log("recibe");
		}else if(req.url.includes("/envia")){
			console.log("envia");
			var parametros = ruta.parse(req.url,true).query;
			console.log(parametros.mensaje)
			var fechaformateada = Date.now();
			mensajes.push({fecha:fechaformateada,mensaje:parametros.mensaje});
			console.table(mensajes);
			res.end("");
	}
}).listen(8080)