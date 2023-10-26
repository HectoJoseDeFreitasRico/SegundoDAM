from PIL import Image
from PIL import Image

img = Image.new('RGBA', (30,30), color = 'black')

texto = "¿Cuál es el mejor whisky del mundo? -El mejor del mundo es el Blue Label de Johnnie Walker. -¿Y ese que tiene vos, también es bueno? -Nah tampoco lo tomo porque un Johnnie Walker etiqueta negra, lo tomo. Pero cuando es algo especial, tomo un Blue Label, es un elixir, y los otros son un whisky. Uno se toma, el otro se saborea. -De etiqueta negra es para tomar fuertes después de las cenas, después de la cena, el Blue Label es para cualquier hora. Puede tomarlo en la mañana, jamás te va a agarrar acidez ni gastritis, así vale la botella."
x = 0
y = 0
for letra in texto:
    print(letra)
    img.putpixel((x,y),(ord(letra),0,0,255))
    x = x + 1
    if x == 30:
        x = 0
        y = y + 1


img.save('miimagen.png')
