<?php
if (!isset($_SESSION['user_id'])) {
    return;
}

require_once 'db.php';

$user_id = $_SESSION['user_id'];

$sql_orders = "SELECT id_zamowienia, data, suma FROM zamowienia WHERE id_uzytkownik = ? ORDER BY data DESC";
$stmt_orders = $conn->prepare($sql_orders);
$stmt_orders->bind_param("i", $user_id);
$stmt_orders->execute();
$result_orders = $stmt_orders->get_result();

$orders = [];
$total_all_orders = 0;

while ($order = $result_orders->fetch_assoc()) {
    $sql_items = "
        SELECT p.id_pozZamowienia, p.id_czesci, p.ilosc, p.cena_jednostkowa,
               c.nazwa, c.grafika,
               IFNULL(pr.znizka_procent, 0) AS znizka_procent
        FROM pozycje_zamowienia p
        JOIN czesci c ON p.id_czesci = c.id_czesci
        LEFT JOIN promocje pr ON c.id_czesci = pr.id_czesci
        WHERE p.id_zamowienia = ?
    ";
    $stmt_items = $conn->prepare($sql_items);
    $stmt_items->bind_param("i", $order['id_zamowienia']);
    $stmt_items->execute();
    $result_items = $stmt_items->get_result();

    $items = [];
    $total_order_value = 0;

    while ($item = $result_items->fetch_assoc()) {
        $price_after_discount = $item['cena_jednostkowa'];
        if ($item['znizka_procent'] > 0) {
            $price_after_discount *= (1 - $item['znizka_procent'] / 100);
        }
        $item['price_after_discount'] = $price_after_discount;
        $items[] = $item;
        $total_order_value += $price_after_discount * $item['ilosc'];
    }

    $order['items'] = $items;
    $order['total_value'] = $total_order_value;
    $total_all_orders += $total_order_value;

    $orders[] = $order;
}
?>

<!-- Modal Koszyka / Zamówień -->
<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartModalLabel">Twoje zamówienia</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Zamknij"></button>
      </div>
      <div class="modal-body">

        <?php if (empty($orders)): ?>
            <p>Nie masz jeszcze żadnych zamówień.</p>
        <?php else: ?>
           <?php foreach ($orders as $order): ?>
    <?php if (empty($order['items'])) continue; ?>
    <div class="mb-4 border rounded p-3">
                    <table class="table table-sm small align-middle text-nowrap">
                        <thead>
  <tr>
    <th>Nazwa</th>
    <th>Ilość</th>
    <th>Cena jedn. (z rabatem)</th>
    <th>Wartość</th>
    <th>Usuń</th>
  </tr>
</thead>
<tbody>
<?php foreach ($order['items'] as $item): ?>
  <tr>
    <td><?= htmlspecialchars($item['nazwa']) ?></td>
    <td><?= (int)$item['ilosc'] ?></td>
    <td>
      <?= number_format($item['price_after_discount'], 2, ',', ' ') ?> zł
      <?php if ($item['znizka_procent'] > 0): ?>
        <br><small class="text-success">-<?= (int)$item['znizka_procent'] ?>%</small>
      <?php endif; ?>
    </td>
    <td><?= number_format($item['price_after_discount'] * $item['ilosc'], 2, ',', ' ') ?> zł</td>
    <td>
      <form method="post" action="delete_item.php" style="display:inline;">
        <input type="hidden" name="id_pozZamowienia" value="<?= $item['id_pozZamowienia'] ?>">
        <button type="submit" class="btn btn-sm btn-danger">Usuń</button>
      </form>
    </td>
  </tr>
<?php endforeach; ?>
</tbody>
                    </table>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>

      </div>
      <div class="modal-footer d-flex justify-content-between align-items-center">
        <div class="fw-bold text-primary">
          Łączna wartość: <?= number_format($total_all_orders, 2, ',', ' ') ?> zł
        </div>
        <div>
          <button class="btn btn-primary " onclick="alert('Twoje zamowienie jest w trakcie realizacji');">Kup teraz</button>
          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Zamknij</button>
        </div>
      </div>
    </div>
  </div>
</div>
