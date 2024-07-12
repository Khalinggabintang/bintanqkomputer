<?php

header('Content-Type: application/json');

// Dummy database credentials
$servername = "localhost";
$username = "mobw7774_bintanq";
$password = "Vinemusic2023.";
$dbname = "mobw7774_api_khalingga";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve POST data
$name = $_POST['name'];
$address = $_POST['address'];
$expedition = $_POST['expedition'];
$totalPrice = $_POST['total_price'];
$items = $_POST['items'];

// Basic input validation
if (empty($name) || empty($address) || empty($expedition) || empty($totalPrice) || empty($items)) {
    echo json_encode(array('success' => false, 'message' => 'Semua field harus diisi'));
    exit;
}

// Simpan data ke database
$sql = "INSERT INTO payments (name, address, expedition, total_price, items) VALUES ('$name', '$address', '$expedition', '$totalPrice', '$items')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(array('success' => true, 'message' => 'Data pembayaran berhasil disimpan'));
} else {
    echo json_encode(array('success' => false, 'message' => 'Error: ' . $sql . '<br>' . $conn->error));
}

$conn->close();
?>
