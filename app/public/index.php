<?php

$pdo = new PDO(
    'mysql:host=database;port=3306;dbname=database;charset=utf8',
    'user',
    'password');

$sql = "SELECT count(1) FROM `test`";

$stmt= $pdo->prepare($sql);
$stmt->execute();

var_dump($stmt->fetchAll());
