<table colpadding= 0 colspacing = 0 cellpadding = 0 cellspacing = 0 width=100%>
<?php
	
$mysqli = new mysqli("localhost", "registros", "registros", "registros");
$sql = $_GET['sql']." LIMIT 1";
$resultado = $mysqli->query($sql);
while ($row = $resultado->fetch_assoc()) {
	echo '<tr>';
	foreach($row as $campo=>$valor){
		echo '<th>'.$campo.'</th>';
	}
	echo '</tr>';
}
	
	
	
$mysqli = new mysqli("localhost", "registros", "registros", "registros");
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
