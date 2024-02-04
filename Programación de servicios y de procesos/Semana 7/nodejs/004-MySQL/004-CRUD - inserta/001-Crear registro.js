var mysql = require('mysql');
//npm install mysql

var conexion = mysql.createConnection({
	host:"localhost",
	user:"nodejs",
	password:"nodejs",
	database:"nodejs"
});

conexion.connect(function(err){
	if(err) throw err;
	console.log("Conectado");
	conexion.query(`
					INSERT INTO entradas VALUES(
						NULL,
						'Titulo de la entrada',
						'Texto de la entrada',
						'03-02-2024'
					)
		`,function(err,result){
		if(err) throw err;
		console.log("Se han insertado los registros");
	})
})