<form method="post">
  <input type="text" name="login" placeholder="Login" required class="form-control mb-2">
  <input type="password" name="haslo" placeholder="Hasło" required class="form-control mb-2">
  <button type="submit" name="zaloguj" class="btn btn-primary">Zaloguj</button>
</form>

<?php
session_start();
require_once("db.php");

if (isset($_POST['zaloguj'])) {
    $login = $_POST['login'];
    $haslo = sha1($_POST['haslo']);

    $sql = "SELECT * FROM users WHERE login='$login' AND haslo='$haslo'";
    $res = $conn->query($sql);

    if ($res->num_rows == 1) {
        $_SESSION['login'] = $login;
        header("Location: home.php");
    } else {
        echo "<p class='text-danger'>Błędne dane logowania</p>";
    }
}
?>