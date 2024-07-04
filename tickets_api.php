<?php
header("Content-Type: application/json");
$servername = "localhost";
$username = "ticket_user";
$password = "123456789";
$dbname = "crm_gestion";

// Crear conexión
$con = mysqli_connect($servername, $username, $password, $dbname);

// Verificar conexión
if (mysqli_connect_errno()) {
    echo json_encode(["error" => "Connection failed: " . mysqli_connect_error()]);
    exit();
}

$request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'GET':
        // Obtener todos los tickets
        getTickets();
        break;
    case 'POST':
        // Crear un nuevo ticket
        createTicket();
        break;
    default:
        header("HTTP/1.0 405 Method Not Allowed");
        echo json_encode(["error" => "Method not allowed"]);
        break;
}

function getTickets() {
    global $con;
    $query = "SELECT * FROM tickets";
    $result = mysqli_query($con, $query);
    $tickets = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode($tickets);
}

function createTicket() {
    global $con;
    $data = json_decode(file_get_contents('php://input'), true);
    $title = $data["title"];
    $description = $data["description"];
    $query = "INSERT INTO tickets (title, description) VALUES ('$title', '$description')";
    if (mysqli_query($con, $query)) {
        echo json_encode(["message" => "Ticket created successfully"]);
    } else {
        echo json_encode(["error" => "Failed to create ticket"]);
    }
}

// Cerrar conexión
mysqli_close($con);
?>
