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

  <title>Sklep "Enter"</title>
</head>

<body>
  <div class="jumbotron text-center">
    <h1>Sklep kołki i gwoździe</h1>
    <p>Projekt za zaliczenie BD</p>
  </div>

  <div class="row text-center" id="menu">
    <div class="col-md-12">
      <div class="btn-group">
        <button type="button" link="home.php" class="link btn btn-primary">HOME</button>
        <button type="button" link="klienci.php" class="link btn btn-primary">KLIENCI</button>
        <button type="button" link="towary.php" class="link btn btn-primary">TOWARY</button>
        <button type="button" link="zamowienia.php" class="link btn btn-primary">Zamówienia</button>
        <button type="button" link="kontakt.php" class="link btn btn-primary">Kontakt</button>
      <?PHP
        session_start();
        if(isset($_SESSION['login'])){?>

          <button type="button" link="logout.php" class="link btn btn-primary"> <i class="bi bi-unlock-fill"></i> LOGOUT</button>
        <?PHP
        } 
        else{
          ?>
          <button type="button" link="logowanie.php" class="link btn btn-primary"> <i class="bi bi-lock-fill"></i> LOGOWANIE</button>
      <?PHP } ;
      ?>
       
        
      </div>
    </div>

  </div>

  <div class="row" id="main">
    <div class="col-md-12">Witaj w sklepie z ......</div>

  </div>

  <div class="row text-center" id="footer">
    <div class="col-md-6">(c) AP 2025</div>
    <div class="col-md-6">All Right Reserved.</div>
  </div>

</body>

</html>