<?php
include 'config.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE username='$username'";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    // Memeriksa apakah password cocok
    if ($password === $row['password']) { // Pastikan 'password' adalah nama kolom yang tepat di tabel Anda
        echo json_encode(["message" => "Login successful", "user" => $row]);
    } else {
        echo json_encode(["message" => "Invalid password"]);
    }
} else {
    echo json_encode(["message" => "User not found"]);
}

// Tutup koneksi jika sudah selesai
$connection->close();
?>