<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: admin_orders.php');
    exit;
}

$id = (int)$_GET['id'];


$stmt1 = $conn->prepare("DELETE FROM pozycje_zamowienia WHERE id_zamowienia = ?");
$stmt1->bind_param("i", $id);
$stmt1->execute();


$stmt2 = $conn->prepare("DELETE FROM zamowienia WHERE id_zamowienia = ?");
$stmt2->bind_param("i", $id);
$success = $stmt2->execute();

if ($success) {
    header('Location: admin_orders.php?msg=deleted');
    exit;
} else {
    header('Location: admin_orders.php?msg=error');
    exit;
}
?>