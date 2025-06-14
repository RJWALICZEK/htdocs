<?php
session_start();
require_once 'db.php'; // podłącz bazę, $conn

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['login']);
    $haslo = $_POST['haslo'];
    $haslo2 = $_POST['haslo2'];
    $email = trim($_POST['email'] ?? '');
    $rola = '0'; // standardowy użytkownik

    // Prosta walidacja
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

    // Hashowanie hasła (lepiej niż md5)
    $haslo_hash = password_hash($haslo, PASSWORD_DEFAULT);

    // Sprawdź, czy login już istnieje
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

    // Wstaw nowego użytkownika do bazy
    $stmt = $conn->prepare("INSERT INTO uzytkownik (nick, imie, nazwisko, email, haslo, rola) VALUES (?, '', '', ?, ?, ?)");
    $stmt->bind_param("sssi", $login, $email, $haslo_hash, $rola);
    if ($stmt->execute()) {
        // Pobierz id nowego użytkownika
        $user_id = $conn->insert_id;

        // Zaloguj użytkownika (session)
        $_SESSION['user_id'] = $user_id;
        $_SESSION['user_nick'] = $login;
        $_SESSION['user_rola'] = $rola;

        echo '<p>Rejestracja przebiegła pomyślnie. Za chwilę nastąpi przekierowanie...</p>';
        // Przekierowanie po 3 sekundach na home.php
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
