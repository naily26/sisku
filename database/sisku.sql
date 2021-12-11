-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2021 at 07:32 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zxyyjjxh_sisku`
--

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fiscal_id` int(11) DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_amount` int(11) NOT NULL,
  `credit_amount` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `fiscal_id`, `number`, `date`, `type`, `debit_amount`, `credit_amount`, `note`, `tag`, `created_at`, `updated_at`) VALUES
(73, 1, '002', '2021-05-24', 'Receipt', 10000, 10000, 'xcvx', NULL, '2021-05-23 23:44:51', '2021-05-31 00:05:32'),
(74, 1, '32323', '2021-05-31', 'Receipt', 1000, 1000, NULL, NULL, '2021-05-31 00:07:56', '2021-05-31 00:07:56'),
(75, 1, '992886', '2021-05-31', 'Payment', 15000, 15000, 'tagihan listrik', NULL, '2021-05-31 00:17:07', '2021-05-31 00:17:07'),
(76, 1, '00567', '2021-06-02', 'Receipt', 10000, 10000, 'Pembelian alat kantor', NULL, '2021-06-01 23:55:09', '2021-06-01 23:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `entry_items`
--

CREATE TABLE `entry_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entries_id` bigint(20) UNSIGNED NOT NULL,
  `ledger_id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_amount` int(11) DEFAULT NULL,
  `credit_amount` int(11) DEFAULT NULL,
  `narration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_recon` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entry_items`
--

