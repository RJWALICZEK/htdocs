<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['rola']) || $_SESSION['rola'] != '1') {
    header('Location: index.php');
    exit;
}

// Pobierz listę kategorii do selecta
$cats = [];
$res = $conn->query("SELECT id_kategoria, kategoria FROM kategoria");
while ($r = $res->fetch_assoc()) {
    $cats[$r['id_kategoria']] = $r['kategoria'];
}

// Sprawdź, czy edytujemy istniejącą część (GET id)
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$isEdit = $id > 0;

// Zmienne dla formularza
$nazwa = '';
$opis = '';
$cena = '';
$grafika = '';
$stan_magazynowy = '';
$id_kategoria = '';
$promocja = 0;
$znizka_procent = 0;

if ($isEdit) {
    // Pobierz dane istniejącej części
    $stmt = $conn->prepare(
        "SELECT c.*, p.znizka_procent 
         FROM czesci c 
         LEFT JOIN promocje p ON c.id_czesci = p.id_czesci 
         WHERE c.id_czesci = ?"
    );
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res->num_rows === 0) {
        echo "Nie znaleziono części o ID $id";
        exit;
    }
    $row = $res->fetch_assoc();
    $nazwa = $row['nazwa'];
    $opis = $row['opis'];
    $cena = $row['cena'];
    $grafika = $row['grafika'];
    $stan_magazynowy = $row['stan_magazynowy'];
    $id_kategoria = $row['id_kategoria'];
    $promocja = $row['promocja'];
    $znizka_procent = $row['znizka_procent'] ?? 0;
    $stmt->close();
}

