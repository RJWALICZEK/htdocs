<?php
session_start();
require_once 'db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['login']);
    $haslo = $_POST['haslo'];
    $haslo2 = $_POST['haslo2'];
    $email = trim($_POST['email'] ?? '');
    $rola = '0'; // uzytkownik bez admina domyslnie

    // sprawdzanie zbieznosci hasla i maila
    if (empty($login) || empty($haslo) || empty($haslo2)) {
        echo '<p>Wszystkie pola są wymagane!</p>';
        header("refresh:3;url=index.php");
        exit;
    }

    if ($haslo !== $haslo2) {
        echo '<p>Hasła nie są identyczne!</p>';
        header("refresh:3;url=index.php");
        exit;
    }   
    $haslo_hash = md5($haslo);


    // sprawdzanie czy login jest wolny
    $stmt = $conn->prepare("SELECT id_uzytkownik FROM uzytkownik WHERE nick = ?");
    $stmt->bind_param("s", $login);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        echo '<p>Login jest już zajęty!</p>';
        header("refresh:3;url=index.php");
        exit;
    }
    $stmt->close();

    // wstawianie  uzytkownika do bazy
    $stmt = $conn->prepare("INSERT INTO uzytkownik (nick, imie, nazwisko, email, haslo, rola) VALUES (?, '', '', ?, ?, ?)");
    $stmt->bind_param("sssi", $login, $email, $haslo_hash, $rola);
    if ($stmt->execute()) {
        // Pobierz id utwozonego uzytkownika
        $user_id = $conn->insert_id;

        // i od razu zaloguj
        $_SESSION['user_id'] = $user_id;
        $_SESSION['user_nick'] = $login;
        $_SESSION['user_rola'] = $rola;

        echo '<p>Rejestracja przebiegła pomyślnie. Za chwilę nastąpi przekierowanie...</p>';
        // info o rejestracji i po 3 s przekierowanie na strone glowna
        header("refresh:3;url=index.php");
        exit;
    } else {
        echo '<p>Błąd podczas rejestracji. Za chwilę nastąpi przekierowanie...</p>';
        header("refresh:3;url=index.php");
        exit;
    }
} else {
    // Jeśli ktoś wszedł bez POST
    header("Location: index.php");
    exit;
}
?>
