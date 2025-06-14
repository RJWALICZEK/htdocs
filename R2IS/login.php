<?php
session_start();
include 'db.php';  // dodaj to, aby mieć $conn

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $login = $_POST['login'] ?? '';
    $haslo = $_POST['haslo'] ?? '';

    // przygotuj zapytanie
    $stmt = $conn->prepare("SELECT id_uzytkownik, haslo FROM uzytkownik WHERE nick = ?");
    $stmt->bind_param("s", $login);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($id_uzytkownik, $hashed_password);
        $stmt->fetch();

        // zakładam że hasła są w md5 - lepiej używać password_hash
        if (md5($haslo) === $hashed_password) {
            $_SESSION['user_id'] = $id_uzytkownik;
            $_SESSION['user_nick'] = $login;

            header("Location: index.php");
            exit;
        } else {
           echo '<p>Niepoprawne hasło. Za chwilę nastąpi przekierowanie...</p>';
        header("refresh:3;url=index.php");
        exit;
        }
    } else {
        echo '<p>Nie znaleziono użytkownika. Za chwilę nastąpi przekierowanie...</p>';
        header("refresh:3;url=index.php");
        exit;
    }
}
?>
