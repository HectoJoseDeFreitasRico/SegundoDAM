<?php 
session_start();
include "../config.php";
$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
include "../controlador.php";
$miformulario = new Supercontrolador();
include "inc/condicionesdeinicio.php";
?>

<html>
	<head>
		<link rel="stylesheet" href="css/estilo.css">
		<script src="https://kit.fontawesome.com/de042286d7.js" crossorigin="anonymous"></script>
		<script src="lib/jquery-3.7.1.min.js"></script>
		<script src="js/codigo.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	</head>
	<body>
		<?php 
			if(isset($_GET['pagina'])){
				switch($_GET['pagina']){
					case "anterior":
						if($_SESSION['pagina'] > 0){
							$_SESSION['pagina']--;
						}
						break;
					case "siguiente":
						$_SESSION['pagina']++;
						break;
					case "primera":
						$_SESSION['pagina'] = 0;
						break;
				}
			}
			if(isset($_POST['usuario']) && !isset($_SESSION['usuario'])){
				
				$consulta = "SELECT * FROM usuarios WHERE usuario =  '".$_POST['usuario']."' AND contrasena = '".$_POST['contrasena']."'";
				$resultado = $mysqli->query($consulta);
				$pasas = "no";
				while ($fila = $resultado->fetch_assoc()) {
					$pasas = "si";
					$_SESSION['usuario'] = $fila['usuario'];
				}
				if($pasas == "si"){}else{
					echo '<div class="notice">Intento de acceso denegado</div>';
				}
			}
		?>
		<?php
			if(isset($_SESSION['usuario'])){
				echo '
					<aside>
						<div id="contienemenu"><ul>';
							$consulta = "SHOW TABLES";
						 	$resultado = $mysqli->query($consulta);
							while ($fila = $resultado->fetch_array()) {
								echo '<li><a href="?tabla='.$fila[0].'">'.$fila[0].'</a></li>';
							}
						
						echo '</ul>
					</div>
					</aside>
					<section>
						<div id="contienecontenido">
							';
								if(isset($_GET['delete'])){$miformulario->delete($_GET['tabla'],$_GET['delete']);}
								if(isset($_GET['update'])){echo'<div id="formulario">';$miformulario->update($_GET['tabla'],$_GET['update']);echo'</div>';}
								if($_POST['clave'] == "procesainsertar"){$miformulario->procesainsertar();}
								if($_POST['clave'] == "procesaupdate"){$miformulario->procesaupdate($_POST['tabla'],$_POST['Identificador']);}
								if(isset($_GET['tabla'])){$miformulario->leer($_GET['tabla']);}
								if(isset($_GET['create'])){echo'<div id="formulario">';$miformulario->insertar($_GET['create']);echo'</div>';}
								
						echo'
						
						</div>
					</section>
				';
			}else{
				echo'
					<form action="?" method="POST" id="formulariologin">
						<img src="../icono.ico">
						<input type="text" name="usuario" placeholder="usuario">
						<input type="password" name="contrasena" placeholder="contraseña">
						<input type="submit">
					</form>
				';
			}
		?>
		<div id="ajax"></div>
	</body>
</html>