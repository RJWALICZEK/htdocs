<?php
session_start();
require_once "db.php";

// Obsługa dodawania do koszyka i kup teraz
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'], $_POST['id'])) {
    $productId = (int)$_POST['id'];
    $action = $_POST['action'];

    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }

    if ($action === 'add') {
        // Dodaj produkt do koszyka
        if (isset($_SESSION['cart'][$productId])) {
            $_SESSION['cart'][$productId]++;
        } else {
            $_SESSION['cart'][$productId] = 1;
        }
        // Ustaw komunikat do wyświetlenia na stronie
        $_SESSION['message'] = "Produkt został dodany do koszyka.";
        // Nie przekierowujemy - pozostajemy na products.php, komunikat wyświetlimy dalej
        // Możesz zrobić redirect, aby uniknąć duplikowania formularza (POST-Redirect-GET)
        header('Location: ' . $_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING']);
        exit;
    }

    if ($action === 'buy_now') {
        // Dodaj produkt do koszyka (lub zwiększ ilość)
        if (isset($_SESSION['cart'][$productId])) {
            $_SESSION['cart'][$productId]++;
        } else {
            $_SESSION['cart'][$productId] = 1;
        }
        // Przekieruj od razu do koszyka
        header('Location: cart.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Koszyk</title>
</head>
<body>
  <?php if (!empty($message)): ?>
    <p style="color:green;"><?= htmlspecialchars($message) ?></p>
  <?php endif; ?>

  <h1>Twój koszyk</h1>
  <?php if (empty($_SESSION['cart'])): ?>
    <p>Twój koszyk jest pusty.</p>
  <?php else: ?>
    <ul>
    <?php foreach ($_SESSION['cart'] as $id => $qty): ?>
      <li>Produkt ID: <?= $id ?> - Ilość: <?= $qty ?></li>
    <?php endforeach; ?>
    </ul>
    <!-- Dodaj link do finalizacji zamówienia -->
    <a href="checkout.php">Przejdź do finalizacji zamówienia</a>
  <?php endif; ?>
</body>
</html>
