<?php
session_start();

require_once "db.php";

$kategorieMap = [
  'czesci_silnikowe' => ['id' => 2, 'nazwa' => 'Części silnikowe'],
  'uklad_napedowy' => ['id' => 14, 'nazwa' => 'Układ napędowy'],
  'zawieszenie' => ['id' => 15, 'nazwa' => 'Zawieszenie'],
  'hamulce' => ['id' => 4, 'nazwa' => 'Hamulce'],
  'oleje_i_plyny' => ['id' => 12, 'nazwa' => 'Oleje i płyny'],
  'elektryka' => ['id' => 3, 'nazwa' => 'Elektryka'],
  'nadwozie_i_plastiki' => ['id' => 10, 'nazwa' => 'Nadwozie i plastiki'],
  'kola' => ['id' => 9, 'nazwa' => 'Koła'],
  'opony' => ['id' => 13, 'nazwa' => 'Opony'],
  'akcesoria_i_tuning' => ['id' => 1, 'nazwa' => 'Akcesoria i tuning'],
  'kask_integralny' => ['id' => 6, 'nazwa' => 'Kask integralny'],
  'kask_modularny' => ['id' => 7, 'nazwa' => 'Kask modularny'],
  'kask_enduro' => ['id' => 5, 'nazwa' => 'Kask enduro'],
  'kask_otwarty' => ['id' => 8, 'nazwa' => 'Kask otwarty'],
  'narzedzia' => ['id' => 11, 'nazwa' => 'Narzędzia']
];

$kategoria = $_GET['kategoria'] ?? '';

if ($kategoria && isset($kategorieMap[$kategoria])) {
    $id_kategoria = $kategorieMap[$kategoria]['id'];
    $sql = "SELECT * FROM czesci WHERE id_kategoria = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kategoria);
    $displayCategoryName = $kategorieMap[$kategoria]['nazwa'];
} else {
    $sql = "SELECT * FROM czesci";
    $stmt = $conn->prepare($sql);
    $displayCategoryName = "Wszystkie";
}

$stmt->execute();
$result = $stmt->get_result();
?>

<div class="container my-5">
  <h2 class="mb-4">Produkty z kategorii: <?= htmlspecialchars($displayCategoryName) ?></h2>
  
  <div class="row">
    <?php while($row = $result->fetch_assoc()): ?>
      <?php
        // Obliczamy cenę promocyjną, jeśli jest promocja
        if ($row['promocja'] == 1) {
            $cena_promocyjna = $row['cena'] * 0.9; // 10% zniżki, zmień jeśli inna
        } else {
            $cena_promocyjna = null;
        }
      ?>
      <div class="col-6 col-md-3 mb-4">
        <div class="card h-100 d-flex flex-column">
          <img 
            src="img/products/<?= htmlspecialchars($row['grafika']) ?>" 
            class="card-img-top img-thumbnail"
            alt="<?= htmlspecialchars($row['nazwa']) ?>"
            data-bs-toggle="modal"
            data-bs-target="#modal-<?= $row['id_czesci'] ?>"
          >

          <?php 
            $productId = $row['id_czesci'];
            $productImage = $row['grafika'];
            $productName = $row['nazwa'];
            $productDescription = $row['opis'];
            $productPrice = $row['cena'];
            include 'modal-img.php'; 
          ?>

          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><?= htmlspecialchars($row['nazwa']) ?></h5>
            <button class="btn btn-link p-0 mb-2 text-start text-decoration-none" 
                    type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#opis-<?= $row['id_czesci'] ?>" 
                    aria-expanded="false" 
                    aria-controls="opis-<?= $row['id_czesci'] ?>">
              Pokaż opis
            </button>

            <div class="collapse mb-2" id="opis-<?= $row['id_czesci'] ?>">
              <p class="card-text"><?= nl2br(htmlspecialchars($row['opis'])) ?></p>
            </div>

            <p class="card-text">
              <?php if ($cena_promocyjna !== null): ?>
                <span style="text-decoration: line-through; color: gray;">
                  <?= number_format($row['cena'], 2) ?> zł
                </span>
                &nbsp;
                <span style="color: red; font-weight: bold;">
                  <?= number_format($cena_promocyjna, 2) ?> zł
                </span>
              <?php else: ?>
                <strong><?= number_format($row['cena'], 2) ?> zł</strong>
              <?php endif; ?>
            </p>

            <?php if (!isset($_SESSION['user_id'])): ?>
  <a href="#" class="btn btn-primary mt-auto dodaj-koszyk" data-product-id="<?= $row['id_czesci'] ?>">Dodaj do koszyka</a>
<?php else: ?>
  <a href="dodaj_do_koszyka.php?id=<?= $row['id_czesci'] ?>" class="btn btn-primary mt-auto">Dodaj do koszyka</a>
<?php endif; ?>
          </div>
        </div>
      </div>
    <?php endwhile; ?>
  </div>
</div>
<script>
  document.querySelectorAll('.dodaj-koszyk').forEach(button => {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      alert('Musisz być zalogowany, aby dodać produkt do koszyka.');
    });
  });
</script>
