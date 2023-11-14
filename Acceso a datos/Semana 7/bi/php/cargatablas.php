<option>Selecciona una tabla</option>
<?php
include "config.php";

$consulta = "SHOW TABLES";

$resultado = $mysqli->query($consulta);

    
    while ($row = $resultado->fetch_array()) {
        echo '<option value="'.$row[0].'">'.$row[0].'</option>';
    }

?>