from hdb_conector import Hdb

Conexion1 = Hdb("miempresa")
Conexion1.insert("clientes","cliente10","Este es otro contenido de prueba")
