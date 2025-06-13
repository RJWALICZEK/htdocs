<?php
// db.php
$host = "localhost";
$user = "root";
$password = "";
$database = "r2is";

$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    die("Błąd połączenia z bazą danych: " . $conn->connect_error);
}
$conn->set_charset("utf8");
?>
