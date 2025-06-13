<?php
require_once "db.php";

$kategoria = $_GET['kategoria'] ?? '';

if ($kategoria) {
    $sql = "SELECT * FROM produkty WHERE kategoria = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $kategoria);
} else {
    // Jeśli nie podano kategorii, pokazujemy wszystkie produkty
    $sql = "SELECT * FROM produkty";
    $stmt = $conn->prepare($sql);
}

$stmt->execute();
$result = $stmt->get_result();
?>

<div class="container my-5">
  <h2 class="mb-4">Produkty z kategorii: <?= htmlspecialchars($kategoria) ?></h2>
  
  <div class="row">
    <?php while($row = $result->fetch_assoc()): ?>
      <div class="col-6 col-md-3 mb-4">
        <div class="card h-100 d-flex flex-column">
          <!-- Obrazek jako przycisk modala -->
          <img 
            src="img/products/<?= $row['obrazek'] ?>" 
            class="card-img-top img-thumbnail"
            alt="<?= htmlspecialchars($row['nazwa']) ?>"
            data-bs-toggle="modal"
            data-bs-target="#modal-<?= $row['id'] ?>"
          >

          <!-- Dołączenie modala z zewnętrznego pliku -->
          <?php 
            $productId = $row['id'];
            $productImage = $row['obrazek'];
            $productName = $row['nazwa'];
            include 'modal-img.php'; 
          ?>

          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><?= htmlspecialchars($row['nazwa']) ?></h5>
            <!-- Przycisk do rozwinięcia/zamknięcia opisu -->
            <button class="btn btn-link p-0 mb-2 text-start text-decoration-none" 
                    type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#opis-<?= $row['id'] ?>" 
                    aria-expanded="false" 
                    aria-controls="opis-<?= $row['id'] ?>">
              Pokaż opis
            </button>

            <!-- Ukryty opis -->
            <div class="collapse mb-2" id="opis-<?= $row['id'] ?>">
              <p class="card-text"><?= nl2br(htmlspecialchars($row['opis'])) ?></p>
            </div>
            <p class="card-text"><strong><?= $row['cena'] ?> zł</strong></p>
            <a href="#" class="btn btn-primary mt-auto">Dodaj do koszyka</a>
          </div>
        </div>
      </div>
    <?php endwhile; ?>
  </div>
</div>
