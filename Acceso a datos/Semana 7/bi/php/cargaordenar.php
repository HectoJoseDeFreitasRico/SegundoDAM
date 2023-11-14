<?php
include "config.php";


$consulta = "SHOW COLUMNS FROM ".$_GET['tabla'];

$resultado = $mysqli->query($consulta);
while ($row = $resultado->fetch_array()) {
	echo '<input type="checkbox" value="'.$row[0].'" name="seleccionaordenar">'.$row[0].'<br>';
}

?>