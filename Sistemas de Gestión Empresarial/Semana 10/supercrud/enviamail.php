<?php

	$cabeceras = 'From: hjfnogueira@gmail.com' . "\r\n" .
    'Reply-To: hjfnogueira@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
	$cabeceras  = 'MIME-Version: 1.0' . "\r\n";

	mail(
	   "hjfnogueira@gmail.com",
		"<h1>Titulo</h1>",
		"<>Este es el cuerpo del mensaje<>",
		$cabeceras);

?>