fun main(){
    val gato = Gato()
    println(gato.mamo())
}

open class Mamifero(){
    fun mamo():String{
        return "Este animal mama al nacer"
    }
}

class Gato :Mamifero(){
    fun maulla():String{
        return "Soy un gato y maullo"
    }
}
