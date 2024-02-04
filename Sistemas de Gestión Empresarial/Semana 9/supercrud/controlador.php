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
		include "codificador.php";
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
	
	
	function leer($tabla){
		include "config.php";
		//echo " A continuación te pongo el contenido de la tabla ".$tabla;
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "SHOW FULL COLUMNS FROM ".$tabla;
		$resultado = $mysqli->query($consulta);
		echo'<table>';
		echo '<tr>';
		$contadorcolumna = 0;
		while ($fila = $resultado->fetch_assoc()) {
			echo '<th>'.$fila["Field"].'</th>';
			$nombrecolumna[$contadorcolumna] = $fila["Field"];
			$contadorcolumna++;
			
		}
		echo '<th>Operaciones</th>';
		echo '</tr>';
		$consulta = "SELECT * FROM ".$tabla;
		$resultado = $mysqli->query($consulta); 
		
		while ($fila = $resultado->fetch_assoc()) {
			echo'<tr>';
			$contadorcolumna = 0;
			foreach($fila as $nombre_campo => $valor){
				echo '<td class="'.$nombrecolumna[$contadorcolumna].'';
				if(filter_var($valor, FILTER_VALIDATE_URL)){echo " urlsi";}
				echo '">';
				if(filter_var($valor, FILTER_VALIDATE_URL)){echo "<a href='".$valor."'target='_blank'>";}
				if(filter_var($valor, FILTER_VALIDATE_EMAIL)){echo "<a href='mailto:".$valor."'target='_blank'>";}
				echo $valor;
				if(filter_var($valor, FILTER_VALIDATE_URL)){echo "</a";}
				if(filter_var($valor, FILTER_VALIDATE_EMAIL)){echo "</a";}
				/*
				if(filter_var($valor, FILTER_VALIDATE_URL)){echo "<a href='".$valor."'target='_blank'>";
					$url = $valor;
					$parsed = parse_url($url);
					if($parsed['host'] == "www.youtube.com" || $parsed['host'] == "youtu.be"){
						$parts = parse_url($url);
						parse_str($parts['query'], $query);
						$miparte = $query['v'];
						echo'<iframe width="300" height="200" src="https://www.youtube.com/embed/'.$miparte.'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>';
					}
				}
				*/
				echo '</td>';	
				$contadorcolumna++;
			}
			echo'<td >';
			echo '<a href="?tabla='.$_GET['tabla'].'&update='.$fila['Identificador'].'"><i class="fas fa-pen-square"></i></a>';
			echo '<a href="?tabla='.$_GET['tabla'].'&delete='.$fila['Identificador'].'"><i class="fas fa-minus-square"></i></a>';
			echo'</td>';
			echo'</tr>';
			
		}
		
		echo'</table>';
		
		
		
		echo '<a href="?create='.$_GET['tabla'].'" id="create"><i class="fas fa-plus-circle"></i></a>';
		
	}
	
	function insertar($tabla){
		include "config.php";
		echo '<form action="?tabla='.$tabla.'" method="POST">';
		echo '<input type="hidden" name="clave" value="procesainsertar">';
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
	function procesainsertar(){
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
		
		
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "INSERT INTO ".$_POST['tabla']." (Identificador".$listadocolumnas.") VALUES (NULL".$listadovalores.")";
		//echo $consulta;
		
		$mysqli->query($consulta);
		include "registro.php";
	}
	
	function delete($tabla,$Identificador){
		include "config.php";
		
		
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "DELETE FROM ".$tabla." WHERE Identificador = ".$Identificador."";
		//echo $consulta;
		
		$mysqli->query($consulta);
		include "registro.php";
	}
	
	
		function update($tabla,$Identificador){
		include "config.php";
		echo '<form action="?tabla='.$tabla.'" method="POST">';
		echo '<input type="hidden" name="clave" value="procesaupdate">';
		echo '<input type="hidden" name="tabla" value="'.$tabla.'">';
		echo '<input type="hidden" name="Identificador" value="'.$Identificador.'">';
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
						//Me conecto a la base de datos y busco el valor
						$consulta2 = "SELECT * FROM ".$tabla." WHERE Identificador = ".$Identificador." ";
						$resultado2 = $mysqli->query($consulta2);
						while ($fila2 = $resultado2->fetch_assoc()) {
							echo 'value = "'.$fila2[$fila["Field"]].'"';
						}
						//Me conecto a la base de datos y busco el valor
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
	function procesaupdate($tabla,$Identificador){
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
		$cadena = "";
		foreach($_POST as $nombre_campo => $valor){
			if($nombre_campo != 'tabla' && $nombre_campo != 'clave'){
				$cadena .= $nombre_campo."='".$valor."',";
			} 
		}
		$cadena = substr($cadena, 0, -1);
		
		
		$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
		$consulta = "UPDATE ".$tabla." SET ".$cadena." WHERE Identificador = ".$Identificador." ";
		//echo $consulta;
		
		$mysqli->query($consulta);
		include "registro.php";
	}
	
}
?>




