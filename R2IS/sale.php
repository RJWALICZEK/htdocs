<?php
require_once "db.php";

$sql = "SELECT * FROM produkty";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();

$products = [];
while ($row = $result->fetch_assoc()) {
  $products[] = $row;
}

$salegroup = array_chunk($products, 4); 
?>


<link rel="stylesheet" href="css/style.css">

<!-- bootstrap karuzela -->

<div class="alert alert-warning">
    <a><strong>Wyprzedaż!</strong> </a>
</div>
<div id="produktyCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <?php foreach ($salegroup as $index => $chunk): ?>
      <div class="carousel-item <?= $index === 0 ? 'active' : '' ?>">
        <div class="d-flex justify-content-center">
          <?php foreach ($chunk as $row): ?>
            <div class="sale-product-card text-center mx-2" style="width: 30%;">
              <img src="img/products/<?= htmlspecialchars($row['obrazek']) ?>" 
                   class="d-block mx-auto" 
                   style="max-height: 300px;" 
                   alt="<?= htmlspecialchars($row['nazwa']) ?>" />
              <h5><?= htmlspecialchars($row['nazwa']) ?></h5>
              <p><strong><?= htmlspecialchars($row['cena']) ?> zł</strong></p>
            </div>
          <?php endforeach; ?>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <button class="carousel-control-prev" type="button" data-bs-target="#produktyCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#produktyCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>