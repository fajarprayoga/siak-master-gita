-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 07:17 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siak`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `normal_balance` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `code`, `name`, `is_delete`, `normal_balance`, `created_at`, `updated_at`) VALUES
(1, '1000', 'Aktiva', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1100', 'Aktiva Lancar', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1101', 'Kas Kecil', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1102', 'Kas Bank', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1103', 'Piutang Usaha', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1104', 'Perlengkapan Kantor', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1200', 'Aktiva Tetap', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1201', 'CCTV', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1202', 'Akumulasi Penyusutan CCTV', 0, 'credit', '0000-00-00 00:00:00', '2022-01-04 09:03:24'),
(10, '1203', 'Modem Internet', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1204', 'Akumulasi Penyusutan Modem Internet', 0, 'credit', '0000-00-00 00:00:00', '2022-01-04 09:11:37'),
(12, '1205', 'Kompor Gas', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1206', 'Akumulasi Penyusutan Kompor Gas', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1207', 'Kunci Mesin', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1208', 'Akumulasi Penyusutan Kunci Mesin', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1209', 'Lemari Kayu', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1210', 'Akumulasi Penyusutan Lemari Kayu', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1211', 'Eskavator (Alat Berat)', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1212', 'Akumulasi Penyusutan Eskavator (Alat Berat)', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1213', 'Ayakan Cor', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1214', 'Akumulasi Penyusutan Ayakan Cor', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1215', 'Ayakan Super', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1216', 'Akumulasi Penyusutan Ayakan Super', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '2000', 'Hutang Usaha', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '2100', 'Hutang Jangka Pendek', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '2101', 'Hutang Gaji', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '2102', 'Hutang Listrik, Air dan Telepon', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '2200', 'Hutang Jangka Panjang', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '2201', 'Hutang Bank', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '3000', 'Modal', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '3001', 'Modal Bapak Beni', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '3002', 'Modal Bapak Eka', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '3003', 'Modal Bapak Budi', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '3100', 'Laba Ditahan/Modal Cadangan', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '3101', 'Laba Ditahan/Modal Cadangan', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '3102', 'Modal Cadangan', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '4000', 'Penjualan', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '5000', 'Biaya-Biaya', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '5100', 'Biaya Gaji Operator', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '5101', 'Biaya Solar', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '5102', 'Biaya Sewa Lahan', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '5103', 'Biaya Oli dan Pelumas', 0, 'credit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '5104', 'Biaya Spare Part', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '5105', 'Biaya Penyusutan ', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '5106', 'Biaya Listrik, Air dan Telepon', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '5107', 'Biaya Pemeliharaan Alat', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '5108', 'Biaya Retribusi ', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '5109', 'Biaya Sewa', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '5110', 'Biaya Promosi', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '5111', 'Biaya Asuransi', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '5112', 'Biaya Administrasi', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '5113', 'Biaya Pajak', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '5114', 'Biaya Lain-Lain', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '5115', 'Biaya Gaji Operator', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '5116', 'Biaya Konsumsi', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '5117', 'Biaya Gaji Helper', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '5118', 'Biaya Tukang Gosek', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '5119', 'Biaya Atensi Desa', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '5120', 'Biaya Gaji Kasir', 0, 'debit', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gosek`
--

CREATE TABLE `gosek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `expense` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gosek`
--

INSERT INTO `gosek` (`id`, `transaction_id`, `expense`, `created_at`, `updated_at`) VALUES
(2, 18, '5000.00', '2021-12-26 16:00:00', '2021-12-26 23:15:36'),
(3, 27, '450000.00', '2022-01-01 16:00:00', '2022-01-02 07:23:57'),
(4, 28, '10000.00', '2022-01-03 16:00:00', '2022-01-04 08:25:51'),
(5, 37, '500000.00', '2022-01-03 16:00:00', '2022-01-04 08:33:05'),
(7, 26, '5000000.00', '2022-01-04 16:00:00', '2022-01-05 11:07:29'),
(8, 27, '450000.00', '2022-01-04 16:00:00', '2022-01-05 11:10:04'),
(9, 28, '500000.00', '2022-01-03 16:00:00', '2022-01-05 11:12:48'),
(10, 37, '5000.00', '2022-01-06 16:00:00', '2022-01-07 00:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `incomestatement`
--

CREATE TABLE `incomestatement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register` date NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomestatement`
--

INSERT INTO `incomestatement` (`id`, `register`, `title`, `status`, `note`, `created_at`, `updated_at`) VALUES
(91, '2022-01-07', 'Laba Rugi 07', 'pending', NULL, '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(92, '2022-01-07', 'Laba rugi new', 'pending', NULL, '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(93, '2022-01-07', 'Laba RUgi format rupiah', 'pending', NULL, '2022-01-06 22:59:08', '2022-01-06 22:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `incomestatement_detail`
--

CREATE TABLE `incomestatement_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incomestatement_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,0) DEFAULT 0,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense` decimal(11,0) NOT NULL DEFAULT 0,
  `type` enum('income','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomestatement_detail`
