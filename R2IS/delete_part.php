<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id > 0) {
    // Najpierw usuń zależność
    $stmt = $conn->prepare("DELETE FROM promocje WHERE id_czesci = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
    // Potem usuń część
    $stmt2 = $conn->prepare("DELETE FROM czesci WHERE id_czesci = ?");
    $stmt2->bind_param("i", $id);
    $stmt2->execute();
    $stmt2->close();
    $_SESSION['success'] = "Usunięto część o ID $id.";
}
header('Location: admin_parts.php');
exit;
