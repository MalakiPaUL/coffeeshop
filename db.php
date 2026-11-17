<?php
// Gertrudes Cafe — Database connection (XAMPP: MariaDB/MySQL via PDO)
header('Content-Type: application/json; charset=utf-8');

$host = '127.0.0.1';
$db   = 'coffeedb';
$user = 'root';
$pass = '';
$port = 3306;

try {
  $pdo = new PDO(
    "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4",
    $user,
    $pass,
    [
      PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
      PDO::ATTR_EMULATE_PREPARES   => false,
    ]
  );
} catch (PDOException $e) {
  http_response_code(500);
  echo json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]);
  exit;
}
