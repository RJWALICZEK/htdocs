<?php
$message = "";
$alertClass = "alert-danger";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['login'] ?? '');
    $haslo = $_POST['haslo'] ?? '';
    $haslo2 = $_POST['haslo2'] ?? '';
    $email = trim($_POST['email'] ?? '');

    if (empty($login) || empty($haslo) || empty($haslo2) || empty($email)) {
        $message = "Wszystkie pola są wymagane.";
    } elseif ($haslo !== $haslo2) {
        $message = "Hasła nie są identyczne.";
    } else {
        require_once "db.php";
        $hasloHash = password_hash($haslo, PASSWORD_DEFAULT);

        $stmt = $conn->prepare("INSERT INTO users (login, haslo, email) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $login, $hasloHash, $email);

        if ($stmt->execute()) {
            $message = "Rejestracja zakończona sukcesem!";
            $alertClass = "alert-success";
        } else {
            $message = "Błąd rejestracji: " . $stmt->error;
        }
    }
}
?>

<!-- HTML z komunikatem -->
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Rejestracja</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">

    <?php if (!empty($message)): ?>
      <div class="alert <?= $alertClass ?>"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>

    <a href="index.php" class="btn btn-secondary">Wróć</a>
  </div>
</body>
</html>
