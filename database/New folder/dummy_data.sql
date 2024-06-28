-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table inkptatif.detail: ~20 rows (approximately)
INSERT INTO `detail` (`dosen_nip`, `mahasiswa_nim`, `seminar_id`, `kategori_id`, `kategori_id_status`) VALUES
	('130508072', '12250111514', 1, '1KP', 'PenG1'),
	('198102062009121003', '12250111514', 1, '1KP', 'PemB2'),
	('198105232007102003', '12250111514', 1, '1KP', 'PemB1'),
	('198612062015031004', '12250111514', 1, '1KP', 'PenG2'),
	('130510024', '12250111048', 2, '1KP', 'PemB1'),
	('130521007', '12250111048', 2, '1KP', 'PenG1'),
	('198606292015032007', '12250111048', 2, '1KP', 'PemB2'),
	('198904212023211026', '12250111048', 2, '1KP', 'PenG2'),
	('130508072', '12250111794', 3, '2TA', 'PemB2'),
	('130521007', '12250111794', 3, '2TA', 'PemB1'),
	('198102062009121003', '12250111794', 3, '2TA', 'PenG2'),
	('198105232007102003', '12250111794', 3, '2TA', 'PenG1'),
	('130510024', '12250120338', 4, '1KP', 'PemB2'),
	('1471094203900001', '12250120338', 4, '1KP', 'PemB1'),
	('150331387', '12250120338', 4, '2TA', 'PenG2'),
	('198612062015031004', '12250120338', 4, '1KP', 'PenG1'),
	('130508036', '12250111792', 5, '2TA', 'PenG2'),
	('130508072', '12250111792', 5, '2TA', 'PenG1'),
	('198606292015032007', '12250111792', 5, '2TA', 'PemB2'),
	('198612062015031004', '12250111792', 5, '2TA', 'PemB1');

