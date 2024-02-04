function saluda(nombre,edad,email){
	cadena = "";
	cadena += "Me llamo "+nombre+"\n";
	cadena += "Tengo "+edad+" años\n";
	cadena += "Mi correro es "+email+"\n";

	return cadena;
}
console.log(saluda("Juan",45,"a@a.com"));
console.log(saluda("Luis",65,"b@b.com"));
console.log(saluda("Manolo",12,"c@c.com"));

