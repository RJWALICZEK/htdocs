<?PHP


include 'dbconfig.php';
$id = $_GET['id'];
$conn = new mysqli($server, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Błąd połączenia z BD: " . $conn->connect_error);
}

$zapytanie = "DELETE FROM klienci WHERE `klienci`.`id` = $id LIMIT 1;";
            
$result = $conn->query($zapytanie);

$conn->close();
?>
