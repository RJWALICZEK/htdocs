<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => 'Brak dostępu']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['id_zamowienia'], $_POST['status'])) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Nieprawidłowe dane']);
    exit;
}

$id = (int)$_POST['id_zamowienia'];
$status = ($_POST['status'] == '1') ? 1 : 0;

// Aktualizacja statusu
$stmt = $conn->prepare("UPDATE zamowienia SET status = ? WHERE id_zamowienia = ?");
$stmt->bind_param("ii", $status, $id);
$success = $stmt->execute();

if ($success) {
    echo json_encode(['success' => true]);
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Błąd bazy danych']);
}
?>