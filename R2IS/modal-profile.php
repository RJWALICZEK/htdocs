<?php

if (!isset($_SESSION['user_id'])) {
    return;
}

require_once 'db.php';

$user_id = $_SESSION['user_id'];
$message = $_SESSION['profile_message'] ?? '';
unset($_SESSION['profile_message']);

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

<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="profile.php">
        <div class="modal-header">
          <h5 class="modal-title" id="profileModalLabel">Edytuj profil</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Zamknij"></button>
        </div>
        <div class="modal-body">
          <?php if ($message): ?>
            <div class="alert alert-info"><?= htmlspecialchars($message) ?></div>
          <?php endif; ?>

          <div class="mb-3">
            <label for="nick" class="form-label">Nick</label>
            <input type="text" class="form-control" id="nick" name="nick" value="<?= htmlspecialchars($user['nick']) ?>" required>
          </div>

          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
          </div>

          <h6>Adres</h6>

          <div class="mb-3">
            <label for="ulica" class="form-label">Ulica</label>
            <input type="text" class="form-control" id="ulica" name="ulica" value="<?= htmlspecialchars($adres['ulica'] ?? '') ?>" required>
          </div>

          <div class="mb-3">
            <label for="kod" class="form-label">Kod pocztowy</label>
            <input type="text" class="form-control" id="kod" name="kod" value="<?= htmlspecialchars($adres['kod'] ?? '') ?>" required>
          </div>

          <div class="mb-3">
            <label for="miejscowosc" class="form-label">Miejscowość</label>
            <input type="text" class="form-control" id="miejscowosc" name="miejscowosc" value="<?= htmlspecialchars($adres['miejscowosc'] ?? '') ?>" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Anuluj</button>
          <button type="submit" class="btn btn-primary">Zapisz zmiany</button>
        </div>
      </form>
    </div>
  </div>
</div>
