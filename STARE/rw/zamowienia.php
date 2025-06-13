<form action="zamowienie_zapisz.php" method="post" onsubmit="return walidujZamowienie();">
  <div class="form-group">
    <label>Imię:</label>
    <input type="text" name="imie" class="form-control" required>
  </div>
  <div class="form-group">
    <label>Adres e-mail:</label>
    <input type="email" name="email" class="form-control" required>
  </div>
  <div class="form-group">
    <label>Adres dostawy:</label>
    <textarea name="adres" class="form-control" required></textarea>
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" name="regulamin" required>
    <label class="form-check-label">Akceptuję regulamin</label>
  </div>
  <input type="submit" value="Zamów" class="btn btn-success">
</form>

<script>
function walidujZamowienie() {
  alert("Zamówienie złożone!");
  return true;
}
</script>