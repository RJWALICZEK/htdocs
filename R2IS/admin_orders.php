<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}

// Sortowanie zamówień po dacie lub sumie
$allowedSortFields = ['data', 'suma', 'id_zamowienia'];
$allowedSortOrders = ['asc', 'desc'];

$sort_field = $_GET['sort_field'] ?? 'data';
$sort_order = strtolower($_GET['sort_order'] ?? 'desc');
if (!in_array($sort_field, $allowedSortFields)) {
    $sort_field = 'data';
}
if (!in_array($sort_order, $allowedSortOrders)) {
    $sort_order = 'desc';
}

// Pobierz zamówienia z nazwiskami użytkowników
$sql = "SELECT z.id_zamowienia, z.id_uzytkownik, z.data, z.suma, u.nick, u.email
        FROM zamowienia z
        LEFT JOIN uzytkownik u ON z.id_uzytkownik = u.id_uzytkownik
        ORDER BY $sort_field $sort_order";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Przegląd zamówień</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container my-5">
    <h1>Przegląd zamówień</h1>
    <form method="GET" class="row g-2 mb-3">
      <div class="col-auto">
        <label for="sort_field" class="form-label">Sortuj po:</label>
        <select name="sort_field" id="sort_field" class="form-select" onchange="this.form.submit()">
          <?php foreach ($allowedSortFields as $f): ?>
            <option value="<?= $f ?>" <?= $sort_field == $f ? 'selected' : '' ?>><?= htmlspecialchars($f) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="col-auto">
        <label for="sort_order" class="form-label">Kierunek:</label>
        <select name="sort_order" id="sort_order" class="form-select" onchange="this.form.submit()">
          <option value="asc" <?= $sort_order == 'asc' ? 'selected' : '' ?>>Rosnąco</option>
          <option value="desc" <?= $sort_order == 'desc' ? 'selected' : '' ?>>Malejąco</option>
        </select>
      </div>
      <div class="col-auto align-self-end">
        <a href="admin_panel.php" class="btn btn-secondary">Powrót</a>
      </div>
    </form>

    <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>ID zamówienia</th>
            <th>Użytkownik</th>
            <th>Email</th>
            <th>Data</th>
            <th>Suma</th>
            <th>Akcje</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $result->fetch_assoc()): ?>
            <tr>
              <td><?= $row['id_zamowienia'] ?></td>
              <td><?= htmlspecialchars($row['nick'] ?? 'nieznany') ?></td>
              <td><?= htmlspecialchars($row['email'] ?? '') ?></td>
              <td><?= htmlspecialchars($row['data']) ?></td>
              <td><?= number_format($row['suma'], 2, ',', ' ') ?> zł</td>
              <td>
                <a href="order_details.php?id=<?= $row['id_zamowienia'] ?>" class="btn btn-sm btn-info">Szczegóły</a>
              </td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
