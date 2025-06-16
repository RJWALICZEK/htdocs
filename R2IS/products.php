<?php
session_start();
require_once "db.php";

// Mapa kategorii (jak wcześniej)
$kategorieMap = [
  'czesci_silnikowe' => ['id' => 2, 'nazwa' => 'Części silnikowe'],
  'uklad_napedowy'    => ['id' => 14, 'nazwa' => 'Układ napędowy'],
  'zawieszenie'       => ['id' => 15, 'nazwa' => 'Zawieszenie'],
  'hamulce'           => ['id' => 4, 'nazwa' => 'Hamulce'],
  'oleje_i_plyny'     => ['id' => 12, 'nazwa' => 'Oleje i płyny'],
  'elektryka'         => ['id' => 3, 'nazwa' => 'Elektryka'],
  'nadwozie_i_plastiki'=> ['id'=>10, 'nazwa'=>'Nadwozie i plastiki'],
  'kola'              => ['id' => 9, 'nazwa' => 'Koła'],
  'opony'             => ['id' => 13,'nazwa' => 'Opony'],
  'akcesoria_i_tuning'=> ['id'=>1, 'nazwa'=>'Akcesoria i tuning'],
  'kask_integralny'   => ['id'=>6, 'nazwa'=>'Kask integralny'],
  'kask_modularny'    => ['id'=>7, 'nazwa'=>'Kask modularny'],
  'kask_enduro'       => ['id'=>5, 'nazwa'=>'Kask enduro'],
  'kask_otwarty'      => ['id'=>8, 'nazwa'=>'Kask otwarty'],
  'narzedzia'         => ['id'=>11,'nazwa'=>'Narzędzia']
];

// Parametr GET do filtrowania kategorii
$kategoria = $_GET['kategoria'] ?? '';

// Parametr sortowania po cenie: 'asc' lub 'desc'
$sort_price = $_GET['sort_price'] ?? '';
if ($sort_price !== 'asc' && $sort_price !== 'desc') {
    $sort_price = '';  // brak sortowania lub domyślne
}

// Przygotuj część ORDER BY
$orderClause = '';
if ($sort_price === 'asc') {
    $orderClause = " ORDER BY c.cena ASC";
} elseif ($sort_price === 'desc') {
    $orderClause = " ORDER BY c.cena DESC";
}

// Budowa zapytania z filtrowaniem kategorii i ewentualnym sortowaniem
if ($kategoria && isset($kategorieMap[$kategoria])) {
    $id_kategoria = $kategorieMap[$kategoria]['id'];
    $displayCategoryName = $kategorieMap[$kategoria]['nazwa'];
    $sql = "
      SELECT c.*, p.znizka_procent
      FROM czesci c
      LEFT JOIN promocje p ON c.id_czesci = p.id_czesci
      WHERE c.id_kategoria = ?
      $orderClause
    ";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kategoria);
} else {
    $displayCategoryName = "Wszystkie";
    $sql = "
      SELECT c.*, p.znizka_procent
      FROM czesci c
      LEFT JOIN promocje p ON c.id_czesci = p.id_czesci
      $orderClause
    ";
    $stmt = $conn->prepare($sql);
}

$stmt->execute();
$result = $stmt->get_result();

