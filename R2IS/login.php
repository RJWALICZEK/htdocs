<?php
session_start();
$message = "";
$alertClass = "alert-danger";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['login'] ?? '');
    $haslo = $_POST['haslo'] ?? '';

    if (empty($login) || empty($haslo)) {
        $message = "Wypełnij oba pola.";
    } else {
        require_once "db.php";

        $stmt = $conn->prepare("SELECT * FROM users WHERE login = ?");
        $stmt->bind_param("s", $login);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($user = $result->fetch_assoc()) {
            if (password_verify($haslo, $user['haslo'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['login'] = $user['login'];
                $alertClass = "alert-success";
                $message = "Zalogowano pomyślnie.";

                // Możesz przekierować np. do panelu użytkownika:
                header("Location: index.php");
                exit;
            } else {
                $message = "Nieprawidłowe hasło.";
            }
        } else {
            $message = "Użytkownik nie istnieje.";
        }
    }
}
?>

<!-- HTML z komunikatem -->
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Logowanie</title>
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
