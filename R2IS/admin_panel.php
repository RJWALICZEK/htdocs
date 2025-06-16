<?php
session_start();
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Panel administracyjny</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container my-5">
    <h1>Panel administracyjny</h1>
    <div class="list-group">
      <a href="admin_parts.php" class="list-group-item list-group-item-action">Zarządzaj częściami</a>
      <a href="admin_orders.php" class="list-group-item list-group-item-action">Przeglądaj zamówienia</a>
    </div>
    <a href="index.php" class="btn btn-secondary mt-3">Powrót do strony głównej</a>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