-- Dumping data for table inkptatif.dosen: ~13 rows (approximately)
INSERT INTO `dosen` (`nip`, `nama`) VALUES
	('130508036', 'YUSRA, ST'),
	('130508072', 'IWAN ISKANDAR,M.T.'),
	('130510024', 'FITRI INSANI,S.T.,M.Kom.'),
	('130521007', 'LIZA AFRIYANTI, M.Kom\'),
	('1471094203900001', 'EKA PANDU CYNTHIA,S.T., M.Kom.'),
	('150331387', 'OKFALISA,Prof.Dr.S.T.,M.Sc'),
	('197102152000031002', 'JASRIL, S.Si., M.Sc.'),
	('197403192008012015', 'YELVI VITRIANI,S.Kom.,MMSI.'),
	('198102062009121003', 'FEBI YANTO, M. Kom.'),
	('198105232007102003', 'ELIN HAERANI,S.T.,M.Kom.'),
	('198606292015032007', 'ELVIA BUDIANITA, S.T., M.Sc.'),
	('198612062015031004', 'MUHAMMAD AFFANDES,S.T.,M.T.'),
	('198804262019032009', 'IIS AFRIANTY, S.T., M.Sc.'),
	('198904212023211026', 'PIZAINI,S.T.,M.Kom');

-- Dumping data for table inkptatif.kategori: ~8 rows (approximately)
INSERT INTO `kategori` (`id`, `jenis`, `status_id`) VALUES
	('1KP', 'KP', 'PemB1'),
	('1KP', 'KP', 'PemB2'),
	('1KP', 'KP', 'PenG1'),
	('1KP', 'KP', 'PenG2'),
	('2TA', 'TA', 'PemB1'),
	('2TA', 'TA', 'PemB2'),
	('2TA', 'TA', 'PenG1'),
	('2TA', 'TA', 'PenG2');

-- Dumping data for table inkptatif.kriteria: ~14 rows (approximately)
INSERT INTO `kriteria` (`id`, `jenis`, `kategori_id`, `kategori_status_id`) VALUES
	('D1KP', 'Tanggung Jawab', '1KP', 'PemB1'),
	('D1KP', 'Tanggung Jawab', '1KP', 'PemB2'),
	('D1TA', 'Usaha', '2TA', 'PemB1'),
	('D1TA', 'Usaha', '2TA', 'PemB2'),
	('D2KP', 'Kreatifitas', '1KP', 'PemB1'),
	('D2KP ', 'Kreatifitas', '1KP', 'PemB2'),
	('D2TA', 'Isi Laporan', '2TA', 'PemB1'),
	('D2TA', 'Isi Laporan', '2TA', 'PemB2'),
	('D3KP', 'Keberanian', '1KP', 'PemB1'),
	('D3KP', 'Keberanian', '1KP', 'PemB2'),
	('D3TA', 'Sikap', '2TA', 'PemB1'),
	('D3TA', 'Sikap', '2TA', 'PemB2'),
	('D4KP', 'Penguasaan Materi', '1KP', 'PemB1'),
	('D4KP', 'Penguasaan Materi', '1KP', 'PemB2');

-- Dumping data for table inkptatif.mahasiswa: ~24 rows (approximately)
INSERT INTO `mahasiswa` (`nim`, `nama`) VALUES
	('12250110342', 'Raka Sabri'),
	('12250110361', 'Haritsah Naufaldy'),
	('12250110382', 'Fajri'),
	('12250110979', 'Daffa Ikhwan Nurfauzan'),
	('12250111048', 'Muhammad Aditya Rinaldi'),
	('12250111134', 'M.Zaki Erbai Syas'),
	('12250111231', 'Muhammad Dhimaas'),
	('12250111298', 'Dwi Mahdini'),
	('12250111323', 'Gilang Ramadhan'),
	('12250111328', 'Farras Lathief'),
	('12250111346', 'Ogya Secio'),
	('12250111381', 'Fakhri'),
	('12250111489', 'Muhammad Rafly'),
	('12250111514', 'Ahmad Kurniawan'),
	('12250111527', 'M.Nabil Dawami'),
	('12250111603', 'Daffa Finanda'),
	('12250111759', 'Surya Hidayatullah'),
	('12250111792', 'Muhammad Faruq'),
	('12250111794', 'Hafidz Alhadid Rahman'),
	('12250120331', 'Dwi Jelita Adliyah'),
	('12250120338', 'Aufa Hajati'),
	('12250120341', 'Abmi Sukma'),
	('12250120360', 'Nurika Dwi Wahyuni'),
	('12250124357', 'Rahma Laksita');

-- Dumping data for table inkptatif.penilaian: ~24 rows (approximately)
INSERT INTO `penilaian` (`nilai`, `dosen_nip`, `mahasiswa_nim`, `kriteria_id`, `kriteria_id_kategori`, `kriteria_id_status`) VALUES
	(90, '130510024', '12250111048', 'D1KP', '1KP', 'PemB1'),
	(88, '198606292015032007', '12250111048', 'D1KP', '1KP', 'PemB2'),
	(82, '130510024', '12250111048', 'D2KP', '1KP', 'PemB1'),
	(89, '198606292015032007', '12250111048', 'D2KP', '1KP', 'PemB2'),
	(95, '130510024', '12250111048', 'D3KP', '1KP', 'PemB1'),
	(92, '198606292015032007', '12250111048', 'D3KP', '1KP', 'PemB2'),
	(95, '130510024', '12250111048', 'D4KP', '1KP', 'PemB1'),
	(90, '198606292015032007', '12250111048', 'D4KP', '1KP', 'PemB2'),
	(89, '198105232007102003', '12250111514', 'D1KP', '1KP', 'PemB1'),
	(90, '198102062009121003', '12250111514', 'D1KP', '1KP', 'PemB2'),
	(81, '198105232007102003', '12250111514', 'D2KP', '1KP', 'PemB1'),
	(87, '198102062009121003', '12250111514', 'D2KP', '1KP', 'PemB2'),
	(88, '198105232007102003', '12250111514', 'D3KP', '1KP', 'PemB1'),
	(89, '130508072', '12250111514', 'D3KP', '1KP', 'PemB2'),
	(85, '198102062009121003', '12250111514', 'D3KP', '1KP', 'PemB2'),
	(95, '198105232007102003', '12250111514', 'D4KP', '1KP', 'PemB1'),
	(92, '198102062009121003', '12250111514', 'D4KP', '1KP', 'PemB2'),
	(95, '130521007', '12250120338', 'D1KP', '1KP', 'PemB1'),
	(88, '130508072', '12250120338', 'D1KP', '1KP', 'PemB2'),
	(90, '130521007', '12250120338', 'D2KP', '1KP', 'PemB1'),
	(91, '130508072', '12250120338', 'D2KP', '1KP', 'PemB2'),
	(81, '130521007', '12250120338', 'D3KP', '1KP', 'PemB1'),
	(85, '130521007', '12250120338', 'D4KP', '1KP', 'PemB1'),
	(90, '130508072', '12250120338', 'D4KP', '1KP', 'PemB2');

-- Dumping data for table inkptatif.seminar: ~5 rows (approximately)
INSERT INTO `seminar` (`id`, `judul`, `tempat`, `waktu`) VALUES
	(1, 'Penggunaan Algoritma K', 'FST 5', '2024-05-18 00:03:25'),
	(2, 'Penerapan Algoritma C pada saat Pemilihan Keputusan di Aplikasi VoteApp', 'FST 5', '2024-06-18 00:04:04'),
	(3, 'Penggunaan Algoritma B dalam Menentukan Peluang Kemenangan di game B', 'FST 5', '2024-07-18 00:04:20'),
	(4, 'Penggunaan Algoritma D', 'FST 5', '2024-08-19 01:42:07'),
	(5, 'Efektivitas Penggunaan E-Wallet pada Mahasiswa Dengan Menggunakan Algoritma A', 'FST 2', '2024-09-19 01:48:15');

-- Dumping data for table inkptatif.status: ~4 rows (approximately)
INSERT INTO `status` (`id`, `jenis`) VALUES
	('PemB1', 'Pembimbing1'),
	('PemB2', 'Pembimbing2'),
	('PenG1', 'Penguji1'),
	('PenG2', 'Penguji2');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
