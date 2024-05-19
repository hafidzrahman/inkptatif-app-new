<?php

include "koneksi.php";

if (isset($_GET['nip']) && isset($_GET['kategori']) && isset($_GET['status'])) {
$statement = $pdo->prepare("select penilaian.nilai, mahasiswa.nama, mahasiswa.nim from dosen, mahasiswa, kategori, detail, seminar, penilaian
where dosen.nip = :nip
and kategori.id = :kategori 
and dosen.nip = detail.nip 
and kategori.id = detail.id_kategori 
and detail.id_seminar = seminar.id 
and detail.nim = mahasiswa.nim 
and kategori.id_status = detail.id_status
and penilaian.nip = :nip
and penilaian.id_kategori = :kategori
and penilaian.nim = mahasiswa.nim
and substr(penilaian.id_status,2,3) = :status
group by mahasiswa.nim, dosen.nip, kategori.id, penilaian.nilai;");

$statement->bindParam(':nip', $_GET['nip'], PDO::PARAM_STR);
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