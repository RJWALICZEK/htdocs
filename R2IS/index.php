<!DOCTYPE html>
<html lang="pl-PL">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- jquery dla app.js, ladowanie do main i promocje -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="app.js" defer></script> <!-- defer czeka ze skryptem do czasu zaladowania calej strony -->
  <link rel="icon" href="img/motorcycle.png" type="image/x-icon">


  <title>Walmech</title>
</head>

<body>

<!-- gorny pasek -->
  <div class="container-fluid header-top">
      <div>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">Zaloguj</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#registerModal">Rejestracja</button>            
      </div>
      <div>
  <img src="img/logo.png" alt="Logo" class="logo-link link" link="home.php">
</div>
  </div>

  <!-- glowna -->
  <div class="container-fluid">

      <div id="header-carousel" class="carousel slide mb-4 rounded-3 overflow-hidden" data-bs-ride="carousel">
        <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="img/slide/slide1.png" class="d-block w-100" alt="Slajd 1">
        </div>
        <div class="carousel-item">
          <img src="img/slide/slide2.png" class="d-block w-100" alt="Slajd 2">
        </div>
        <div class="carousel-item">
          <img src="img/slide/slide3.png" class="d-block w-100" alt="Slajd 3">
        </div>
        <div class="carousel-item">
          <img src="img/slide/slide4.png" class="d-block w-100" alt="Slajd 3">
        </div>
        <div class="carousel-item">
          <img src="img/slide/slide5.png" class="d-block w-100" alt="Slajd 3">
        </div>
        <div class="carousel-item">
          <img src="img/slide/slide6.png" class="d-block w-100" alt="Slajd 3">
        </div>
        </div>

        <!-- Tekst nagłówka na środku -->
        <div class="carousel-caption">
          <h2 >Witamy w sklepie Walmech!</h2>
          <p >Części i akcesoria do skuterów - silnik, zawieszenie, tuning i więcej.</p>
        </div>
      </div>

        
      <!-- panel boczny z przyciskami -->
      <div class="container-fluid">
      <div class="row">
        <div class="col-md-3">
                <div id="menu" class="btn-group-vertical m-1">
              <button type="button" link="home.php" class="link btn btn-primary">Strona główna</button>
              <button type="button" class="btn btn-primary link" link="products.php?kategoria=">Wszystkie produkty</button>
                <div class="btn-group dropend">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Części</button>
                  <ul class="dropdown-menu">
                      <li><button class="link dropdown-item" type="button"  link="products.php?kategoria=czesci_silnikowe">Części silnikowe</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=uklad_napedowy">Układ napędowy</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=zawieszenie">Zawieszenie</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=hamulce">Hamulce</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=elektryka">Elektryka</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=nadwozie_i_plastiki">Nadwozie i plastiki</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=kola">Koła</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=akcesoria_i_tuning">Akcesoria i tuning</button></li>
                    </ul>
                </div>  
              <div class="btn-group dropend">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Kaski</button>
                  <ul class="dropdown-menu">
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=kask_integralny">Kask integralny</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=kask_modularny">Kask modularny</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=kask_otwarty">Kask otwarty</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=kask_enduro">Kask enduro</button></li>
                    </ul>
                </div>    
              <div class="btn-group dropend">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Serwis i narzędzia</button>
                  <ul class="dropdown-menu">
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=oleje_i_plyny">Oleje i płyny</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=narzedzia">Narzędzia</button></li>
                      <li><button class="link dropdown-item" type="button" link="products.php?kategoria=opony">Opony</button></li>
                    </ul>
                </div>    
              <button type="button" link="contact.php" class="link btn btn-info">Kontakt</button>
            </div>
        </div>
         <!--kontener po prawej od panelu -->
        <div class="col-md-9 text-center">                 
          <div class="" id="sale">
              <!-- Tu będą promocje ładowane z serwera -->
          </div>  
        </div>
      </div>
    </div>
    <div id="main" >
          <!-- kontener do wyswietlania zawartosci -->
    </div>
    <div id="content">
      <!-- testowy kontener -->
    </div>
    <<!--stopka -->
      <footer class="d-flex justify-content-between px-4 py-3 bg-light mt-4 border-top">
        <div class="col-md-6 text-center">Sklep z czesciami do skuterów, projekt zaliczeniowy</div>
          <div class="col-md-6 text-center">© Copyright © 2025 by Rafał Waliczek All Rights Reserved.</div>
    </footer>
  </div>
  
  <?php include 'modal-login.php'; ?>
  <?php include 'modal-register.php'; ?>
</body>

</html>