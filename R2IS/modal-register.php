<!-- modal-register.php -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="POST" action="register.php">
        <div class="modal-header">
          <h5 class="modal-title" id="registerModalLabel">Zarejestruj się</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Zamknij"></button>
        </div>
        
        <div class="modal-body">
          <div class="mb-3">
            <label for="login" class="form-label">Login:</label>
            <input type="text" class="form-control" id="login" name="login" placeholder="Wybierz login" required>
          </div>
          
          <div class="mb-3">
            <label for="haslo" class="form-label">Hasło:</label>
            <input type="password" class="form-control" id="haslo" name="haslo" placeholder="Utwórz hasło" required>
          </div>
          
          <div class="mb-3">
            <label for="haslo2" class="form-label">Powtórz hasło:</label>
            <input type="password" class="form-control" id="haslo2" name="haslo2" placeholder="Powtórz hasło" required>
          </div>

          <!-- Opcjonalnie np. email -->
          <div class="mb-3">
            <label for="email" class="form-label">E-mail:</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Podaj e-mail">
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Zarejestruj</button>
        </div>
      </form>
    </div>
  </div>
</div>
