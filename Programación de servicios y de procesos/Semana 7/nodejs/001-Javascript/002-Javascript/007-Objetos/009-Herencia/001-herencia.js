class Animal{
	contructor(){
		
	}
	respira(){
		return "Este animal respira";
	}
}

class Persona extends Animal{
	constructor(){
		super();
		this.edad = 0;
		this.nombre = "";
	}
	setEdad(nuevaedad){
		this.edad = nuevaedad;
	}
	getEdad(){
		return this.edad;
	}
	setNombre(nuevonombre){
		this.nombre = nuevonombre;
	}
	getNombre(){
		return this.nombre;
	}
	saluda(){
		return "Hola me llamo "+this.nombre+" y tengo "+this.edad;
	}
}

var persona1 = new Persona();
persona1.setEdad(45);
persona1.setNombre("Luis");
console.log(persona1);
console.log(persona1.saluda());
console.log(persona1.respira());