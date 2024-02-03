window.onload=function(){
    document.getElementById("empezar").onclick = function(){
        let tiradajugador = document.getElementsByName("jugador");
        let seleccionado = null;

        for(let radio of tiradajugador){
            if(radio.checked){
                seleccionado = radio.value
                break;
            }
        }
        if(seleccionado != null){
            console.log(seleccionado)
        }

        let aleatorio = Math.floor(Math.random()*3)

        switch(aleatorio){
            case 0:tiradamaquina = "piedra";break;
            case 1:tiradamaquina = "papel";break;
            case 2:tiradamaquina = "tijera";break;
        }
       document.getElementById("tiradamaquina").innerHTML = "Maquina tira: " + tiradamaquina;

       if(seleccionado == "piedra" && tiradamaquina == "piedra"
       || seleccionado == "papel" && tiradamaquina == "papel"
       || seleccionado == "tijera" && tiradamaquina == "tijera"){

            document.getElementById("resultado").innerHTML = "Empate"

       }else if(seleccionado == "piedra" && tiradamaquina == "tijera"
       || seleccionado == "papel" && tiradamaquina == "piedra"
       || seleccionado == "tijera" && tiradamaquina == "papel"){

            document.getElementById("resultado").innerHTML = "El jugador gana"

       }else if(seleccionado == "papel" && tiradamaquina == "tijera"
           || seleccionado == "piedra" && tiradamaquina == "papel"
           || seleccionado == "tijera" && tiradamaquina == "piedra"){
                document.getElementById("resultado").innerHTML = "La maquina gana"
       }
    }
}