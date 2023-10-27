#programa notas (c) 2023 Hector Jose

import sqlite3 as bd                                                    #importo la libreria SQLite
import time                                                             #importo la libreria de tratamiento de fechas
import re                                                               #importo la libreria de expresiones regulares


conexion = bd.connect("notas.sqlite")                                   #Indico el nombre de la base de datos
cursor = conexion.cursor()                                              #Creo un cursor
#Sobre el cursor, ejecuto una peticón para crear una tabla en la base de datos en el caso de que no exista
cursor.execute("""
    CREATE TABLE IF NOT EXISTS 'notas'(
        'id' INTEGER,
        'texto' TEXT,
        'color' TEXT,
        'fecha' TEXT,
        PRIMARY KEY('id' AUTOINCREMENT)
    );
""")
#Sobre el cursor ejecuto una petición para crear una tabla de usuarios en el caso de que no exista
cursor.execute("""
    CREATE TABLE IF NOT EXISTS 'usuarios'(
        'id' INTEGER,
        'usuario' TEXT,
        'contrasena' TEXT,
        'email' TEXT,
        PRIMARY KEY('id' AUTOINCREMENT)
    );
""")

#Creditos input                 
print("Programa notas")                                                 #indico el nombre del programa
print("(c) 2023 Hector")                                                #indico el autor

class Nota:                                                             #Declaramos una clase
    def __init__(self,texto,color,fecha):                               #Metodo constructor
        self.texto = texto                                              #Creo una propiedad texto
        self.color = color                                              #Creo una propiedad color
        self.fecha = fecha                                              #Creo una propiedad fecha

usuario = "esta es mi primera nota"                                     #Creo un valor inicial para la variable
notas = []                                                              #Creo una lista vacia

print("introduce el usuario")                                           #Le digo al usuario lo que espero que haga
usuario = input()                                                       #Almaceno la entrada al usuario
print("el usuario es "+usuario)                                         #La muestro por pantalla
print("Introduce la contraseña")                                        #Le solicito al usuario la contraseña
contrasena = input()                                                    #Entrada de usuario
print("Introduce tu email")                                             #Le solicito al usuario el email
email = input()                                                         #Entrada de usuario

expresion = re.compile(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') #Creo una expresion regular para un correo electronico

if re.fullmatch(expresion,email):                                       #Valido el correo electronico del usuario
    print("Tu correo es valido")                                        #Le digo que es correcto
    cursor.execute("INSERT INTO usuarios VALUES(NULL,'"+usuario+"','"+contrasena+"','"+email+"');") #Inserto el usuario en la base de datos
    conexion.commit()                                                   #Ejecuto el comando

else:                                                                   #En caso contrario
    print("Eso no es un correo")                                        #Le digo que no es valido



for i in range(0,10):                                                   #Permito al usuario introducir varias notas    
    print("Introduce el contenido de la siguiente nota en la lista")    #Le digo al usuario lo que espero que haga
    entrada = input()                                                   #Capturo la entrada del usuario
    print("Introduce el color de la nota")                              #Le solicito al usuario el color de la nota
    color = input()                                                     #Capturo el color
   # print("Introduce la fecha de la nota")                              #Le solicito al usuario la fecha de la nota
    fecha = str(int(time.time()))                                                     #Capturo la fecha
    if entrada == "salir" or entrada == "exit":                         #Si lo que introduce es salir 
        break                                                           #Salgo del bucle
    else:                                                               #En caso contrario
        notas.append(Nota(entrada,color,fecha))                         #Añado una nueva nota vacia a la lista
        print("Has introducido una nueva nota")                         #Saco la entrada del usuario por pantalla

print("Saco el contenido de las notas ")                                #Imprimo la lista de notas
for i in notas:                                                         #Para cada una de las notas
    print(i.texto)                                                      #Imprimo su contenido
    print(i.color)                                                      #Imprimo su color
    print(i.fecha)                                                      #Imprimo su fecha
    cursor.execute("INSERT INTO notas VALUES(NULL,'"+i.texto+"','"+i.color+"','"+i.fecha+"');") #Inserto una a una las notas en la base de datos
    conexion.commit()                                                   #Ejecuto la insercion