--

INSERT INTO `incomestatement_detail` (`id`, `incomestatement_id`, `name`, `amount`, `account_id`, `expense`, `type`, `created_at`, `updated_at`) VALUES
(53, 91, 'Biaya-Biaya', '0', 38, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(54, 91, 'Biaya Gaji Operator', '0', 39, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(55, 91, 'Biaya Solar', '0', 40, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(56, 91, 'Biaya Sewa Lahan', '0', 41, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(57, 91, 'Biaya Oli dan Pelumas', '0', 42, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(58, 91, 'Biaya Spare Part', '0', 43, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(59, 91, 'Biaya Penyusutan ', '0', 44, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(60, 91, 'Biaya Listrik, Air dan Telepon', '0', 45, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(61, 91, 'Biaya Pemeliharaan Alat', '0', 46, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(62, 91, 'Biaya Retribusi ', '0', 47, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(63, 91, 'Biaya Sewa', '0', 48, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(64, 91, 'Biaya Promosi', '0', 49, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(65, 91, 'Biaya Asuransi', '0', 50, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(66, 91, 'Biaya Administrasi', '0', 51, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(67, 91, 'Biaya Pajak', '0', 52, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(68, 91, 'Biaya Lain-Lain', '0', 53, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(69, 91, 'Biaya Gaji Operator', '0', 54, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(70, 91, 'Biaya Konsumsi', '0', 55, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(71, 91, 'Biaya Gaji Helper', '0', 56, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(72, 91, 'Biaya Tukang Gosek', '0', 57, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(73, 91, 'Biaya Atensi Desa', '0', 58, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(74, 91, 'Biaya Gaji Kasir', '0', 59, '0', 'expense', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(75, 91, 'Penjualan', '0', 37, '0', 'income', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(76, 91, 'Potongan Penjualan Pasir Super', '1000', NULL, '0', 'income', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(77, 91, 'Potongan Penjualan Pasir Cor', '3000', NULL, '0', 'income', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(78, 91, 'Potongan Penjualan Batu', '3000', NULL, '0', 'income', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(79, 91, 'Biaya Angkut Penjualan', '2000', NULL, '0', 'income', '2022-01-06 21:58:18', '2022-01-06 21:58:18'),
(80, 92, 'Biaya-Biaya', '0', 38, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(81, 92, 'Biaya Gaji Operator', '0', 39, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(82, 92, 'Biaya Solar', '0', 40, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(83, 92, 'Biaya Sewa Lahan', '0', 41, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(84, 92, 'Biaya Oli dan Pelumas', '0', 42, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(85, 92, 'Biaya Spare Part', '0', 43, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(86, 92, 'Biaya Penyusutan ', '0', 44, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(87, 92, 'Biaya Listrik, Air dan Telepon', '0', 45, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(88, 92, 'Biaya Pemeliharaan Alat', '0', 46, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(89, 92, 'Biaya Retribusi ', '0', 47, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(90, 92, 'Biaya Sewa', '0', 48, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(91, 92, 'Biaya Promosi', '0', 49, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(92, 92, 'Biaya Asuransi', '0', 50, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(93, 92, 'Biaya Administrasi', '0', 51, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(94, 92, 'Biaya Pajak', '0', 52, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(95, 92, 'Biaya Lain-Lain', '0', 53, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(96, 92, 'Biaya Gaji Operator', '0', 54, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(97, 92, 'Biaya Konsumsi', '0', 55, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(98, 92, 'Biaya Gaji Helper', '0', 56, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(99, 92, 'Biaya Tukang Gosek', '0', 57, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(100, 92, 'Biaya Atensi Desa', '0', 58, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(101, 92, 'Biaya Gaji Kasir', '0', 59, '0', 'expense', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(102, 92, 'Penjualan', '0', 37, '0', 'income', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(103, 92, 'Potongan Penjualan Pasir Super', '20000', NULL, '0', 'income', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(104, 92, 'Potongan Penjualan Pasir Cor', '10000', NULL, '0', 'income', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(105, 92, 'Potongan Penjualan Batu', '20000', NULL, '0', 'income', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(106, 92, 'Biaya Angkut Penjualan', '5000', NULL, '0', 'income', '2022-01-06 22:32:04', '2022-01-06 22:32:04'),
(107, 93, 'Biaya-Biaya', '0', 38, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(108, 93, 'Biaya Gaji Operator', '0', 39, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(109, 93, 'Biaya Solar', '0', 40, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(110, 93, 'Biaya Sewa Lahan', '0', 41, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(111, 93, 'Biaya Oli dan Pelumas', '0', 42, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(112, 93, 'Biaya Spare Part', '0', 43, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(113, 93, 'Biaya Penyusutan ', '0', 44, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(114, 93, 'Biaya Listrik, Air dan Telepon', '0', 45, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(115, 93, 'Biaya Pemeliharaan Alat', '0', 46, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(116, 93, 'Biaya Retribusi ', '0', 47, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(117, 93, 'Biaya Sewa', '0', 48, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(118, 93, 'Biaya Promosi', '0', 49, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(119, 93, 'Biaya Asuransi', '0', 50, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(120, 93, 'Biaya Administrasi', '0', 51, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(121, 93, 'Biaya Pajak', '0', 52, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(122, 93, 'Biaya Lain-Lain', '0', 53, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(123, 93, 'Biaya Gaji Operator', '0', 54, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(124, 93, 'Biaya Konsumsi', '0', 55, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(125, 93, 'Biaya Gaji Helper', '0', 56, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(126, 93, 'Biaya Tukang Gosek', '0', 57, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(127, 93, 'Biaya Atensi Desa', '0', 58, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(128, 93, 'Biaya Gaji Kasir', '0', 59, '0', 'expense', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(129, 93, 'Penjualan', '0', 37, '0', 'income', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(130, 93, 'Potongan Penjualan Pasir Super', '200000', NULL, '0', 'income', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(131, 93, 'Potongan Penjualan Pasir Cor', '100000', NULL, '0', 'income', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(132, 93, 'Potongan Penjualan Batu', '10000', NULL, '0', 'income', '2022-01-06 22:59:08', '2022-01-06 22:59:08'),
(133, 93, 'Biaya Angkut Penjualan', '5000', NULL, '0', 'income', '2022-01-06 22:59:08', '2022-01-06 22:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register` date NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `register`, `title`, `description`, `status`, `note`, `created_at`, `updated_at`) VALUES
(6, '2022-01-05', 'JUrnal periode 05 01 22', 'JUrnal periode 05 01 22', 'pending', NULL, '2022-01-05 11:30:36', '2022-01-05 11:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `journal_id` bigint(20) UNSIGNED NOT NULL,
  `types` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,0) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `account_id`, `journal_id`, `types`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'debit', '2000000', 'Activa', '2022-01-05 11:30:36', '2022-01-05 11:30:36'),
(2, 1, 6, 'credit', '2000000', 'Activa c', '2022-01-05 11:30:36', '2022-01-05 11:30:36'),
(3, 3, 6, 'debit', '1000000', 'kas kecil d', '2022-01-05 11:30:36', '2022-01-05 11:30:36'),
(4, 3, 6, 'credit', '1000000', 'kas kecil c', '2022-01-05 11:30:36', '2022-01-05 11:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register` date NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `register`, `title`, `description`, `status`, `note`, `created_at`, `updated_at`) VALUES
(9, '2022-01-05', 'Periode buku besar 05.22', 'Periode buku besar 05.22', 'pending', NULL, '2022-01-05 11:35:16', '2022-01-05 11:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `ledger_details`
--

CREATE TABLE `ledger_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `ledger_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `types` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,0) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledger_details`
--

INSERT INTO `ledger_details` (`id`, `date`, `ledger_id`, `account_id`, `types`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, '2022-01-05', 9, 1, 'debit', '2000000', 'Activa', '2022-01-05 11:35:16', '2022-01-05 11:35:16'),
(2, '2022-01-05', 9, 1, 'credit', '2000000', 'Activa c', '2022-01-05 11:35:16', '2022-01-05 11:35:16'),
(3, '2022-01-05', 9, 3, 'debit', '1000000', 'kas kecil d', '2022-01-05 11:35:16', '2022-01-05 11:35:16'),
(4, '2022-01-05', 9, 3, 'credit', '1000000', 'kas kecil c', '2022-01-05 11:35:16', '2022-01-05 11:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Batu', 0, '2021-12-26 22:48:19', '2021-12-26 22:48:19'),
(2, 'pasir', 0, '2022-01-04 08:32:43', '2022-01-04 08:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_09_20_105109_add_votes_to_users_table', 1),
(5, '2021_09_20_120943_create_accounts_table', 1),
(6, '2021_09_21_105526_add_is_delete_to_accounts_table', 1),
(7, '2021_09_22_115552_create_journals_table', 1),
(8, '2021_09_22_121055_create_journal_details_table', 1),
(9, '2021_12_14_270618_create_transaction_table', 1),
(10, '2021_12_16_111704_update_is_delete_to_material_table', 1),
(11, '2021_12_16_174520_create_materials_table', 1),
(12, '2021_12_18_154216_create_ledger_table', 1),
(13, '2021_12_18_154811_create_ledger_details', 1),
(14, '2021_12_20_102212_create_gosek_table', 1),
(15, '2021_12_24_061407_create_trial_balance_table', 1),
(16, '2021_12_24_064548_create_trial_balance_detail_table', 1),
(17, '2021_12_27_062302_create_incomestatement_table', 1),
(18, '2021_12_28_093557_create_incomestatement_detail_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price_material` int(11) DEFAULT NULL,
  `expense` decimal(11,0) NOT NULL DEFAULT 0,
  `nomor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `vehicle_number`, `vehicle`, `material_id`, `price_material`, `expense`, `nomor`, `created_at`, `updated_at`) VALUES
(18, 'operator', NULL, NULL, NULL, '100', NULL, '2022-01-04 16:00:00', NULL),
(19, 'kasir', NULL, NULL, NULL, '300', NULL, '2022-01-04 16:00:00', NULL),
(20, 'helper', NULL, NULL, NULL, '200', NULL, '2022-01-04 16:00:00', NULL),
(21, 'jalan 40', NULL, NULL, NULL, '400', NULL, '2022-01-04 16:00:00', NULL),
(22, 'pemilik', NULL, NULL, NULL, '-1187500', NULL, '2022-01-04 16:00:00', '2022-01-05 11:10:04'),
(23, 'jalan desa', NULL, NULL, NULL, '100', NULL, '2022-01-04 16:00:00', NULL),
(24, 'lain-lain', NULL, NULL, NULL, '500', NULL, '2022-01-04 16:00:00', NULL),
(25, 'solar', NULL, NULL, NULL, '300', NULL, '2022-01-04 16:00:00', NULL),
(26, 'DK 1020 lB', 'PICKUP', 2, 200000, '0', '210', '2022-01-04 16:00:00', '2022-01-05 11:07:29'),
(27, 'DK 9998 AB', 'Truk Wawan', 2, 500000, '0', '200', '2022-01-04 16:00:00', '2022-01-05 11:10:04'),
(28, 'DK 3992 CB', 'Truk Wawan', 1, 300000, '0', '200', '2022-01-03 16:00:00', '2022-01-05 11:12:48'),
(29, 'operator', NULL, NULL, NULL, '1000', NULL, '2022-01-03 16:00:00', NULL),
(30, 'kasir', NULL, NULL, NULL, '8000', NULL, '2022-01-03 16:00:00', NULL),
(31, 'helper', NULL, NULL, NULL, '200', NULL, '2022-01-03 16:00:00', NULL),
(32, 'jalan 40', NULL, NULL, NULL, '9000', NULL, '2022-01-03 16:00:00', NULL),
(33, 'pemilik', NULL, NULL, NULL, '-177500', NULL, '2022-01-03 16:00:00', NULL),
(34, 'jalan desa', NULL, NULL, NULL, '4000', NULL, '2022-01-03 16:00:00', NULL),
(35, 'lain-lain', NULL, NULL, NULL, '1000', NULL, '2022-01-03 16:00:00', NULL),
(36, 'solar', NULL, NULL, NULL, '7000', NULL, '2022-01-03 16:00:00', NULL),
(37, 'DK 1020 lB', 'Truk Wawan', 1, 300000, '0', '200', '2022-01-06 16:00:00', '2022-01-07 00:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `trial_balance`
--

CREATE TABLE `trial_balance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register` date NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trial_balance`
--

INSERT INTO `trial_balance` (`id`, `register`, `title`, `description`, `status`, `note`, `created_at`, `updated_at`) VALUES
(30, '2022-01-02', 'Neraca Saldo', 'Neraca Saldo', 'rejected', 'mohon di revisi', '2022-01-02 05:22:30', '2022-01-02 05:34:59'),
(31, '2022-01-04', 'Neraca Saldo', 'Neraca Saldo Ket', 'pending', '', '2022-01-04 08:58:05', '2022-01-04 08:58:05'),
(32, '2022-01-05', 'Neraca saldo', 'Neraca Saldo Baru', 'pending', NULL, '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(33, '2022-01-06', 'Periode tgl 6 Desc 22', 'Periode tgl 6 Desc 22', 'pending', NULL, '2022-01-06 06:57:49', '2022-01-06 06:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `trial_balance_detail`
--

CREATE TABLE `trial_balance_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `trial_balance_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(11,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trial_balance_detail`
--

INSERT INTO `trial_balance_detail` (`id`, `date`, `trial_balance_id`, `account_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, '2022-01-05', 32, 1, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(2, '2022-01-05', 32, 2, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(3, '2022-01-05', 32, 3, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(4, '2022-01-05', 32, 4, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(5, '2022-01-05', 32, 5, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(6, '2022-01-05', 32, 6, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(7, '2022-01-05', 32, 7, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(8, '2022-01-05', 32, 8, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(9, '2022-01-05', 32, 9, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(10, '2022-01-05', 32, 10, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(11, '2022-01-05', 32, 11, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(12, '2022-01-05', 32, 12, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(13, '2022-01-05', 32, 13, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(14, '2022-01-05', 32, 14, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(15, '2022-01-05', 32, 15, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(16, '2022-01-05', 32, 16, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(17, '2022-01-05', 32, 17, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(18, '2022-01-05', 32, 18, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(19, '2022-01-05', 32, 19, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(20, '2022-01-05', 32, 20, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(21, '2022-01-05', 32, 21, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(22, '2022-01-05', 32, 22, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(23, '2022-01-05', 32, 23, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(24, '2022-01-05', 32, 24, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(25, '2022-01-05', 32, 25, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(26, '2022-01-05', 32, 26, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(27, '2022-01-05', 32, 27, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(28, '2022-01-05', 32, 28, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(29, '2022-01-05', 32, 29, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(30, '2022-01-05', 32, 30, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(31, '2022-01-05', 32, 31, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(32, '2022-01-05', 32, 32, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(33, '2022-01-05', 32, 33, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(34, '2022-01-05', 32, 34, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(35, '2022-01-05', 32, 35, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(36, '2022-01-05', 32, 36, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(37, '2022-01-05', 32, 37, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(38, '2022-01-05', 32, 38, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(39, '2022-01-05', 32, 39, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(40, '2022-01-05', 32, 40, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(41, '2022-01-05', 32, 41, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(42, '2022-01-05', 32, 42, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(43, '2022-01-05', 32, 43, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(44, '2022-01-05', 32, 44, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(45, '2022-01-05', 32, 45, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(46, '2022-01-05', 32, 46, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(47, '2022-01-05', 32, 47, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(48, '2022-01-05', 32, 48, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(49, '2022-01-05', 32, 49, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(50, '2022-01-05', 32, 50, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(51, '2022-01-05', 32, 51, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(52, '2022-01-05', 32, 52, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(53, '2022-01-05', 32, 53, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(54, '2022-01-05', 32, 54, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(55, '2022-01-05', 32, 55, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(56, '2022-01-05', 32, 56, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(57, '2022-01-05', 32, 57, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(58, '2022-01-05', 32, 58, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(59, '2022-01-05', 32, 59, '0', '2022-01-05 11:46:11', '2022-01-05 11:46:11'),
(60, '2022-01-06', 33, 1, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(61, '2022-01-06', 33, 2, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(62, '2022-01-06', 33, 3, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(63, '2022-01-06', 33, 4, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(64, '2022-01-06', 33, 5, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(65, '2022-01-06', 33, 6, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(66, '2022-01-06', 33, 7, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(67, '2022-01-06', 33, 8, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(68, '2022-01-06', 33, 9, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(69, '2022-01-06', 33, 10, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(70, '2022-01-06', 33, 11, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(71, '2022-01-06', 33, 12, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(72, '2022-01-06', 33, 13, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(73, '2022-01-06', 33, 14, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(74, '2022-01-06', 33, 15, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(75, '2022-01-06', 33, 16, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(76, '2022-01-06', 33, 17, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(77, '2022-01-06', 33, 18, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(78, '2022-01-06', 33, 19, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(79, '2022-01-06', 33, 20, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(80, '2022-01-06', 33, 21, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(81, '2022-01-06', 33, 22, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(82, '2022-01-06', 33, 23, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(83, '2022-01-06', 33, 24, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(84, '2022-01-06', 33, 25, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(85, '2022-01-06', 33, 26, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(86, '2022-01-06', 33, 27, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(87, '2022-01-06', 33, 28, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(88, '2022-01-06', 33, 29, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(89, '2022-01-06', 33, 30, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(90, '2022-01-06', 33, 31, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(91, '2022-01-06', 33, 32, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(92, '2022-01-06', 33, 33, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(93, '2022-01-06', 33, 34, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(94, '2022-01-06', 33, 35, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(95, '2022-01-06', 33, 36, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(96, '2022-01-06', 33, 37, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(97, '2022-01-06', 33, 38, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(98, '2022-01-06', 33, 39, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(99, '2022-01-06', 33, 40, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(100, '2022-01-06', 33, 41, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(101, '2022-01-06', 33, 42, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(102, '2022-01-06', 33, 43, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(103, '2022-01-06', 33, 44, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(104, '2022-01-06', 33, 45, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(105, '2022-01-06', 33, 46, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(106, '2022-01-06', 33, 47, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(107, '2022-01-06', 33, 48, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(108, '2022-01-06', 33, 49, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(109, '2022-01-06', 33, 50, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(110, '2022-01-06', 33, 51, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(111, '2022-01-06', 33, 52, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(112, '2022-01-06', 33, 53, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(113, '2022-01-06', 33, 54, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(114, '2022-01-06', 33, 55, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(115, '2022-01-06', 33, 56, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(116, '2022-01-06', 33, 57, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(117, '2022-01-06', 33, 58, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49'),
(118, '2022-01-06', 33, 59, '0', '2022-01-06 06:57:49', '2022-01-06 06:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','manager','accounting','cashier') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'accounting', 'accounting@gmail.com', NULL, '$2y$10$Jj6OiZjg4ZYKsJHaDaUF9OU6blc/Ykvk8X7lEADRS8TY1Vmo3zrZa', NULL, NULL, NULL, 'accounting'),
(2, 'cashier', 'cashier@gmail.com', NULL, '$2y$10$Jj6OiZjg4ZYKsJHaDaUF9OU6blc/Ykvk8X7lEADRS8TY1Vmo3zrZa', NULL, NULL, NULL, 'cashier'),
(3, 'manager', 'manager@gmail.com', NULL, '$2y$10$Jj6OiZjg4ZYKsJHaDaUF9OU6blc/Ykvk8X7lEADRS8TY1Vmo3zrZa', NULL, NULL, NULL, 'manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gosek`
--
ALTER TABLE `gosek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomestatement`
--
ALTER TABLE `incomestatement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomestatement_detail`
--
ALTER TABLE `incomestatement_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomestatement_detail_incomestatement_id_foreign` (`incomestatement_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_id_foreign` (`journal_id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledger_details`
--
ALTER TABLE `ledger_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ledger_details_ledger_id_foreign` (`ledger_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trial_balance`
--
ALTER TABLE `trial_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trial_balance_detail`
--
ALTER TABLE `trial_balance_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trial_balance_detail_trial_balance_id_foreign` (`trial_balance_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5564;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gosek`
--
ALTER TABLE `gosek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `incomestatement`
--
ALTER TABLE `incomestatement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `incomestatement_detail`
--
ALTER TABLE `incomestatement_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ledger_details`
--
ALTER TABLE `ledger_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `trial_balance`
--
ALTER TABLE `trial_balance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `trial_balance_detail`
--
ALTER TABLE `trial_balance_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incomestatement_detail`
--
ALTER TABLE `incomestatement_detail`
  ADD CONSTRAINT `incomestatement_detail_incomestatement_id_foreign` FOREIGN KEY (`incomestatement_id`) REFERENCES `incomestatement` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD CONSTRAINT `journal_details_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ledger_details`
--
ALTER TABLE `ledger_details`
  ADD CONSTRAINT `ledger_details_ledger_id_foreign` FOREIGN KEY (`ledger_id`) REFERENCES `ledgers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trial_balance_detail`
--
ALTER TABLE `trial_balance_detail`
  ADD CONSTRAINT `trial_balance_detail_trial_balance_id_foreign` FOREIGN KEY (`trial_balance_id`) REFERENCES `trial_balance` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
