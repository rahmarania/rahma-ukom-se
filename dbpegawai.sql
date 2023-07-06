-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 06:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpegawai`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldivisi`
--

CREATE TABLE `tbldivisi` (
  `kode_divisi` int(11) NOT NULL,
  `nama_divisi` varchar(50) DEFAULT NULL,
  `pimpinan_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbldivisi`
--

INSERT INTO `tbldivisi` (`kode_divisi`, `nama_divisi`, `pimpinan_divisi`) VALUES
(1, 'Gudang', 'Beni Permana, SE'),
(2, 'Produksi', 'Syaiful Bachri, ST'),
(3, 'HRD', 'Dr. Anggit Darmawan');

-- --------------------------------------------------------

--
-- Table structure for table `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `NIP` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `kode_divisi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpegawai`
--

INSERT INTO `tblpegawai` (`NIP`, `nama`, `alamat`, `tanggal_lahir`, `kode_divisi`) VALUES
(11234, 'Arini Nikita', 'Jl. Dedali Putih 5A Tangerang', '2013-01-02', 1),
(11235, 'Toni Purana', 'Jl. Temenggung 21B Jakarta Selatan', '2013-04-04', 2),
(11236, 'Gigih Prayitno', 'Jl. Sidopekso 65 Bandung', '2013-11-08', 3),
(11237, 'Hilda Rahmawati', 'Jl. Mendut 12 Bogor', '2013-11-01', 2),
(11238, 'Miftachul Fauza', 'Jl. Borobudur 1 Bogor', '2013-09-05', 1),
(11239, 'Katrilia Tirta', 'Jl. Kenanga 21 Jakarta Timur', '2013-07-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpresensi`
--

CREATE TABLE `tblpresensi` (
  `id_presensi` int(11) NOT NULL,
  `tanggal_presensi` date DEFAULT NULL,
  `NIP` int(11) DEFAULT NULL,
  `Nama` varchar(50) NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpresensi`
--

INSERT INTO `tblpresensi` (`id_presensi`, `tanggal_presensi`, `NIP`, `Nama`, `jam_masuk`, `jam_pulang`) VALUES
(1, '2018-01-02', 11234, 'Arini Nikita', '08:10:00', '17:40:00'),
(2, '2018-01-02', 11235, 'Toni Purana', '08:00:00', '17:07:00'),
(3, '2018-01-02', 11236, 'Gigih Prayitno', '07:00:00', '16:30:00'),
(5, '2018-01-03', 11234, 'Hilda Rahmawati', '07:45:00', '17:40:00'),
(6, '2018-01-03', 11235, 'Miftachul Fauza', '07:50:00', '16:50:00'),
(7, '2018-01-04', 11234, 'Hilda Rahmawati', '07:55:00', '17:30:00'),
(8, '2018-01-05', 11234, 'Hilda Rahmawati', '07:20:00', '16:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldivisi`
--
ALTER TABLE `tbldivisi`
  ADD PRIMARY KEY (`kode_divisi`);

--
-- Indexes for table `tblpegawai`
--
ALTER TABLE `tblpegawai`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `kode_divisi` (`kode_divisi`);

--
-- Indexes for table `tblpresensi`
--
ALTER TABLE `tblpresensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `NIP` (`NIP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblpresensi`
--
ALTER TABLE `tblpresensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblpegawai`
--
ALTER TABLE `tblpegawai`
  ADD CONSTRAINT `tblpegawai_ibfk_1` FOREIGN KEY (`kode_divisi`) REFERENCES `tbldivisi` (`kode_divisi`);

--
-- Constraints for table `tblpresensi`
--
ALTER TABLE `tblpresensi`
  ADD CONSTRAINT `tblpresensi_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `tblpegawai` (`NIP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
