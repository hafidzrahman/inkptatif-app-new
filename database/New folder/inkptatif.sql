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


-- Dumping database structure for inkptatif_v4
CREATE DATABASE IF NOT EXISTS `inkptatif_v4` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `inkptatif_v4`;

-- Dumping structure for table inkptatif_v4.detail
CREATE TABLE IF NOT EXISTS `detail` (
  `id_seminar` int(3) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `id_kategori` varchar(3) NOT NULL,
  `id_status` varchar(3) NOT NULL,
  PRIMARY KEY (`id_seminar`,`nip`,`id_kategori`,`id_status`,`nim`),
  KEY `detail_dosen_fk` (`nip`),
  KEY `detail_kategori_fk` (`id_kategori`,`id_status`),
  KEY `detail_mahasiswa_fk` (`nim`),
  CONSTRAINT `detail_dosen_fk` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  CONSTRAINT `detail_kategori_fk` FOREIGN KEY (`id_kategori`, `id_status`) REFERENCES `kategori` (`id`, `id_status`),
  CONSTRAINT `detail_mahasiswa_fk` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  CONSTRAINT `detail_seminar_fk` FOREIGN KEY (`id_seminar`) REFERENCES `seminar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.detail: ~3 rows (approximately)
INSERT INTO `detail` (`id_seminar`, `nip`, `nim`, `id_kategori`, `id_status`) VALUES
	(111, '1223545', '223141', '123', '1PM'),
  (555, '1223545', '223545', '123', '1PM'),
	(222, '1223545', '223242', '124', '1PN'),
	(333, '1223545', '223343', '123', '1PM'),
	(444, '1223545', '223444', '124', '2PN');

  INSERT INTO `detail` (`id_seminar`, `nip`, `nim`, `id_kategori`, `id_status`) VALUES
	(111, '1223545', '223848', '123', '1PM');


-- Dumping structure for table inkptatif_v4.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.dosen: ~4 rows (approximately)
INSERT INTO `dosen` (`nip`, `nama`) VALUES
	('1223141', 'PIZAINI'),
	('1223242', 'SITI RAMADHANI'),
	('1223343', 'M. AFFANDES'),
	('1223444', 'IWAN ISKANDAR'),
	('1223545', 'ELVIA BUDIANITA');

-- Dumping structure for table inkptatif_v4.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` varchar(3) NOT NULL,
  `jenis` varchar(2) NOT NULL,
  `id_status` varchar(3) NOT NULL,
  PRIMARY KEY (`id`,`id_status`),
  KEY `kategori_status_fk` (`id_status`),
  CONSTRAINT `kategori_status_fk` FOREIGN KEY (`id_status`) REFERENCES `keterangan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.kategori: ~8 rows (approximately)
INSERT INTO `kategori` (`id`, `jenis`, `id_status`) VALUES
	('123', 'KP', '1PM'),
	('123', 'KP', '1PN'),
	('123', 'KP', '2PM'),
	('123', 'KP', '2PN'),
	('124', 'TA', '1PM'),
	('124', 'TA', '1PN'),
	('124', 'TA', '2PM'),
	('124', 'TA', '2PN');

-- Dumping structure for table inkptatif_v4.keterangan
CREATE TABLE IF NOT EXISTS `keterangan` (
  `id` varchar(3) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.keterangan: ~3 rows (approximately)
INSERT INTO `keterangan` (`id`, `jenis`) VALUES
	('1PM', 'PEMBI1'),
	('1PN', 'PENGUJI1'),
	('2PM', 'PEMBI2'),
	('2PN', 'PENGUJI2');

-- Dumping structure for table inkptatif_v4.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `id` varchar(5) NOT NULL,
  `id_kategori` varchar(3) NOT NULL,
  `id_status` varchar(3) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`id_kategori`,`id_status`),
  KEY `kriteria_kategori_fk` (`id_kategori`,`id_status`),
  CONSTRAINT `kriteria_kategori_fk` FOREIGN KEY (`id_kategori`, `id_status`) REFERENCES `kategori` (`id`, `id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.kriteria: ~6 rows (approximately)
INSERT INTO `kriteria` (`id`, `id_kategori`, `id_status`, `keterangan`) VALUES
	('1', '123', '1PN', 'Tanya Jawab'),
	('2', '123', '1PM', 'Tanggung Jawab'),
	('3', '123', '1PN', 'Ketenangan'),
	('4', '123', '1PM', 'Kreatifitas'),
	('5', '123', '1PM', 'Penguasaan Materi');
  	('1', '124', '1PN', 'Tanya Jawab'),
	('2', '124', '1PN', 'Tanggung Jawab'),
	('3', '124', '1PN', 'Ketenangan'),
	('4', '124', '1PN', 'Kreatifitas'),
	('5', '124', '1PN', 'Penguasaan Materi');

-- Dumping structure for table inkptatif_v4.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.mahasiswa: ~10 rows (approximately)
INSERT INTO `mahasiswa` (`nim`, `nama`) VALUES
	('223141', 'AHMAD KURNIAWAN'),
	('223242', 'ALEX KARL'),
	('223343', 'M. FARUQ'),
	('223444', 'M. ADITYA RINALDI'),
	('223545', 'DAFFA IKHWAN NUR FAUZAN'),
	('223546', 'FAJRI'),
	('223646', 'FARRAS LATHIEF'),
	('223747', 'HARITSAH NAUFALDY'),
	('223848', 'ABMI SUKMA'),
	('223949', 'AUFA HAJATI');

-- Dumping structure for table inkptatif_v4.penilaian
CREATE TABLE IF NOT EXISTS `penilaian` (
  `nilai` int(3),
  `nim` varchar(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `id_kriteria` varchar(5) NOT NULL,
  `id_kategori` varchar(3) NOT NULL,
  `id_status` varchar(3) NOT NULL,
  PRIMARY KEY (`nim`,`nip`,`id_kriteria`,`id_kategori`,`id_status`),
  KEY `penilaian_dosen_fk` (`nip`),
  KEY `penilaian_kriteria_fk` (`id_kriteria`,`id_kategori`,`id_status`),
  CONSTRAINT `penilaian_dosen_fk` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  CONSTRAINT `penilaian_kriteria_fk` FOREIGN KEY (`id_kriteria`, `id_kategori`, `id_status`) REFERENCES `kriteria` (`id`, `id_kategori`, `id_status`),
  CONSTRAINT `penilaian_mahasiswa_fk` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.penilaian: ~5 rows (approximately)
INSERT INTO `penilaian` (`nilai`, `nim`, `nip`, `id_kriteria`, `id_kategori`, `id_status`) VALUES
	(95, '223848', '1223444', '2', '123', '1PM'),
	(85, '223848', '1223444', '4', '123', '1PM'),
	(88, '223848', '1223444', '5', '123', '1PM'),
	(90, '223848', '1223545', '1', '123', '1PM'),
	(80, '223848', '1223545', '3', '123', '1PN');

  INSERT INTO `penilaian` (`nilai`, `nim`, `nip`, `id_kriteria`, `id_kategori`, `id_status`) VALUES
  (95, '223848', '1223545', '2', '123', '1PM'),
  (95, '223848', '1223545', '4', '123', '1PM'),


-- Dumping structure for table inkptatif_v4.seminar
CREATE TABLE IF NOT EXISTS `seminar` (
  `id` int(3) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tempat` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table inkptatif_v4.seminar: ~4 rows (approximately)
INSERT INTO `seminar` (`id`, `judul`, `tempat`, `tanggal`) VALUES
	(111, 'BAGAIMANA GIMANA?', 'FST 305', '2024-05-15'),
	(222, 'KEMANA MANA HENDAK KEMANA?', 'FST 305', '2024-05-16'),
	(333, 'SIAPA SAPA TERSAPA?', 'FST 305', '2024-05-16'),
	(444, 'MENGAPA KENAPA NAPA?', 'FST 305', '2024-05-16'),
	(555, 'APA APAKAH APA?', 'FST 305', '2024-05-16');

  CREATE TABLE IF NOT EXISTS `history` (
  `nip` varchar(20) NOT NULL,
  `id_seminar` int(3) NOT NULL,
  `jenis` varchar(2) NOT NULL,
  PRIMARY KEY (`nip`, `id_seminar`),
  CONSTRAINT `history_dosen_fk` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  CONSTRAINT `history_id_seminar_fk` FOREIGN KEY (`id_seminar`) REFERENCES `seminar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `history` (`nip`, `id_seminar`, `jenis`) VALUES 
('1223545', 333, 'TA'),
('1223545', 444, 'TA');


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