INSERT INTO `entry_items` (`id`, `entries_id`, `ledger_id`, `type`, `debit_amount`, `credit_amount`, `narration`, `date_recon`, `created_at`, `updated_at`) VALUES
(3, 73, 17, 'Cr', NULL, 200000, NULL, NULL, '2021-05-23 23:44:51', '2021-05-31 00:05:32'),
(4, 73, 15, 'Dr', 200000, NULL, NULL, NULL, '2021-05-23 23:44:51', '2021-05-31 00:05:32'),
(5, 74, 14, 'Cr', NULL, 1000, NULL, NULL, '2021-05-31 00:07:56', '2021-05-31 00:07:56'),
(6, 74, 60, 'Dr', 1000, NULL, NULL, NULL, '2021-05-31 00:07:56', '2021-05-31 00:07:56'),
(7, 75, 9, 'Cr', NULL, 15000, NULL, NULL, '2021-05-31 00:17:07', '2021-05-31 00:17:07'),
(8, 75, 15, 'Dr', 15000, NULL, NULL, NULL, '2021-05-31 00:17:07', '2021-05-31 00:17:07'),
(9, 76, 15, 'Dr', 10000, NULL, NULL, NULL, '2021-06-01 23:55:09', '2021-06-01 23:55:09'),
(10, 76, 20, 'Cr', NULL, 10000, NULL, NULL, '2021-06-01 23:55:09', '2021-06-01 23:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `fiscal`
--

CREATE TABLE `fiscal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_fiscal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_year` date NOT NULL,
  `end_year` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fiscal`
--

INSERT INTO `fiscal` (`id`, `nama_fiscal`, `deskripsi`, `start_year`, `end_year`, `created_at`, `updated_at`) VALUES
(1, 'Q4ITC2021', 'sdsdssdd', '2021-01-03', '2021-12-12', '2021-05-02 21:45:42', '2021-05-30 19:58:41'),
(4, 'Q5ITC2021', 'Contoh buku fiscal', '2021-05-01', '2021-05-30', '2021-05-31 00:10:45', '2021-05-31 00:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `affect_gross` tinyint(1) NOT NULL DEFAULT 1,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_code`, `group_name`, `parent_id`, `affect_gross`, `account_id`, `created_at`, `updated_at`) VALUES
(1, '01', 'Aset', 0, 1, 1, '2020-09-11 04:00:36', '2020-09-11 04:00:36'),
(2, '02', 'Liabilities and Owners Equity', 0, 1, 1, NULL, NULL),
(3, '03', 'Incomes', 0, 1, 1, NULL, NULL),
(4, '04', 'Expenses', 0, 1, 1, NULL, NULL),
(6, '03-01', 'Pendapatan Project', 3, 1, 1, '2021-01-03 12:58:47', '2021-01-03 12:58:47'),
(7, '03-02', 'Pendapatan Service', 3, 1, 1, '2021-01-03 12:59:02', '2021-01-03 12:59:02'),
(8, '04-01', 'Beban Operasional Kantor', 4, 1, 1, '2021-01-03 13:22:34', '2021-01-03 13:22:34'),
(9, '04-02', 'Beban Operasional', 4, 1, 1, '2021-01-09 10:28:20', '2021-01-09 10:28:20'),
(11, '01-01', 'Aset Lancar', 1, 1, 1, '2020-09-11 04:01:25', '2020-09-11 04:01:25'),
(12, '01-01-01', 'Kas dan Setara Kas', 11, 1, 1, '2021-01-03 12:42:51', '2021-01-03 12:42:51'),
(13, '01-01-02', 'Piutang', 11, 1, 1, '2020-09-11 04:05:58', '2020-09-11 04:05:58'),
(14, '01-01-03', 'Perlengkapan', 11, 1, 1, '2020-09-11 04:06:08', '2020-09-11 04:06:08'),
(15, '01-01-04', 'Persekot', 11, 1, 1, '2020-09-11 04:06:21', '2020-09-11 04:06:21'),
(16, '01-02', 'Aset Tetap', 1, 1, 1, '2021-01-03 13:14:02', '2021-01-03 13:14:02'),
(17, '01-02-01', 'Harga Beli', 16, 1, 1, '2021-01-03 13:15:40', '2021-01-03 13:15:40'),
(18, '02-01', 'Modal', 2, 1, 1, '2021-01-03 13:19:39', '2021-01-03 13:19:39'),
(19, '02-01-01', 'Modal Sendiri', 18, 1, 1, '2021-01-03 13:20:06', '2021-01-03 13:20:06'),
(20, '02-01-02', 'Modal Investor', 18, 1, 1, '2021-01-03 13:20:47', '2021-01-03 13:20:47'),
(21, '04-03', 'Beban Non Operasional', 4, 1, 1, '2021-01-03 14:03:56', '2021-01-03 14:03:56'),
(23, '04-04', 'Kewajiban', 4, 1, 1, '2021-03-13 21:25:16', '2021-03-13 21:25:16'),
(25, '04-04-01', 'Hutang Usaha', 23, 1, 1, '2021-03-13 22:31:22', '2021-03-13 22:31:22'),
(26, '04-04-02', 'Pajak', 23, 1, 1, '2021-03-20 13:38:41', '2021-03-20 13:38:41'),
(94, '01-03', 'Aset Contoh', 1, 1, 1, '2021-04-26 10:06:56', '2021-04-26 10:06:56'),
(95, '01-01-05', 'Aset Surut', 11, 1, 1, '2021-05-23 22:52:24', '2021-05-23 22:52:24'),
(96, '02-02', 'Modal Pinjaman', 2, 1, 1, '2021-05-30 21:07:59', '2021-05-30 21:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ledger_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ledger_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` int(11) NOT NULL DEFAULT 0,
  `fix_balance` int(11) NOT NULL DEFAULT 0,
  `bank` tinyint(1) NOT NULL DEFAULT 0,
  `reconciliation` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_recon` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `ledger_code`, `ledger_name`, `type_balance`, `opening_balance`, `fix_balance`, `bank`, `reconciliation`, `notes`, `date_recon`, `created_at`, `updated_at`, `group_id`) VALUES
(2, '03-01-0001', 'Pendapatan Project Infrastruktur', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-28 21:31:50', '2021-01-28 21:31:50', 6),
(3, '03-01-0002', 'Pendapatan Project Software', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-28 21:32:05', '2021-01-28 21:32:05', 6),
(4, '03-01-0003', 'Pendapatan Lain-lain', 'Cr', 0, 0, 0, 0, NULL, NULL, '2020-09-11 03:42:56', '2020-09-11 03:42:56', 6),
(9, '04-01-0001', 'Beban Listrik, Air, Telepon', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:23:02', '2021-01-03 13:23:02', 8),
(10, '04-02-0001', 'Beban Gaji', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:24:19', '2021-01-03 13:24:19', 9),
(11, '04-02-0002', 'Beban Gaji Non Pegawai', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:28:40', '2021-01-03 13:28:40', 9),
(14, '01-01-01-0001', 'Kas di Tangan', 'Cr', 0, 0, 1, 0, NULL, NULL, '2021-03-14 00:44:44', '2021-03-14 00:44:44', 12),
(15, '01-01-01-0002', 'Kas di Bank Mandiri', 'Dr', 0, 1500000, 1, 1, NULL, NULL, '2021-03-14 20:15:04', '2021-03-14 20:15:04', 12),
(16, '01-01-01-0003', 'Kas di Bank CIMB', 'Dr', 0, 0, 1, 1, NULL, NULL, '2021-01-03 12:48:28', '2021-01-03 12:48:28', 12),
(17, '01-01-02-0001', 'Piutang Pendapatan', 'Cr', 0, 100, 0, 0, NULL, NULL, '2020-09-11 04:06:44', '2020-09-11 04:06:44', 13),
(18, '01-01-02-0002', 'Piutang Usaha', 'Cr', 0, 0, 0, 0, NULL, NULL, '2020-09-11 04:06:59', '2020-09-11 04:06:59', 13),
(19, '01-01-02-0003', 'Piutang Pendapatan Bunga', 'Cr', 0, 0, 0, 0, NULL, NULL, '2020-09-11 04:07:13', '2020-09-11 04:07:13', 13),
(20, '01-01-03-0001', 'Perlengkapan Kantor', 'Cr', 0, -100, 0, 0, NULL, NULL, '2020-09-11 04:07:37', '2020-09-11 04:07:37', 14),
(21, '01-01-04-0001', 'Uang Muka Sewa', 'Cr', 0, 0, 0, 0, NULL, NULL, '2020-09-11 04:07:57', '2020-09-11 04:07:57', 15),
(22, '01-01-04-0002', 'Persekot PPH Badan', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:11:32', '2021-01-03 13:11:32', 15),
(23, '01-01-01-0004', 'Kas di Bank BTPN (Jenius)', 'Cr', 0, 0, 1, 1, NULL, NULL, '2021-01-09 10:10:55', '2021-01-09 10:10:55', 12),
(24, '01-01-02-0004', 'Piutang Dana Belum Terpakai', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:10:09', '2021-01-03 13:10:09', 13),
(27, '01-02-01-0001', 'Tanah', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:15:57', '2021-01-03 13:15:57', 17),
(28, '01-02-01-0002', 'Bangunan', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:16:11', '2021-01-03 13:16:11', 17),
(29, '01-02-01-0003', 'Kendaraan', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:16:28', '2021-01-03 13:16:28', 17),
(30, '03-02-0004', 'EVENTku', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:17:54', '2021-01-03 13:17:54', 7),
(32, '02-01-01-0001', 'Modal123', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-05-30 21:09:59', '2021-05-30 21:09:59', 19),
(34, '02-01-02-0001', 'Investasi', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:21:47', '2021-01-03 13:21:47', 20),
(35, '02-01-02-0002', 'Deviden', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:21:58', '2021-01-03 13:21:58', 20),
(36, '04-01-0002', 'Beban ATK', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:23:20', '2021-01-03 13:23:20', 8),
(37, '04-01-0003', 'Pulsa Admin', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:23:39', '2021-01-03 13:23:39', 8),
(38, '04-01-0004', 'Beban Internet', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:25:21', '2021-01-03 13:25:21', 8),
(39, '04-01-0005', 'Beban Sewa', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:25:46', '2021-01-03 13:25:46', 8),
(40, '04-02-0003', 'Beban Perjalanan Dinas', 'Dr', 0, 0, 0, 0, NULL, NULL, '2021-03-13 23:31:59', '2021-03-13 23:31:59', 9),
(41, '04-02-0004', 'Beban Pemasaran', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:26:52', '2021-01-03 13:26:52', 9),
(43, '04-02-0005', 'Beban Konsumsi', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:29:38', '2021-01-03 13:29:38', 9),
(44, '04-02-0006', 'Beban Lain-lain', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 13:32:05', '2021-01-03 13:32:05', 9),
(45, '04-03-0001', 'Beban Aplikasi', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 14:04:29', '2021-01-03 14:04:29', 21),
(46, '04-03-0002', 'Beban Server', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 14:05:27', '2021-01-03 14:05:27', 21),
(47, '04-03-0003', 'Beban Lain-lain', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-01-03 14:06:03', '2021-01-03 14:06:03', 21),
(54, '04-04-01-0001', 'Hutang Usaha', 'Cr', 0, 0, 0, 0, 'DMU - WEFEST', NULL, '2021-03-20 04:06:52', '2021-03-20 04:06:52', 25),
(55, '04-02-0007', 'Beban Admin Bank', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-03-16 09:38:49', '2021-03-16 09:38:49', 9),
(56, '04-04-01-0002', 'Hutang Operasional', 'Cr', 0, 0, 0, 0, NULL, NULL, '2021-03-16 09:39:15', '2021-03-16 09:39:15', 25),
(59, '01-03-0001', 'Pengeluaran contoh', 'Cr', 0, 0, 1, 0, NULL, NULL, '2021-04-26 10:09:56', '2021-04-26 10:09:56', 94),
(60, '01-01-05-0001', 'Hutang Biasa', 'Cr', 0, 0, 1, 0, 'dfdfd', NULL, '2021-05-23 22:54:22', '2021-05-23 22:54:22', 95),
(61, '02-02-0001', 'Pinjaman dana angununan', 'Cr', 12000, 0, 0, 0, 'Hutang dana angunan', NULL, '2021-05-30 21:09:15', '2021-05-30 21:09:15', 96);

-- --------------------------------------------------------

--
-- Table structure for table `menu_permission`
--

CREATE TABLE `menu_permission` (
  `menu_permission_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `dashboard_read` int(11) NOT NULL DEFAULT 0 COMMENT '1 = allow\r\n0 = not allow',
  `coa_read` int(11) NOT NULL DEFAULT 0,
  `coa_group_add` int(11) NOT NULL DEFAULT 0,
  `coa_group_edit` int(11) NOT NULL DEFAULT 0,
  `coa_group_delete` int(11) NOT NULL DEFAULT 0,
  `coa_ledger_add` int(11) NOT NULL DEFAULT 0,
  `coa_ledger_edit` int(11) NOT NULL DEFAULT 0,
  `coa_ledger_delete` int(11) NOT NULL DEFAULT 0,
  `coa_export` int(11) NOT NULL DEFAULT 0,
  `entry_read` int(11) NOT NULL DEFAULT 0,
  `entry_journal_add` int(11) NOT NULL DEFAULT 0,
  `entry_journal_edit` int(11) NOT NULL DEFAULT 0,
  `entry_journal_delete` int(11) NOT NULL DEFAULT 0,
  `entry_receipt_add` int(11) NOT NULL DEFAULT 0,
  `entry_receipt_edit` int(11) NOT NULL DEFAULT 0,
  `entry_receipt_delete` int(11) NOT NULL DEFAULT 0,
  `entry_payment_add` int(11) NOT NULL DEFAULT 0,
  `entry_payment_edit` int(11) NOT NULL DEFAULT 0,
  `entry_payment_delete` int(11) NOT NULL DEFAULT 0,
  `entry_contra_add` int(11) NOT NULL DEFAULT 0,
  `entry_contra_edit` int(11) NOT NULL DEFAULT 0,
  `entry_contra_delete` int(11) NOT NULL DEFAULT 0,
  `report_read` int(11) NOT NULL DEFAULT 0,
  `report_balance_sheet` int(11) NOT NULL DEFAULT 0,
  `report_profit_loss` int(11) NOT NULL DEFAULT 0,
  `report_trial_balance` int(11) NOT NULL DEFAULT 0,
  `report_ledger_statement` int(11) NOT NULL DEFAULT 0,
  `report_ledger_entry` int(11) NOT NULL DEFAULT 0,
  `report_reconciliation` int(11) NOT NULL DEFAULT 0,
  `search` int(11) NOT NULL DEFAULT 0,
  `account_setting` int(11) NOT NULL DEFAULT 0,
  `user_permession` int(11) DEFAULT 0,
  `buku_fiscal` int(11) DEFAULT 0,
  `project_setting` int(11) DEFAULT 0,
  `tag_setting` int(11) NOT NULL DEFAULT 0,
  `crm_setting` int(11) NOT NULL DEFAULT 0,
  `log_setting` int(11) NOT NULL DEFAULT 0,
  `product_setting` int(11) NOT NULL DEFAULT 0,
  `service_setting` int(11) NOT NULL DEFAULT 0,
  `email_setting` int(11) NOT NULL DEFAULT 0,
  `data_master_setting` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_permission`
--

INSERT INTO `menu_permission` (`menu_permission_id`, `user_group_id`, `dashboard_read`, `coa_read`, `coa_group_add`, `coa_group_edit`, `coa_group_delete`, `coa_ledger_add`, `coa_ledger_edit`, `coa_ledger_delete`, `coa_export`, `entry_read`, `entry_journal_add`, `entry_journal_edit`, `entry_journal_delete`, `entry_receipt_add`, `entry_receipt_edit`, `entry_receipt_delete`, `entry_payment_add`, `entry_payment_edit`, `entry_payment_delete`, `entry_contra_add`, `entry_contra_edit`, `entry_contra_delete`, `report_read`, `report_balance_sheet`, `report_profit_loss`, `report_trial_balance`, `report_ledger_statement`, `report_ledger_entry`, `report_reconciliation`, `search`, `account_setting`, `user_permession`, `buku_fiscal`, `project_setting`, `tag_setting`, `crm_setting`, `log_setting`, `product_setting`, `service_setting`, `email_setting`, `data_master_setting`) VALUES
(1, 2, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0),
(2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0),
(3, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(5, 7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `harga`, `created_at`, `updated_at`) VALUES
(1, 17.622, '2021-06-02 21:48:33', '2021-06-02 21:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `name`, `email`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@sisku.com', '$2y$10$2QWjtOSW6r9O.SD6jjBGb.InP0UQyThwWdOORgWcJ7ZLqTZWUzNc6', '081336619274', NULL, '2020-08-18 03:33:33', '2021-06-08 08:32:00'),
(20211644, 2, 'aqil', '4bdulloh.aqil@gmail.com', '$2y$10$6QQzdadvnyKI5oCKs4UJZuLzcQKUkUbS3g1xrHyquee0TnlxFWcVa', NULL, NULL, '2021-05-02 22:10:25', '2021-05-02 22:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_account_handle`
--

CREATE TABLE `user_account_handle` (
  `id_handle` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_account_handle`
--

INSERT INTO `user_account_handle` (`id_handle`, `account_id`, `user_id`, `created_at`, `updated_at`) VALUES
(17, 1, 20211644, '2021-05-03 05:13:39', NULL),
(20, 1, 20211645, '2021-05-31 03:56:59', NULL),
(22, 1, 20211646, '2021-05-31 04:04:23', NULL),
(23, 1, 1, '2021-06-08 15:32:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2020-08-19 02:11:55', NULL),
(2, 'Akuntan', '2020-08-19 02:11:55', NULL),
(3, 'hrd', '2020-08-19 02:11:55', NULL),
(6, 'Pencatatan Lembaga', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idxs_fiscal` (`fiscal_id`);

--
-- Indexes for table `entry_items`
--
ALTER TABLE `entry_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_items_entries_id_foreign` (`entries_id`);

--
-- Indexes for table `fiscal`
--
ALTER TABLE `fiscal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ledgers_ledger_code_unique` (`ledger_code`),
  ADD KEY `ledgers_group_id_foreign` (`group_id`);

--
-- Indexes for table `menu_permission`
--
ALTER TABLE `menu_permission`
  ADD PRIMARY KEY (`menu_permission_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_account_handle`
--
ALTER TABLE `user_account_handle`
  ADD PRIMARY KEY (`id_handle`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `entry_items`
--
ALTER TABLE `entry_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fiscal`
--
ALTER TABLE `fiscal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `menu_permission`
--
ALTER TABLE `menu_permission`
  MODIFY `menu_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20211647;

--
-- AUTO_INCREMENT for table `user_account_handle`
--
ALTER TABLE `user_account_handle`
  MODIFY `id_handle` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
