<?php
	
include "config.php";
$sql = $_GET['sql']."";
$resultado = $mysqli->query($sql);
$row = $resultado->fetch_assoc();
$contador = 0;
while ($row = $resultado->fetch_assoc()) {
	$contador++;
}
echo'<p>La búsqueda ha devuelto '.$contador.' resultados</p>'
?>

<table  colpadding= 0 colspacing = 0 cellpadding = 0 cellspacing = 0 width=100%>
<?php
	
include "config.php";
$sql = $_GET['sql'];
$resultado = $mysqli->query($sql);
if ($row = $resultado->fetch_assoc()) {
	echo '<tr>';
	foreach($row as $campo=>$valor){
		echo '<th>'.$campo.'</th>';
	}
	echo '</tr>';
}
	
	
	
include "config.php";
$sql = $_GET['sql'];
$resultado = $mysqli->query($sql);
while ($row = $resultado->fetch_assoc()) {
	echo '<tr>';
	foreach($row as $campo=>$valor){
		echo '<td>'.$valor.'</td>';
	}
	echo '</tr>';
}

?>
</table>
