<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "123456789";
$dbname = "crm_gestion";

// Crear conexión
$con = mysqli_connect($servername, $username, $password, $dbname);

// Verificar conexión
if (mysqli_connect_errno()) {
    echo "Connection failed: " . mysqli_connect_error();
} else {
    echo "Connected successfully";
}
?>