// Obsługa POST: zapis zmian lub dodanie nowej
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Pobierz dane z formularza
    $nazwa_f = trim($_POST['nazwa'] ?? '');
    $opis_f = trim($_POST['opis'] ?? '');
    $cena_f = floatval(str_replace(',', '.', $_POST['cena'] ?? 0));
    $grafika_f = trim($_POST['grafika'] ?? ''); // tu tylko nazwa pliku. Możesz dodać upload.
    $stan_f = intval($_POST['stan_magazynowy'] ?? 0);
    $kat_f = intval($_POST['id_kategoria'] ?? 0);
    $prom_f = isset($_POST['promocja']) && $_POST['promocja'] == '1' ? 1 : 0;
    $znizka_f = $prom_f ? intval($_POST['znizka_procent'] ?? 0) : 0;
    if ($znizka_f < 0) $znizka_f = 0;
    if ($znizka_f > 100) $znizka_f = 100;

    // Walidacja minimalna
    $errors = [];
    if ($nazwa_f === '') $errors[] = "Nazwa nie może być pusta.";
    if ($opis_f === '') $errors[] = "Opis nie może być pusty.";
    if ($cena_f < 0) $errors[] = "Cena nie może być ujemna.";
    if ($stan_f < 0) $errors[] = "Stan magazynowy nie może być ujemny.";
    if (!isset($cats[$kat_f])) $errors[] = "Nieprawidłowa kategoria.";
    // grafika_f: można sprawdzić, czy plik istnieje w katalogu, albo pozostawić dowolne.

    if (empty($errors)) {
        if ($isEdit) {
            // Aktualizacja tabeli czesci
            $stmt = $conn->prepare(
                "UPDATE czesci SET nazwa=?, opis=?, cena=?, grafika=?, stan_magazynowy=?, id_kategoria=?, promocja=? WHERE id_czesci=?"
            );
            $stmt->bind_param("ssdssiii", $nazwa_f, $opis_f, $cena_f, $grafika_f, $stan_f, $kat_f, $prom_f, $id);
            $ok = $stmt->execute();
            $stmt->close();
        } else {
            // Dodawanie nowej części
            $stmt = $conn->prepare(
                "INSERT INTO czesci (nazwa, opis, cena, grafika, stan_magazynowy, id_kategoria, promocja) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            $stmt->bind_param("ssdssii", $nazwa_f, $opis_f, $cena_f, $grafika_f, $stan_f, $kat_f, $prom_f);
            $ok = $stmt->execute();
            if ($ok) {
                $id = $conn->insert_id;
                $isEdit = true;
            }
            $stmt->close();
        }
        if ($ok) {
            // Obsługa tabeli promocje: jeśli promocja=1 i zniżka>0 -> insert/update; jeśli promocja=0 -> usuń
            if ($prom_f) {
                // Sprawdź istnienie
                $stmt2 = $conn->prepare("SELECT id_promocja FROM promocje WHERE id_czesci = ?");
                $stmt2->bind_param("i", $id);
                $stmt2->execute();
                $res2 = $stmt2->get_result();
                if ($res2->num_rows > 0) {
                    $stmtU = $conn->prepare("UPDATE promocje SET znizka_procent = ? WHERE id_czesci = ?");
                    $stmtU->bind_param("ii", $znizka_f, $id);
                    $stmtU->execute();
                    $stmtU->close();
                } else {
                    $stmtI = $conn->prepare("INSERT INTO promocje (id_czesci, znizka_procent) VALUES (?, ?)");
                    $stmtI->bind_param("ii", $id, $znizka_f);
                    $stmtI->execute();
                    $stmtI->close();
                }
                $stmt2->close();
            } else {
                // usuń ewentualne promocje
                $stmtD = $conn->prepare("DELETE FROM promocje WHERE id_czesci = ?");
                $stmtD->bind_param("i", $id);
                $stmtD->execute();
                $stmtD->close();
            }

            $_SESSION['success'] = $isEdit ? "Zaktualizowano część." : "Dodano nową część.";
            header("Location: admin_parts.php");
            exit;
        } else {
            $errors[] = "Błąd zapisu do bazy.";
        }
    }
}
// Wyświetlanie formularza:
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= $isEdit ? "Edycja części" : "Dodaj nową część" ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container my-5">
    <h1><?= $isEdit ? "Edycja części ID $id" : "Dodaj nową część" ?></h1>

    <?php if (!empty($errors)): ?>
      <div class="alert alert-danger">
        <ul>
          <?php foreach ($errors as $e): ?>
            <li><?= htmlspecialchars($e) ?></li>
          <?php endforeach; ?>
        </ul>
      </div>
    <?php endif; ?>

    <form method="POST" action="">
      <div class="mb-3">
        <label class="form-label">Nazwa:</label>
        <input type="text" name="nazwa" class="form-control" value="<?= htmlspecialchars($nazwa) ?>" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Opis:</label>
        <textarea name="opis" class="form-control" rows="4" required><?= htmlspecialchars($opis) ?></textarea>
      </div>
      <div class="mb-3">
        <label class="form-label">Cena (zł):</label>
        <input type="number" step="0.01" name="cena" class="form-control" value="<?= htmlspecialchars($cena) ?>" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Grafika (nazwa pliku):</label>
        <input type="text" name="grafika" class="form-control" value="<?= htmlspecialchars($grafika) ?>" required>
        <div class="form-text">Wpisz nazwę pliku grafiki (np. cylinder.jpg). Jeśli chcesz upload, rozbuduj kod o obsługę pliku.</div>
      </div>
      <div class="mb-3">
        <label class="form-label">Stan magazynowy:</label>
        <input type="number" name="stan_magazynowy" class="form-control" value="<?= htmlspecialchars($stan_magazynowy) ?>" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Kategoria:</label>
        <select name="id_kategoria" class="form-select" required>
          <?php foreach ($cats as $cat_id => $cat_name): ?>
            <option value="<?= $cat_id ?>" <?= $cat_id == $id_kategoria ? 'selected' : '' ?>>
              <?= htmlspecialchars($cat_name) ?>
            </option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" name="promocja" id="promocjaCheckbox" class="form-check-input" value="1" <?= $promocja ? 'checked' : '' ?>>
        <label for="promocjaCheckbox" class="form-check-label">Promocja?</label>
      </div>
      <div class="mb-3" id="znizkaContainer" style="display: <?= $promocja ? 'block' : 'none' ?>">
        <label class="form-label">Zniżka procent (%):</label>
        <input type="number" name="znizka_procent" class="form-control" value="<?= htmlspecialchars($znizka_procent) ?>">
      </div>
      <button type="submit" class="btn btn-primary"><?= $isEdit ? "Zapisz zmiany" : "Dodaj część" ?></button>
      <a href="admin_parts.php" class="btn btn-secondary">Anuluj</a>
    </form>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Pokaż pole zniżki gdy promocja jest włączona
document.getElementById('promocjaCheckbox').addEventListener('change', function() {
  document.getElementById('znizkaContainer').style.display = this.checked ? 'block' : 'none';
});
</script>
</body>
</html>
