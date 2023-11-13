<?php
error_reporting(E_ERROR | E_PARSE);
class Supercontrolador{
	function formulario($tabla){
		include "config.php";
		echo '<form action="?" method="POST">';
		echo '<input type="hidden" name="clave" value="procesaformulario">';
		echo '<input type="hidden" name="tabla" value="'.$tabla.'">';
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "SHOW FULL COLUMNS FROM ".$tabla;
		$resultado = $mysqli->query($consulta);
		while ($fila = $resultado->fetch_assoc()) {
			if(json_decode($fila["Comment"])->visible == "true"){
				//preg_match('#\((.*?)\)#', $fila["Type"], $match);
			echo'
				<div class="campo">
					<h3>'.json_decode($fila["Comment"])->titulo.'</h3>
					<p>'.json_decode($fila["Comment"])->descripcion.' - Caracteres mínimo '.json_decode($fila["Comment"])->min.' máximo '.json_decode($fila["Comment"])->max.'</p>
					';
					if($fila["Null"] == "NO"){echo " <p>*este campo es requerido</p> ";}
					if(json_decode($fila["Comment"])->deshabilitado == "true"){echo " <p>*este campo lo rellena automaticamente el sistema</p> ";}
					
					
					echo'
						<div class="contienecampo">
						<table><tr><td width="85%">
						<input type="'.json_decode($fila["Comment"])->tipodato.'" name="'.$fila["Field"].'" id="'.$fila["Field"].'"
						';
						if($fila["Null"] == "NO"){echo " required ";}
						if(json_decode($fila["Comment"])->deshabilitado == "true"){echo " readonly ";}
						preg_match('#\((.*?)\)#', $fila["Type"], $match);
						echo'
						max = "'.json_decode($fila["Comment"])->max2.'";
						maxlength = "'.json_decode($fila["Comment"])->max.'"
						minlength = "'.json_decode($fila["Comment"])->min.'"
						placeholder = "'.json_decode($fila["Comment"])->placeholder.'"
						';
						if(isset(json_decode($fila["Comment"])->parametroget)){
							echo'value = "'.$_GET[json_decode($fila["Comment"])->parametroget].'"';
						}
						echo'
					>
					</td><td width="15%">
					<div class="tipocampo"><i class="' . json_decode($fila["Comment"])->icono . '"></i></div>
					</td></tr></table>
					</div>
					<div class="clearfix"></div>
				</div>
			';
			}
		}
		echo'<input type="submit">';
		$mysqli->close();
	}
	function procesaformulario(){
		//Vamos a analizar que es lo que viene antes de meterlo
		foreach($_REQUEST as $nombre_campo => $valor){
			//echo"el campo es ".$nombre_campo." y el valor es ".$valor;
			if(preg_match('~\b(drop|delete|truncate)\b~i', $nombre_campo)){
				$volcado =  implode(",", $_REQUEST).",".$_SERVER['REMOTE_ADDR'].",".$_SERVER['HTTP_USER_AGENT']."\n";
				$myfile = fopen("volcado.txt", "a");
				fwrite($myfile, $volcado);
				die("Ejecución detenida");
			}
			if(preg_match('~\b(drop|delete|truncate)\b~i', $valor)){
				$volcado =  implode(",", $_REQUEST).",".$_SERVER['REMOTE_ADDR'].",".$_SERVER['HTTP_USER_AGENT']."\n";
				$myfile = fopen("volcado.txt", "a");
				fwrite($myfile, $volcado);
				die("Ejecución detenida");
			}
		}
		
		include "config.php";
		$listadocolumnas = "";
		$listadovalores = "";
		foreach($_POST as $nombre_campo => $valor){
			if($nombre_campo != 'tabla' && $nombre_campo != 'clave'){
				$listadocolumnas .= ",".$nombre_campo."";
				$listadovalores .= ",'".$valor."'";
			} 
		}
		
		///////////////////////////////
		$cabeceras = 'From: hjfnogueira@gmail.com' . "\r\n" .
		'Reply-To: hjfnogueira@gmail.com' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();
		$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
		$mensaje = "<h1>Has enviado un formulario al sistema de entregas</h1><br><p>A continucación te enviamos un comprobante de los campos que enviaste desde el formulario<br></p>";
		foreach($_POST as $nombre_campo => $valor){
			if($nombre_campo != 'tabla' && $nombre_campo != 'clave'){
				$mensaje .= "".ucfirst($nombre_campo).": <b>".$valor."</b><br>";
			} 
			
		}
		$mensaje .= "<br><p>Puedes consultar tus puntuaciones ";
		$mensaje .= "<br><a href='http://localhost/supercrud/informe.php?clave=".codifica($_POST['email'])."'>AQUI</a></p>";
		$mensaje .= "<p style ='color:red;'>IMPORTANTE: Este enlace contiene una clave con tu identificación - no compartas este correo con nadie</p><br>";
		mail(
		   $_POST['email'],
			"Formulario enviado",
			$mensaje,
		$cabeceras);
		//////////////////////////////////
		
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "INSERT INTO ".$_POST['tabla']." (Identificador".$listadocolumnas.") VALUES (NULL".$listadovalores.")";
		//echo $consulta;
		
		$mysqli->query($consulta);
		include "registro.php";
		echo'
			<div class="notice">
				<h1>Registro guardado correctamente</h1>
				<p>Tu registro fue guardado correctamente, redirigiendo en 5 segundos...</p>
			</div>
		';
		echo'<meta http-equiv="refresh" content="5; url=?">';
	}
}
?>