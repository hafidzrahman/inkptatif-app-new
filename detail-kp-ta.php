<?php

include "koneksi.php";

if (isset($_GET['nim']) && isset($_GET['kategori']) && isset($_GET['status'])) {
$statement = $pdo->prepare("select seminar.judul, seminar.tempat, seminar.tanggal, dosen.nama, keterangan.jenis  from dosen, mahasiswa, kategori, detail, seminar, keterangan
where kategori.id = :kategori
and dosen.nip = detail.nip 
and kategori.id = detail.id_kategori 
and detail.id_seminar = seminar.id 
and detail.nim = mahasiswa.nim 
and mahasiswa.nim = :nim
and detail.id_status = kategori.id_status
and kategori.id_status = keterangan.id
and substr(detail.id_status,2,3) = :status;
");

$statement->bindParam(':nim', $_GET['nim'], PDO::PARAM_STR);
$statement->bindParam(':kategori', $_GET['kategori'], PDO::PARAM_STR);
$statement->bindParam(':status', $_GET['status'], PDO::PARAM_STR);

$statement->execute();

$result = $statement->fetchAll(PDO::FETCH_ASSOC);

$json = json_encode($result);

header("Access-Control-Allow-Origin: *");

echo  $json; }

else {
    echo "Parameter not Complete";
}

?>