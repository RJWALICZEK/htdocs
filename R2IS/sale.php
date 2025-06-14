<?php

session_start();

require_once "db.php";

// Pobieramy produkty na promocji (promocja=1)
$sql = "SELECT * FROM czesci WHERE promocja = 1";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();

$products = [];
while ($row = $result->fetch_assoc()) {
  // Obliczamy cenę po promocji 10%
  $row['cena_promocyjna'] = $row['cena'] * 0.9;
  $products[] = $row;
}

// Podział na grupy po 4 elementy (do karuzeli)
$salegroup = array_chunk($products, 4);
?>

<link rel="stylesheet" href="css/style.css">



 <div id="produktyCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <?php foreach ($salegroup as $index => $chunk): ?>
      <div class="carousel-item <?= $index === 0 ? 'active' : '' ?>">
        <div class="d-flex justify-content-center">
          <?php foreach ($chunk as $row): ?>
            <div class="sale-product-card text-center mx-2" style="width: 30%;">
              <img src="img/products/<?= htmlspecialchars($row['grafika']) ?>" 
                   class="d-block mx-auto" 
                   style="max-height: 300px;" 
                   alt="<?= htmlspecialchars($row['nazwa']) ?>" />
              <h5><?= htmlspecialchars($row['nazwa']) ?></h5>
              <p>
                <span style="text-decoration: line-through; color: gray;">
                  <?= number_format($row['cena'], 2) ?> zł
                </span>
                &nbsp;
                <span style="color: red; font-weight: bold;">
                  <?= number_format($row['cena_promocyjna'], 2) ?> zł
                </span>
              </p>

              <form method="post" action="cart_add.php" class="mt-2">
                <input type="hidden" name="product_id" value="<?= (int)$row['id_czesci'] ?>">
                <?php if (!isset($_SESSION['user_id'])): ?>
  <a href="#" class="btn btn-primary mt-auto dodaj-koszyk" data-product-id="<?= $row['id_czesci'] ?>">Dodaj do koszyka</a>
<?php else: ?>
  <a href="dodaj_do_koszyka.php?id=<?= $row['id_czesci'] ?>" class="btn btn-primary mt-auto">Dodaj do koszyka</a>
<?php endif; ?>
              </form>
            </div>
          <?php endforeach; ?>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <button class="carousel-control-prev" type="button" data-bs-target="#produktyCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
    <span class="visually-hidden">Poprzedni</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#produktyCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
    <span class="visually-hidden">Następny</span>
  </button>
</div>
<div class="alert alert-warning text-center mt-3">
    <strong>Wyprzedaż!</strong>
</div>
<script>
  document.querySelectorAll('.dodaj-koszyk').forEach(button => {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      alert('Musisz być zalogowany, aby dodać produkt do koszyka.');
    });
  });
</script>
