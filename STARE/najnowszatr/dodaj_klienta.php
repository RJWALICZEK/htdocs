<?php
include 'dbconfig.php';

$nazwa = $_POST['nazwa'];
$adres = $_POST['adres'];
$opis = $_POST['opis'];


$conn = new mysqli($server, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Błąd połączenia z BD: " . $conn->connect_error);
}

$zapytanie = "INSERT INTO `klienci` (`id`, `nazwa`, `adres`, `opis`) VALUES (NULL, '$nazwa', '$adres', '$opis');";


$result = $conn->query($zapytanie);

$conn->close();
echo "<tr><td> </td><td>$nazwa</td><td>$adres</td><td>$opis</td><td><td></tr>"
?>
