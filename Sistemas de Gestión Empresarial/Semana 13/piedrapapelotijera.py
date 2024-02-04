import random

print("Piedra, papel o tijera, v0.02")
def bucle():
    print("1 = piedra ")
    print("2 = papel ")
    print("3 = tijera ")
    tirada = int(input("escoge tu tirada: "))

    tiradaordenador = random.randint(1,3)

    if tiradaordenador == 1:
        print("El ordenador a sacado piedra")
    elif tiradaordenador == 2:
        print("El ordenador a saca papel")
    elif tiradaordenador == 3:
        print("El ordenador ha sacado tijera")

    if tirada == 1 and tiradaordenador == 1:
        print("Empate")
    elif tirada == 3 and tiradaordenador == 3:
        print("Empate")
    elif tirada == 2 and tiradaordenador == 2:
        print("Empate")
    elif tirada == 1 and tiradaordenador == 2:
        print("Pierde el jugador")
    elif tirada == 2 and tiradaordenador == 3:
        print("Pierde el jugador")
    elif tirada == 3 and tiradaordenador == 1:
        print("Pierde el jugador")
    elif tirada == 1 and tiradaordenador == 3:
         print("Jugador gana")
    elif tirada == 2 and tiradaordenador == 1:
         print("Jugador gana")
    elif tirada == 3 and tiradaordenador == 2:
        print("Jugador gana")
    bucle()
bucle()
