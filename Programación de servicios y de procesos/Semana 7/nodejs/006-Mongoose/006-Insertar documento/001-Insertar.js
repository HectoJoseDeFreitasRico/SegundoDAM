var mongoose = require('mongoose');
//Me conecto a MongoDB
const conexion = 'mongodb://127.0.0.1/contacto';
//Creo esquema para recuperar los datos en el formato correcto
const formularioSchema = new mongoose.Schema({
	nombre:String,
	asunto:String,
	mensaje:String,
	fecha:String
})
//Creo el formulario
const Formulario = mongoose.model("Formulario",formularioSchema)
const NuevoFormulario = new Formulario({
	nombre:"Jose",
	asunto:"Este es el quinto correo",
	mensaje:"Este es el mensaje",
	fecha:"03-02-2024"
})
mongoose.connect(conexion, {
	useNewUrlParser:true,
	useUnifiedTopology:true
	//Muestro la informacion
}).then(function(){
	console.log("conectado a mongo");
	NuevoFormulario.save().then(function(){
		console.log("Insertado")
	})
})

