<?php
include 'config.php';

$name = $_POST['name'];
$message = $_POST['message'];

$sql = "INSERT INTO feedbacks (name, message) VALUES ('$name', '$message')";

if ($connection->query($sql) === TRUE) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => $connection->error]);
}

$connection->close();
?>
