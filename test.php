<?php

include "koneksi.php";

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
// header("Content-type:application/json;charset=utf-8"); 
header("Access-Control-Allow-Methods: POST");

$statement = $pdo->prepare("SELECT * FROM DOSEN");
$statement->execute();


$result = $statement->fetchAll(PDO::FETCH_ASSOC);


$json = json_encode($result);




echo $json;



?>

