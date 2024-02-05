from PIL import Image
import os

carpeta = "001-crudo"

archivos = os.listdir(carpeta)
print(archivos)
for archivo in archivos:
    imagen = os.path.join(carpeta,archivo)
    
