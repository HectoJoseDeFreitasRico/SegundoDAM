fun main(){
    val persona = Persona2()
    persona.nombre = "Juan"
    persona.apellidos = "Lopez"
    persona.edad = 61

    val persona2 = Persona2()
    persona.nombre = "Jorge"
    persona.apellidos = "Martinez"
    persona.edad = 15

    println(persona.nombre)
    println(persona2.nombre)
}

class Persona2{
    var nombre:String = ""
    var apellidos:String = ""
    var edad:Int = 0
}