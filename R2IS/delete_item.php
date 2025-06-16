<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['user_id'], $_POST['id_pozZamowienia'])) {
    header('Location: index.php');
    exit;
}

$id_poz = (int)$_POST['id_pozZamowienia'];
$user_id = $_SESSION['user_id'];

$sql = "
    SELECT z.id_uzytkownik
    FROM pozycje_zamowienia p
    JOIN zamowienia z ON p.id_zamowienia = z.id_zamowienia
    WHERE p.id_pozZamowienia = ?
";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_poz);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    if ($row['id_uzytkownik'] == $user_id) {
        $stmt = $conn->prepare("DELETE FROM pozycje_zamowienia WHERE id_pozZamowienia = ?");
        $stmt->bind_param("i", $id_poz);
        $stmt->execute();
    }
}

header('Location: ' . $_SERVER['HTTP_REFERER']);
exit;