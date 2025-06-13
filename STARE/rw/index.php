<!DOCTYPE html>
<html lang="pl-PL">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/style.css">
  <script type="text/javascript" src="app.js" defer></script>

  <title>Sklep z częściami do skuterów</title>
</head>

<body>
  <div class="jumbotron text-center">
    <h1>Sklep z częściami do skuterów</h1>
    <p>Najlepsze części i akcesoria do Twojego skutera!</p>
  </div>

  <div class="row text-center" id="menu">
    <div class="col-md-12">
      <div class="btn-group">
        <button type="button" link="home.php" class="link btn btn-primary">Strona główna</button>
        <button type="button" link="produkty.php" class="link btn btn-primary">Części</button>
        <button type="button" link="koszyk.php" class="link btn btn-primary">Koszyk</button>
        <button type="button" link="zamowienia.php" class="link btn btn-primary">Zamówienia</button>
        <button type="button" link="kontakt.php" class="link btn btn-primary">Kontakt</button>
        <?PHP
          session_start();
          if(isset($_SESSION['login'])) {
        ?>
            <button type="button" link="logout.php" class="link btn btn-primary">
              <i class="bi bi-unlock-fill"></i> Wyloguj
            </button>
        <?PHP
          } else {
        ?>
            <button type="button" link="logowanie.php" class="link btn btn-primary">
              <i class="bi bi-lock-fill"></i> Zaloguj
            </button>
        <?PHP } ?>
      </div>
    </div>
  </div>

  <div class="row" id="main">
    <div class="col-md-12 text-center p-4">
      <h2>Witaj w naszym sklepie!</h2>
      <p>Oferujemy szeroki wybór części do skuterów: silniki, układ napędowy, oświetlenie, akcesoria i wiele więcej.</p>
      <p>Wybierz kategorię z menu powyżej i znajdź potrzebne części szybko i wygodnie.</p>
    </div>
  </div>

  <div class="row text-center bg-light py-3" id="footer">
    <div class="col-md-6">&copy; Sklep Skuterowy 2025</div>
    <div class="col-md-6">Wszelkie prawa zastrzeżone.</div>
  </div>
</body>

</html>
