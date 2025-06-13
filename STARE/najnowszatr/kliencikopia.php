<h2>Klienci</h2>

<table class="table table-hover table-sm">
    <thead>
        <tr>
            <th>Lp.</th>
            <th>Nazwa</th>
            <th>Adres</th>
            <th>Opis</th>
        </tr>
    </thead>
    <tbody>
        <?php
        include 'dbconfig.php';

        $conn = new mysqli($server, $user, $password, $dbname);
        if ($conn->connect_error) {
            die("Błąd połączenia z BD: " . $conn->connect_error);
        }

        $zapytanie = "SELECT * FROM klienci";

        $result = $conn->query($zapytanie);

        if ($result->num_rows > 0) {
            $licznik = 1;
            while ($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $licznik++ . "</td><td>" . $row["nazwa"] . "</td><td>" . $row["adres"] . "</td><td>" . $row["opis"] . "</td></tr>\n";
            }
        } else {
            echo "0 results";
        }

        $conn->close();
        ?>
    </tbody>
</table>

<h2>Dodawanie klientów</h2>

<form action="dodaj_klienta.php" method="post">
    <div class="form-group">
        <label for="nazwa">Nazwa:</label>
        <input type="text" class="form-control" id="nazwa" name="nazwa" placeholder="Wpisz nazwę" autocomplete="off">
    </div>
    <div class="form-group">
        <label for="adres">Adres:</label>
        <input type="text" class="form-control" id="adres" name="adres" placeholder="Wpisz adres" autocomplete="off">
    </div>
    <div class="form-group">
        <label for="opis">Opis:</label>
        <textarea type="text" class="form-control" id="opis" name="opis" placeholder="Możesz wpisać opis"
            autocomplete="off">
        </textarea>
    </div>

    <button type="submit" class="btn btn-primary">Dodaj</button>
</form>

</body>

</html>