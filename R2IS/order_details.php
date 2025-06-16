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

// Pobierz nagłówek zamówienia
$stmt = $conn->prepare(
    "SELECT z.id_zamowienia, z.id_uzytkownik, z.data, z.suma, u.nick, u.email
     FROM zamowienia z
     LEFT JOIN uzytkownik u ON z.id_uzytkownik = u.id_uzytkownik
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

// Pobierz pozycje zamówienia
$stmt2 = $conn->prepare(
    "SELECT p.id_pozZamowienia, p.id_czesci, p.ilosc, p.cena_jednostkowa, c.nazwa
     FROM pozycje_zamowienia p
     LEFT JOIN czesci c ON p.id_czesci = c.id_czesci
     WHERE p.id_zamowienia = ?"
);
$stmt2->bind_param("i", $id_zam);
$stmt2->execute();
$res2 = $stmt2->get_result();
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
    <h1>Szczegóły zamówienia #<?= $order['id_zamowienia'] ?></h1>
    <p><strong>Użytkownik:</strong> <?= htmlspecialchars($order['nick'] ?? '') ?> (ID <?= $order['id_uzytkownik'] ?>)</p>
    <p><strong>Email:</strong> <?= htmlspecialchars($order['email'] ?? '') ?></p>
    <p><strong>Data:</strong> <?= htmlspecialchars($order['data']) ?></p>
    <p><strong>Suma:</strong> <?= number_format($order['suma'], 2, ',', ' ') ?> zł</p>

    <h3>Pozycje:</h3>
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>ID pozycji</th>
            <th>Część</th>
            <th>Ilość</th>
            <th>Cena jednostkowa</th>
            <th>Wartość</th>
          </tr>
        </thead>
        <tbody>
          <?php while($item = $res2->fetch_assoc()): ?>
            <tr>
              <td><?= $item['id_pozZamowienia'] ?></td>
              <td><?= htmlspecialchars($item['nazwa'] ?? 'Nieznana') ?> (ID <?= $item['id_czesci'] ?>)</td>
              <td><?= $item['ilosc'] ?></td>
              <td><?= number_format($item['cena_jednostkowa'], 2, ',', ' ') ?> zł</td>
              <td><?= number_format($item['ilosc'] * $item['cena_jednostkowa'], 2, ',', ' ') ?> zł</td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>

    <a href="admin_orders.php" class="btn btn-secondary mt-3">Powrót do listy zamówień</a>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
