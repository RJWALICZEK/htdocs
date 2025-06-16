<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

require_once 'db.php';

$user_id = $_SESSION['user_id'];
$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nick = trim($_POST['nick']);
    $email = trim($_POST['email']);
    $ulica = trim($_POST['ulica']);
    $kod = trim($_POST['kod']);
    $miejscowosc = trim($_POST['miejscowosc']);

    if ($nick === '' || $email === '' || $ulica === '' || $kod === '' || $miejscowosc === '') {
        $message = "Wszystkie pola są wymagane!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = "Niepoprawny format email.";
    } else {
        $sql = "UPDATE uzytkownik SET nick = ?, email = ? WHERE id_uzytkownik = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $nick, $email, $user_id);
        $stmt->execute();

        $sqlCheck = "SELECT id_adres FROM adres WHERE id_uzytkownik = ?";
        $stmtCheck = $conn->prepare($sqlCheck);
        $stmtCheck->bind_param("i", $user_id);
        $stmtCheck->execute();
        $resultCheck = $stmtCheck->get_result();

        if ($resultCheck->num_rows > 0) {
            $row = $resultCheck->fetch_assoc();
            $id_adres = $row['id_adres'];

            $sqlAddr = "UPDATE adres SET ulica = ?, kod = ?, miejscowosc = ? WHERE id_adres = ?";
            $stmtAddr = $conn->prepare($sqlAddr);
            $stmtAddr->bind_param("sssi", $ulica, $kod, $miejscowosc, $id_adres);
            $stmtAddr->execute();
        } else {
            $sqlAddr = "INSERT INTO adres (id_uzytkownik, ulica, kod, miejscowosc) VALUES (?, ?, ?, ?)";
            $stmtAddr = $conn->prepare($sqlAddr);
            $stmtAddr->bind_param("isss", $user_id, $ulica, $kod, $miejscowosc);
            $stmtAddr->execute();
        }

        $_SESSION['profile_message'] = "Dane zostały zaktualizowane.";
        header('Location: index.php#profileModal');
        exit;
    }
}

$sql = "SELECT nick, email FROM uzytkownik WHERE id_uzytkownik = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

$sql_addr = "SELECT ulica, kod, miejscowosc FROM adres WHERE id_uzytkownik = ? LIMIT 1";
$stmt_addr = $conn->prepare($sql_addr);
$stmt_addr->bind_param("i", $user_id);
$stmt_addr->execute();
$result_addr = $stmt_addr->get_result();
$adres = $result_addr->fetch_assoc();

?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <title>Edytuj profil</title>
</head>
<body>

<h1>Profil użytkownika <?= htmlspecialchars($user['nick']) ?></h1>

<?php if ($message): ?>
    <p><strong><?= htmlspecialchars($message) ?></strong></p>
<?php endif; ?>

<form method="post" action="profile.php">
    <label for="nick">Nick:</label><br>
    <input type="text" name="nick" id="nick" value="<?= htmlspecialchars($user['nick']) ?>" required><br><br>

    <label for="email">Email:</label><br>
    <input type="email" name="email" id="email" value="<?= htmlspecialchars($user['email']) ?>" required><br><br>

    <h2>Adres</h2>

    <label for="ulica">Ulica:</label><br>
    <input type="text" name="ulica" id="ulica" value="<?= htmlspecialchars($adres['ulica'] ?? '') ?>" required><br><br>

    <label for="kod">Kod pocztowy:</label><br>
    <input type="text" name="kod" id="kod" value="<?= htmlspecialchars($adres['kod'] ?? '') ?>" required><br><br>

    <label for="miejscowosc">Miejscowość:</label><br>
    <input type="text" name="miejscowosc" id="miejscowosc" value="<?= htmlspecialchars($adres['miejscowosc'] ?? '') ?>" required><br><br>

    <button type="submit">Zapisz zmiany</button>
</form>

</body>
</html>

