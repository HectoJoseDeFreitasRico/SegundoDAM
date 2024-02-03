fun main(){
    val nombre:String = "Juan Luis"
    val nombre2:String = "Juan Luis"
    val solo_nombre:String = "Luis"
    val apellidos:String = "Lopez Marti"
    println(nombre.length)
    println(nombre.uppercase())
    println(nombre.lowercase())
    println(nombre.compareTo(nombre2))
    println(nombre.indexOf(solo_nombre))
    println(nombre+" "+apellidos)
    println(nombre.plus(apellidos))
    println("Mi nombre es:  $nombre $apellidos")

}