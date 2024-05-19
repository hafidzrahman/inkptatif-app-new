<?php
$pdo = new PDO("mysql:host=localhost:3306;dbname=inkptatif_v4", 'root', 'test');
$pdo->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, false);

?>