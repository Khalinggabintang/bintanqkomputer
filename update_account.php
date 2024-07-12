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
$username = $_POST['username'];
$oldPassword = $_POST['old_password'];
$newPassword = $_POST['new_password'];

// Basic input validation
if (empty($username) || empty($oldPassword) || empty($newPassword)) {
    echo json_encode(array('success' => false, 'message' => 'Username, old password, and new password must not be empty'));
    exit;
}

// Validate current password
$sql = "SELECT * FROM users WHERE username = '$username' AND password = '$oldPassword'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Update the password
    $updateSql = "UPDATE users SET password = '$newPassword' WHERE username = '$username'";
    
    if ($conn->query($updateSql) === TRUE) {
        echo json_encode(array('success' => true, 'message' => 'Password updated successfully'));
    } else {
        echo json_encode(array('success' => false, 'message' => 'Error updating password: ' . $conn->error));
    }
} else {
    echo json_encode(array('success' => false, 'message' => 'Invalid username or old password'));
}

$conn->close();
?>
