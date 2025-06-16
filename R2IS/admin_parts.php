<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}

$allowedSortFields = ['id_czesci', 'nazwa', 'cena', 'stan_magazynowy', 'id_kategoria', 'promocja'];
$allowedSortOrders = ['asc', 'desc'];

$sort_field = $_GET['sort_field'] ?? 'id_czesci';
$sort_order = strtolower($_GET['sort_order'] ?? 'asc');
if (!in_array($sort_field, $allowedSortFields)) {
    $sort_field = 'id_czesci';
}
if (!in_array($sort_order, $allowedSortOrders)) {
    $sort_order = 'asc';
}

$sql = "SELECT c.*, k.kategoria AS nazwa_kategorii, p.znizka_procent 
        FROM czesci c 
        LEFT JOIN kategoria k ON c.id_kategoria = k.id_kategoria
        LEFT JOIN promocje p ON c.id_czesci = p.id_czesci
        ORDER BY $sort_field $sort_order";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Zarządzanie częściami</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container my-5">
    <h1>Zarządzanie częściami</h1>
    <form method="GET" class="row g-2 mb-3">
      <div class="col-auto">
        <label for="sort_field" class="form-label">Sortuj po:</label>
        <select name="sort_field" id="sort_field" class="form-select" onchange="this.form.submit()">
          <?php foreach ($allowedSortFields as $field): ?>
            <option value="<?= $field ?>" <?= $sort_field == $field ? 'selected' : '' ?>><?= htmlspecialchars($field) ?></option>
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
        <a href="edit_part.php" class="btn btn-primary">Dodaj nową część</a>
        <a href="admin_panel.php" class="btn btn-secondary">Powrót</a>
      </div>
    </form>

    <div class="table-responsive">
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nazwa</th>
            <th>Opis</th>
            <th>Cena</th>
            <th>Stan</th>
            <th>Kategoria</th>
            <th>Promocja?</th>
            <th>Znizka %</th>
            <th>Grafika</th>
            <th>Akcje</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $result->fetch_assoc()): ?>
            <tr>
              <td><?= $row['id_czesci'] ?></td>
              <td><?= htmlspecialchars($row['nazwa']) ?></td>
              <td><?= nl2br(htmlspecialchars($row['opis'])) ?></td>
              <td><?= number_format($row['cena'], 2, ',', ' ') ?> zł</td>
              <td><?= $row['stan_magazynowy'] ?></td>
              <td><?= htmlspecialchars($row['nazwa_kategorii'] ?? '') ?></td>
              <td><?= $row['promocja'] ? 'Tak' : 'Nie' ?></td>
              <td><?= $row['promocja'] ? (int)$row['znizka_procent'] : '-' ?></td>
              <td><?= htmlspecialchars($row['grafika']) ?></td>
              <td>
                <a href="edit_part.php?id=<?= $row['id_czesci'] ?>" class="btn btn-sm btn-warning">Edytuj</a>
                <a href="delete_part.php?id=<?= $row['id_czesci'] ?>" 
                   class="btn btn-sm btn-danger"
                   onclick="return confirm('Na pewno usunąć część o ID <?= $row['id_czesci'] ?>?');">
                  Usuń
                </a>
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
