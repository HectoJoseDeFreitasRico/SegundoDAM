<?php
	session_start();
	$mysqli = new mysqli("localhost", "documentos", "documentos", "documentos");

	$consulta = "SELECT * FROM usuarios WHERE user = '".$_POST['user']."' AND password = '".$_POST['password']."'";

	$resultado = $mysqli->query($consulta);

	$pasas = false;
	while($fila = $resultado->fetch_assoc()){
		$pasas = true;
		$_SESSION['user'] = $fila['user'];
	}

	if($pasas == true){
		echo"lo que has puesto es correcto y vamos a la aplicación";
		
		echo'<meta http-equiv="Refresh" content="3; url=documentos.php"/>';
	}else{
		echo"eso no es correcto";
		echo'<meta http-equiv="Refresh" content="3; url=index.php"/>';
	
	}

?>