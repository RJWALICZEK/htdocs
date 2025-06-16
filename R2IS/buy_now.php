<?php
session_start();
require_once 'db.php';
if (!isset($_SESSION['user_id'])) {
    // można przekierować do logowania
    header('Location: index.php');
    exit;
}
$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $product_id = intval($_POST['product_id'] ?? 0);
    $ilosc = 1; // można rozbudować o wybór ilości
    if ($product_id <= 0) {
        $_SESSION['error'] = "Nieprawidłowy produkt.";
        header('Location: products.php');
        exit;
    }
    // Pobierz cenę produktu
    $stmt = $conn->prepare("SELECT cena, stan_magazynowy FROM czesci WHERE id_czesci = ?");
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res->num_rows === 0) {
        $_SESSION['error'] = "Produkt nie istnieje.";
        header('Location: products.php');
        exit;
    }
    $produkt = $res->fetch_assoc();
    if ($produkt['stan_magazynowy'] < $ilosc) {
        $_SESSION['error'] = "Brak wystarczającego stanu magazynowego.";
        header('Location: products.php');
        exit;
    }
    $cena = $produkt['cena'];
    $stmt->close();

    // Tworzymy zamówienie: w uproszczeniu jedno produkt jedno zamówienie
    $data = date('Y-m-d');
    $suma = $cena * $ilosc;
    // Wstaw do zamowienia
    $stmt2 = $conn->prepare("INSERT INTO zamowienia (id_uzytkownik, data, suma) VALUES (?, ?, ?)");
    $stmt2->bind_param("isd", $user_id, $data, $suma);
    $stmt2->execute();
    $order_id = $conn->insert_id;
    $stmt2->close();

    // Wstaw pozycję
    $stmt3 = $conn->prepare("INSERT INTO pozycje_zamowienia (id_zamowienia, id_czesci, ilosc, cena_jednostkowa) VALUES (?, ?, ?, ?)");
    $stmt3->bind_param("iiid", $order_id, $product_id, $ilosc, $cena);
    $stmt3->execute();
    $stmt3->close();

    // Zmniejsz stan magazynowy
    $stmt4 = $conn->prepare("UPDATE czesci SET stan_magazynowy = stan_magazynowy - ? WHERE id_czesci = ?");
    $stmt4->bind_param("ii", $ilosc, $product_id);
    $stmt4->execute();
    $stmt4->close();

    $_SESSION['success'] = "Zamówienie zostało złożone. ID: $order_id";
    header('Location: index.php');
    exit;
} else {
    header('Location: index.php');
    exit;
}
