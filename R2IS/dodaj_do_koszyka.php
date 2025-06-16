<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}
$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $product_id = intval($_POST['product_id'] ?? 0);
    $ilosc = 1; 
    if ($product_id <= 0) {
        $_SESSION['error'] = "Nieprawidłowy produkt.";
        header('Location: index.php');
        exit;
    }

    $stmt = $conn->prepare("SELECT cena, stan_magazynowy FROM czesci WHERE id_czesci = ?");
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res->num_rows === 0) {
        $_SESSION['error'] = "Produkt nie istnieje.";
        header('Location: index.php');
        exit;
    }
    $produkt = $res->fetch_assoc();
    if ($produkt['stan_magazynowy'] < $ilosc) {
        $_SESSION['error'] = "Brak wystarczającego stanu magazynowego.";
        header('Location: index.php');
        exit;
    }
    $cena = $produkt['cena'];
    $stmt->close();

    $data = date('Y-m-d');
    $suma = $cena * $ilosc;
 
    $stmt2 = $conn->prepare("INSERT INTO zamowienia (id_uzytkownik, data, suma) VALUES (?, ?, ?)");
    $stmt2->bind_param("isd", $user_id, $data, $suma);
    $stmt2->execute();
    $order_id = $conn->insert_id;
    $stmt2->close();


    $stmt3 = $conn->prepare("INSERT INTO pozycje_zamowienia (id_zamowienia, id_czesci, ilosc, cena_jednostkowa) VALUES (?, ?, ?, ?)");
    $stmt3->bind_param("iiid", $order_id, $product_id, $ilosc, $cena);
    $stmt3->execute();
    $stmt3->close();

    $stmt4 = $conn->prepare("UPDATE czesci SET stan_magazynowy = stan_magazynowy - ? WHERE id_czesci = ?");
    $stmt4->bind_param("ii", $ilosc, $product_id);
    $stmt4->execute();
    $stmt4->close();

    $_SESSION['success'] = "Produkt został dodany ko koszyka";
    header('Location: index.php');
    exit;
} else {
    header('Location: index.php');
    exit;
}
