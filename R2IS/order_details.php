<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}

$id_zam = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id_zam <= 0) {
    echo "Nieprawidłowe ID zamówienia.";
    exit;
}

$stmt = $conn->prepare(
    "SELECT 
    z.id_zamowienia,
    z.id_uzytkownik,
    z.data,
    z.suma,
    u.nick,
    u.email,
    a.ulica,
    a.kod,
    a.miejscowosc
FROM zamowienia z
JOIN uzytkownik u ON z.id_uzytkownik = u.id_uzytkownik
JOIN adres a ON u.id_uzytkownik = a.id_uzytkownik
     WHERE z.id_zamowienia = ?"
);
$stmt->bind_param("i", $id_zam);
$stmt->execute();
$res = $stmt->get_result();
if ($res->num_rows === 0) {
    echo "Nie znaleziono zamówienia.";
    exit;
}
$order = $res->fetch_assoc();
$stmt->close();
;
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Szczegóły zamówienia #<?= $order['id_zamowienia'] ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container my-5">
    <h1>Szczegóły #<?= $order['id_zamowienia'] ?></h1>
    <p><strong>Użytkownik:</strong> <?= htmlspecialchars($order['nick'] ?? '') ?> (ID <?= $order['id_uzytkownik'] ?>)</p>
    <p><strong>Email:</strong> <?= htmlspecialchars($order['email'] ?? '') ?></p>
    <p><strong>Data:</strong> <?= htmlspecialchars($order['data']) ?></p>
    <p><strong>ulica:</strong> <?= htmlspecialchars($order['ulica']) ?></p>
    <p><strong>kod:</strong> <?= htmlspecialchars($order['kod']) ?></p>
    <p><strong>miejscowosc:</strong> <?= htmlspecialchars($order['miejscowosc']) ?></p>


    <a href="admin_orders.php" class="btn btn-secondary mt-3">Powrót do listy zamówień</a>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