// Sprawdzenie zalogowania
$isLoggedIn = isset($_SESSION['user_id']);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Produkty - <?= htmlspecialchars($displayCategoryName) ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="container my-4">
    <h2>Produkty z kategorii: <?= htmlspecialchars($displayCategoryName) ?></h2>

    <!-- Proste sortowanie po cenie -->
    <div class="mb-3">
      <span>Sortuj po cenie:</span>
      <?php
      // Zachowaj parametr kategorii w linkach sortowania
      $baseUrl = basename($_SERVER['PHP_SELF']);
      $queryParams = [];
      if ($kategoria && isset($kategorieMap[$kategoria])) {
          $queryParams['kategoria'] = $kategoria;
      }
      ?>
      <a href="#"
     link="<?= $baseUrl . '?' . http_build_query(array_merge($queryParams, ['sort_price'=>'asc'])) ?>"
     class="link btn btn-sm btn-outline-primary <?= $sort_price==='asc' ? 'active' : '' ?>">
    Rosnąco
  </a>
  <a href="#"
     link="<?= $baseUrl . '?' . http_build_query(array_merge($queryParams, ['sort_price'=>'desc'])) ?>"
     class="link btn btn-sm btn-outline-primary <?= $sort_price==='desc' ? 'active' : '' ?>">
    Malejąco
  </a>
  <?php if ($sort_price === ''): ?>
    <a href="#"
       link="<?= $baseUrl . '?' . http_build_query($queryParams) ?>"
       class="link btn btn-sm btn-outline-secondary">
      Domyślne
    </a>
  <?php else: ?>
    <!-- Link do usunięcia sortowania -->
    <a href="#"
       link="<?= $baseUrl . '?' . http_build_query($queryParams) ?>"
       class="link btn btn-sm btn-outline-secondary">
      Usuń sortowanie
    </a>
  <?php endif; ?>
    </div>

    <?php if (!$isLoggedIn): ?>
      <div class="alert alert-warning">
        Aby dodać do koszyka lub kupić, musisz być <a href="login.php">zalogowany</a>.
      </div>
    <?php endif; ?>

    <div class="row">
      <?php while ($row = $result->fetch_assoc()): ?>
        <?php
          // Oblicz cenę promocyjną, jeśli promocja=1 i znizka_procent > 0
          $znizka = isset($row['znizka_procent']) ? (int)$row['znizka_procent'] : 0;
          $cena_promocyjna = null;
          if ((int)$row['promocja'] === 1 && $znizka > 0) {
              $cena_promocyjna = $row['cena'] * (1 - $znizka / 100);
          }
        ?>
        <div class="col-6 col-md-3 mb-4">
          <div class="card h-100 d-flex flex-column">
            <img 
              src="img/products/<?= htmlspecialchars($row['grafika']) ?>" 
              class="card-img-top img-thumbnail"
              alt="<?= htmlspecialchars($row['nazwa']) ?>"
            >
            <div class="card-body d-flex flex-column">
              <h5 class="card-title"><?= htmlspecialchars($row['nazwa']) ?></h5>
              <!-- Opis w collapse -->
              <button class="btn btn-link p-0 mb-2 text-start" 
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

              <p class="card-text mt-auto">
                <strong>Cena:</strong>
                <?php if ($cena_promocyjna !== null): ?>
                  <span class="text-decoration-line-through text-muted">
                    <?= number_format($row['cena'], 2, ',', ' ') ?> zł
                  </span>
                  &nbsp;
                  <span class="text-danger fw-bold">
                    <?= number_format($cena_promocyjna, 2, ',', ' ') ?> zł
                  </span>
                <?php else: ?>
                  <?= number_format($row['cena'], 2, ',', ' ') ?> zł
                <?php endif; ?>
              </p>

              <div class="mt-auto">
                <?php if ($isLoggedIn): ?>
                  <form method="POST" action="dodaj_do_koszyka.php" class="d-inline">
                    <input type="hidden" name="id" value="<?= (int)$row['id_czesci'] ?>">
                    <button type="submit" class="btn btn-success btn-sm">Dodaj do koszyka</button>
                  </form>
                  <form method="POST" action="buy_now.php" class="d-inline">
                    <input type="hidden" name="product_id" value="<?= (int)$row['id_czesci'] ?>">
                    <button type="submit" class="btn btn-primary btn-sm">Kup teraz</button>
                  </form>
                <?php else: ?>
                  <button class="btn btn-success btn-sm" disabled onclick="alert('Musisz być zalogowany, aby dodać do koszyka.');">Dodaj do koszyka</button>
                  <button class="btn btn-primary btn-sm" disabled onclick="alert('Musisz być zalogowany, aby kupić.');">Kup teraz</button>
                <?php endif; ?>
              </div>
            </div>
          </div>
        </div>
      <?php endwhile; ?>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
