<?php
session_start();
// Definir la ruta del directorio a explorar
$path = 'vault/users/'.$_GET['user']."/";

// Comprobar si se puede abrir el directorio
if($handle = opendir($path)){
    // Recorrer los elementos del directorio
    while(false !== ($entry = readdir($handle))){
        // Ignorar las entradas "." y ".."
        if($entry != "." && $entry != ".."){
            // Iniciar la impresión de un elemento del directorio con atributos personalizados
            echo "<div class='item' filetype='" . explode(".", $entry)[1] . "' filename='" . $entry . "'>";
            
            // Comprobar si la entrada es un directorio
            if(is_dir($path.'/'.$entry)){
                // Si es un directorio, imprimir un ícono de carpeta
                echo "
                <div class='iconfolder' >
                    <img src='img/bootstrap-icons-1.11.1/folder.svg'>
                </div>";
            } else {
                // Si no es un directorio, imprimir un ícono de archivo basado en su extensión
                echo "
                <div class='iconfile'>
                    <img src='img/bootstrap-icons-1.11.1/filetype-" . explode(".", $entry)[1] . ".svg'>
                </div>";
            }
            // Imprimir el nombre del archivo o directorio
            echo "<span class='documentname'>" . $entry . "</span></div>";
        }
    }
    // Cerrar el manejador del directorio
    closedir($handle);
}
?>
