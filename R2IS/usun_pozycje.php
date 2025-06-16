<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php'); 
    exit;
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_pozZamowienia'])) {
    $id_poz = (int)$_POST['id_pozZamowienia'];

    $sql_check = "
        SELECT p.id_pozZamowienia 
        FROM pozycje_zamowienia p
        JOIN zamowienia z ON p.id_zamowienia = z.id_zamowienia
        WHERE p.id_pozZamowienia = ? AND z.id_uzytkownik = ?
    ";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bind_param('ii', $id_poz, $user_id);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();

    if ($result_check->num_rows === 1) {
        $sql_delete = "DELETE FROM pozycje_zamowienia WHERE id_pozZamowienia = ?";
        $stmt_delete = $conn->prepare($sql_delete);
        $stmt_delete->bind_param('i', $id_poz);
        $stmt_delete->execute();

    }

    header('Location: index.php'); 
    exit;
} else {
    header('HTTP/1.1 400 Bad Request');
    echo "Niepoprawne żądanie";
    exit;
}