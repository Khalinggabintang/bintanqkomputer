<?php
$connection = new mysqli("localhost", "mobw7774_bintanq", "Vinemusic2023.", "mobw7774_api_khalingga");
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
?>
