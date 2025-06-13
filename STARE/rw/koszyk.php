<?php
session_start();
require_once("db.php");

if (!isset($_SESSION["koszyk"])) {
    $_SESSION["koszyk"] = [];
}

if (isset($_POST["dodaj"])) {
    $id = $_POST["id"];
    if (!isset($_SESSION["koszyk"][$id])) {
        $_SESSION["koszyk"][$id] = 1;
    } else {
        $_SESSION["koszyk"][$id]++;
    }
}

if (isset($_GET["usun"])) {
    unset($_SESSION["koszyk"][$_GET["usun"]]);
}

echo "<h2>Twój koszyk</h2><ul>";

if (empty($_SESSION["koszyk"])) {
    echo "<p>Koszyk jest pusty.</p>";
} else {
    foreach ($_SESSION["koszyk"] as $id => $ilosc) {
        $result = $conn->query("SELECT * FROM produkty WHERE id = $id");
        if ($produkt = $result->fetch_assoc()) {
            echo "<li>" . htmlspecialchars($produkt["nazwa"]) . " – sztuk: $ilosc ";
            echo '<a href="koszyk.php?usun=' . $id . '" class="btn btn-sm btn-danger ml-2">Usuń</a></li>';
        }
    }
    echo '<br><a href="zamowienie.php" class="btn btn-primary">Przejdź do zamówienia</a>';
}
echo "</ul>";
?>