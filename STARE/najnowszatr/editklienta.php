<?php
        include 'dbconfig.php';
        session_start();
        $id=$_GET['id'];
        $conn = new mysqli($server, $user, $password, $dbname);
        if ($conn->connect_error) {
            die("Błąd połączenia z BD: " . $conn->connect_error);
        }

        $zapytanie = "SELECT * FROM klienci WHERE `klienci`.`id` = $id LIMIT 1;";

        $result = $conn->query($zapytanie);

        if ($result->num_rows > 0) {
           
            while ($row = $result->fetch_assoc()) {  //$row["nazwa"]
               
          ?>

<h2>Edycja klientów</h2>

<form action="zapisz_editklienta.php" method="post">
    <div class="form-group">
        <input type="text" name="id" value="<?PHP echo $row['id'];?>" hidden>
        <label for="nazwa">Nazwa:</label>
        <input type="text" class="form-control" id="nazwa" name="nazwa" value="<?PHP echo $row['nazwa'];?>" autocomplete="off">
    </div>
    <div class="form-group">
        <label for="adres">Adres:</label>
        <input type="text" class="form-control" id="adres" name="adres" value="<?PHP echo $row['adres'];?>" autocomplete="off">
    </div>
    <div class="form-group">
        <label for="opis">Opis:</label>
        <textarea type="text" class="form-control" id="opis" name="opis" autocomplete="off">
        <?PHP echo $row['opis'];?>
        </textarea>
    </div>

    <button type="submit" class="btn btn-primary">Popraw</button>
</form>

<?PHP
            };
        } else {
            echo "0 results";
        }

        $conn->close();
        ?>