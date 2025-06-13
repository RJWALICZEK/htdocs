<!-- modal-login.php -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="POST" action="login.php">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalLabel">Zaloguj się</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Zamknij"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="login" class="form-label">Login:</label>
            <input type="text" class="form-control" id="login" name="login" placeholder="Wpisz login" autocomplete="off">
          </div>
          <div class="mb-3">
            <label for="haslo" class="form-label">Hasło:</label>
            <input type="password" class="form-control" id="haslo" name="haslo" placeholder="Wpisz hasło" autocomplete="off">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Zaloguj</button>
        </div>
      </form>
    </div>
  </div>
</div>