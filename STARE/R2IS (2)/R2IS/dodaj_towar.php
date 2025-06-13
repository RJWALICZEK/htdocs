<?php
include 'dbconfig.php';

$nazwa = $_POST['nazwa'];
$ilosc = (int) $_POST['ilosc']; // Rzutowanie na liczbę całkowitą
$jm = $_POST['jm'];
$cena = (float) $_POST['cena']; // Rzutowanie na liczbę zmiennoprzecinkową

$conn = new mysqli($server, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Błąd połączenia z BD: " . $conn->connect_error);
}

$zapytanie = "INSERT INTO `towary` (`id`, `nazwa`, `ilosc`, `jm`, `cena`) VALUES (NULL, '$nazwa', $ilosc, '$jm', $cena);";
$result = $conn->query($zapytanie);

$conn->close();
?>

<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Automatyczny powrót</title>
    <script>
        setTimeout(function () {
            window.history.back();
        }, 10000); // 500 ms = 1 sekunda
    </script>
</head>

<body>
    <h1>Za chwilę nastąpi powrót...</h1>
</body>

</html>