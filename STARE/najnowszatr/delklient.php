<?php
    include 'dbconfig.php';
    $id = $_GET['id'];
    $conn = new mysqli($server, $user, $password, $dbname);
    if ($conn->connect_error)
    {
        die("Blad poloczenia z BD: " . $conn->connect_error);
    }

    $zapytanie = "DELETE FROM klienci WHERE id = $id";

    echo $zapytanie;
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
        }, 1000); // 1000 ms = 1 sekunda
    </script>
</head>

<body>
    <h1>Za chwilę nastąpi powrót...</h1>
</body>

</html>