-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2021 at 01:07 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

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
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `code`, `name`, `is_delete`, `created_at`, `updated_at`) VALUES
(4, '100', 'Uang Kas', 1, '2021-09-21 02:40:59', '2021-09-21 03:02:09'),
(5, '1231', 'Kas', 0, '2021-09-27 03:26:56', '2021-09-27 03:27:52'),
(6, '0012', 'kas bank', 0, '2021-09-27 04:41:56', '2021-09-27 04:41:56'),
(7, '1090', 'test toast', 0, '2021-09-27 04:45:47', '2021-09-27 04:45:47'),
(8, '888', 'coba', 0, '2021-09-27 05:12:05', '2021-09-27 05:12:05'),
(9, '1782', 'asas', 0, '2021-09-27 05:13:04', '2021-09-27 05:13:04'),
(10, '32132', 'adasdsad', 0, '2021-09-27 05:14:32', '2021-09-27 05:14:32'),
(11, '123', 'Coba Toast', 0, '2021-09-29 06:38:21', '2021-09-29 06:38:21'),
(12, '2322', 'afafas', 1, '2021-09-29 06:40:13', '2021-09-29 07:29:44'),
(13, '8857', 'jbkb', 1, '2021-09-29 06:54:02', '2021-09-29 07:29:28');

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
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register` date NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `register`, `title`, `description`, `created_at`, `updated_at`) VALUES
(11, '2021-09-24', 'Kas Belanja', 'Belanja Kas', '2021-09-22 05:22:03', '2021-09-22 05:22:03'),
(16, '2021-09-02', 'Beli Kertas', 'asas', '2021-09-22 20:26:10', '2021-09-22 20:26:10'),
(17, '2021-09-01', 'baru', 'test', '2021-09-22 20:26:51', '2021-09-22 20:26:51'),
(18, '2021-09-09', 'Kas Belanja', 'kas untuk belanja', '2021-09-22 20:27:57', '2021-09-22 20:27:57'),
(19, '2021-09-01', 'Kas Belanja', 'asasadasd', '2021-09-22 20:28:47', '2021-09-22 20:28:47'),
(21, '2021-09-10', 'Beli Kertas', 'Test TOst', '2021-09-29 06:36:38', '2021-09-29 06:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `journal_id` bigint(20) UNSIGNED NOT NULL,
  `types` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `account_id`, `journal_id`, `types`, `amount`, `created_at`, `updated_at`) VALUES
(9, 4, 16, 'debit', 10000, '2021-09-22 20:26:10', '2021-09-22 20:26:10'),
(10, 4, 16, 'debit', 20000, '2021-09-22 20:26:10', '2021-09-22 20:26:10'),
(11, 4, 16, 'debit', 10000, '2021-09-22 20:26:10', '2021-09-22 20:26:10'),
(12, 4, 17, 'debit', 10000, '2021-09-22 20:26:51', '2021-09-22 20:26:51'),
(13, 4, 17, 'debit', 2000, '2021-09-22 20:26:51', '2021-09-22 20:26:51'),
(14, 4, 17, 'debit', 100000, '2021-09-22 20:26:51', '2021-09-22 20:26:51'),
(15, 4, 18, 'debit', 1000, '2021-09-22 20:27:57', '2021-09-22 20:27:57'),
(16, 4, 18, 'debit', 1000, '2021-09-22 20:27:57', '2021-09-22 20:27:57'),
(35, 4, 19, 'debit', 1, NULL, NULL),
(36, 4, 19, 'credit', 2, NULL, NULL),
(37, 4, 19, 'debit', 3, NULL, NULL),
(40, 6, 21, 'credit', 200, '2021-09-29 06:36:38', '2021-09-29 06:36:38'),
(41, 4, 21, 'debit', 200, '2021-09-29 06:36:38', '2021-09-29 06:36:38'),
(46, 4, 11, 'debit', 10000, NULL, NULL),
(47, 4, 11, 'credit', 10000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2021_09_20_120943_create_accounts_table', 2),
(6, '2021_09_21_105526_add_is_delete_to_accounts_table', 3),
(7, '2021_09_21_115552_create_journals_table', 4),
(8, '2021_09_22_121055_create_journal_details_table', 5),
(9, '2021_09_27_111703_update_is_delete_to_accounts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$QBHVdHxBfHV0BlNUPS7lwufjwQCYk7RR/kxV6GjipgNGZmw2yLWGy', NULL, '2021-09-20 02:53:35', '2021-09-20 02:53:35');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD CONSTRAINT `journal_details_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
