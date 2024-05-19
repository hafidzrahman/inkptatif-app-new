<?php

include "koneksi.php";

if (isset($_GET['nip']) && isset($_GET['kategori']) && isset($_GET['status']) && isset($_GET['nim']) && isset($_GET['nilai']) && isset($_GET['id'])) {
$statement = $pdo->prepare("
update penilaian set nilai = :nilai
where penilaian.id_kriteria = :id 
and penilaian.nim = :nim 
and penilaian.nip = :nip 
and penilaian.id_kategori = :kategori 
and substr(penilaian.id_status,2,3) = :status;");

// $statement = $pdo->prepare("update penilaian set nilai = 95
// where penilaian.id_kriteria = '2' and penilaian.nim = '223848' and penilaian.nip='1223444' and penilaian.id_kategori = '123' and penilaian.id_status = '1PM';");

$statement->bindParam(':nip', $_GET['nip'], PDO::PARAM_STR);
$statement->bindParam(':kategori', $_GET['kategori'], PDO::PARAM_STR);
$statement->bindParam(':status', $_GET['status'], PDO::PARAM_STR);
$statement->bindParam(':nim', $_GET['nim'], PDO::PARAM_STR);
$statement->bindParam(':nilai', $_GET['nilai'], PDO::PARAM_STR);
$statement->bindParam(':id', $_GET['id'], PDO::PARAM_STR);

$statement->execute();


header("Access-Control-Allow-Origin: *");

}

else {
    echo "Parameter not Complete";
}

?>