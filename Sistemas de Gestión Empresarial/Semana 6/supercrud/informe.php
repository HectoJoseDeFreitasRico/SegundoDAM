<html>
	<head>
		<style>
			body{background: rgb(220,220,220);font-family: sans-serif;}
			table{width: 1200px;margin: auto;background: white;box-shadow:0px 10px 20px rgba(0,0,0,0.4);padding: 30px; }
			h1{text-align: center;}
		</style>
	</head>
	<body>
	<?php include"codificador.php" ?>
	<h1>Entregas de <?php  /*echo descodifica($_GET['clave'])*/ echo $_GET['email'] ?></h1>
	<table>
		<tr><th>URL</th><th>Género</th><th>Nota</th><th>epoch</th><th>Tráiler</th></tr>

		<?php
			//error_reporting(E_ERROR | E_PARSE);
			include"config.php";

			$mysqli = new mysqli($mydbserver, $mydbuser, $mydbpassword, $mydb);
				$consulta = "SELECT * FROM entregas WHERE email = '".$_GET['email']."'";
				$resultado = $mysqli->query($consulta);
				while ($fila = $resultado->fetch_assoc()) {
					$parts = parse_url($fila['url']);
					parse_str($parts['query'], $query);
					$miparte = $query['v'];
					echo '<tr>';
					echo '<td><a href="'.$fila['url'].'">'.$fila['url'].'</a></td>';
					echo '<td>'.$fila['genero'].'</td>';
					echo '<td>'.$fila['nota'].'</td>';
					echo '<td>'.$fila['epoch'].'</td>';
					echo '<td>';
					echo'<iframe width="300" height="200" src="https://www.youtube.com/embed/'.$miparte.'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>';
					
					echo '</td>';
					echo "</tr>";
				}

		?>
		</table>
	</body>
</html>