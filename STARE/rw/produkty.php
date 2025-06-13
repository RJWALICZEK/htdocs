<?php
session_start();
require_once("db.php");

$result = $conn->query("SELECT * FROM produkty ORDER BY nazwa ASC");

echo '<div class="container"><div class="row">';
while ($row = $result->fetch_assoc()) {
    echo '<div class="col-md-4 mb-4">';
    echo '<div class="card">';
    echo '<div class="card-body">';
    echo '<h5 class="card-title">' . htmlspecialchars($row['nazwa']) . '</h5>';
    echo '<p class="card-text">Cena: ' . round($row['cena'], 2) . ' zł</p>';
    echo '<form method="post" action="koszyk.php">';
    echo '<input type="hidden" name="id" value="' . $row['id'] . '">';
    echo '<button type="submit" name="dodaj" class="btn btn-success">Dodaj do koszyka</button>';
    echo '</form>';
    echo '</div></div></div>';
}
echo '</div></div>';
?>