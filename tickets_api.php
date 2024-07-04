<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$request_method = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$request_method = explode( '/', $uri );
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

if ($request_method[1] !== 'person') {
    header("HTTP/1.1 404 Not Found");
    exit();
}

// $request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'GET':
        // esto obtiene todos los tickets
        return "Hola mundo";
        getTickets();
        break;
    case 'POST':
        // esto crea nuevo ticket 
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
