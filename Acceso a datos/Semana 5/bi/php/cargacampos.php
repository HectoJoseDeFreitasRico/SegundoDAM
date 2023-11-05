<?php
$mysqli = new mysqli("localhost", "registros", "registros", "registros");


$consulta = "SHOW COLUMNS FROM ".$_GET['tabla'];

$resultado = $mysqli->query($consulta);
while ($row = $resultado->fetch_array()) {
	echo '<input type="checkbox" value="'.$row[0].'" name="seleccionacampos">'.$row[0].'<br>';
}

?>