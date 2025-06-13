<?php
if (isset($_POST['zaloguj'])) {
    header("Location: logowanie.php");
    exit();
}
elseif (isset($_POST['rejestracja'])) {
    header("Location: rejestracja.php");
    exit();
}
?>
