<?php session_start();?>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
		</script>
		<link rel="Stylesheet" href="css/estilo.css">
		<script src="js/codigo.js"></script>
	</head>
	<body>
		<table border=0 width=100% height=100%>
			<tr height=20px; id="menu">
				<td>
					Menu
				</td>
			</tr>
			<tr height=20px; id="barranombredocumento">
				<td>
					<input type="text" id="documentname" placeholder="Nombre del documento" value="<?php echo explode(".",$_GET['file'])[0]?>">
				</td>
			</tr>
			<tr height=50px; id="herramientas">
				<td>
					<button id="guardar"><img src="../img/bootstrap-icons-1.11.1/save.svg" class="icon" ></button>
					<select id="tipotexto">
						<option value="p">Texto de parrafo</option>
						<option value="h1">Encabezado 1</option>
						<option value="h2">Encabezado 2</option>
						<option value="h3">Encabezado 3</option>
						<option value="h4">Encabezado 4</option>
						<option value="h5">Encabezado 5</option>
						<option value="h6">Encabezado 6</option>
						<option value="pre">Texto preformateado</option>
					</select>
					<select id="selectfont">
						<option value="Arial">Arial</option>
						<option value="Verdana">Verdana</option>
						<option value="Tahoma">Tahoma</option>
						<option value="Times new Roman">Times new Roman</option>
						<option value="Garamond">Garamond</option>
						<option value="Georgia">Georgia</option>
					</select>
					<input type="number" id="fontsize" value=11>
					<button id="bold"><img src="../img/bootstrap-icons-1.11.1/type-bold.svg" class="icon" ></button>
					<button id="cursive"><img src="../img/bootstrap-icons-1.11.1/type-italic.svg" class="icon" ></button>
					<button id="underline"><img src="../img/bootstrap-icons-1.11.1/type-underline.svg" class="icon" ></button>
					<input type=color id="fontcolor">
					<button id="orderedlist"><img src="../img/bootstrap-icons-1.11.1/list-ol.svg" class="icon" ></button>
					<button id="unorderedlist"><img src="../img/bootstrap-icons-1.11.1/list-ul.svg" class="icon" ></button>
					<button id="alignleft"><img src="../img/bootstrap-icons-1.11.1/text-left.svg" class="icon" ></button>
					<button id="alignright"><img src="../img/bootstrap-icons-1.11.1/text-right.svg" class="icon" ></button>
					<button id="aligncenter"><img src="../img/bootstrap-icons-1.11.1/text-center.svg" class="icon" ></button>
					<button id="alignjustify"><img src="../img/bootstrap-icons-1.11.1/justify.svg" class="icon" ></button>
				</td>
			</tr>
			<tr>
				<td id="fondopagina">
					<div id="pagina" contenteditable="true">
						<?php include "../vault/users/".$_SESSION['user']."/".$_GET['file']?>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>