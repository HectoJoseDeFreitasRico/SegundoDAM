from PIL import Image
import os
import json

carpeta = "001-crudo"
carpetasalida = "002-procesadas"
imagenes = []

archivos = os.listdir(carpeta)

for archivo in archivos:
    imagen = os.path.join(carpeta,archivo)
    print(imagen)
    miimagen = Image.open(imagen)
    anchura = miimagen.width
    altura = miimagen.height
    if altura > altura:
        caja = (
             altura/2-anchura/2,
             0,
             altura/2+anchura/2,
             altura
             )
    else:
        caja = (
            0,
             altura/2-anchura/2,
             anchura,
             altura/2+anchura/2
             )
    cortada = miimagen.crop(caja)
    escalada = cortada.resize((512,512))
    escalada.save(carpetasalida+"/"+archivo)
    imagenes.append(archivo)

archivojson = open("json/imagenes.json","w")
json.dump(imagenes,archivojson)
archivojson.close()
