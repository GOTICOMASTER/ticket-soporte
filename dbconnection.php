<?php
$servername = "localhost";
$username = "ticket_user"; // Nuevo usuario
$password = "123456789"; // Contraseña del nuevo usuario
$dbname = "crm_gestion";

// Crear conexión
$con = mysqli_connect($servername, $username, $password, $dbname);

// Verificar conexión
if (mysqli_connect_errno()) {
    echo "Connection failed: " . mysqli_connect_error();
}

function fetch_data($endpoint) {
    $url = 'http://localhost:3000/' . $endpoint;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_URL, $url);
    $result = curl_exec($ch);
    curl_close($ch);

    return json_decode($result, true);
}
?>
