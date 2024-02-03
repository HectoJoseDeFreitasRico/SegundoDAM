fun main(){
    val persona1 = Persona4("Jose","Lopez",45)
    val persona2 = Persona4("Juan","Lopez",65)
    println( persona1.saluda())
}

class Persona4(nombre:String,apellidos:String,edad:Int){
    fun saluda(): String {
        return "Hola que tal me llamo"
    }
}