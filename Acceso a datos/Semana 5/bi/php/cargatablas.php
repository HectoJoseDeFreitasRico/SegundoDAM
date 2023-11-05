<?php
$mysqli = new mysqli("localhost", "registros", "registros", "registros");


$consulta = "SHOW TABLES";

$resultado = $mysqli->query($consulta);

    
    while ($row = $resultado->fetch_array()) {
        echo '<option value="'.$row[0].'">'.$row[0].'</option>';
    }

?>