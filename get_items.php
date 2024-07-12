<?php
include 'config.php';

$sql = "SELECT * FROM items";
$result = $connection->query($sql);

$items = [];
while($row = $result->fetch_assoc()) {
    $items[] = $row;
}

echo json_encode($items);

$connection->close();
?>
