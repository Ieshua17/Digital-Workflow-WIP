-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 07:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spcf_thesis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `office` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `must_change_password` tinyint(1) NOT NULL DEFAULT 1,
  `password_changed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `first_name`, `last_name`, `email`, `password`, `office`, `position`, `phone`, `created_at`, `must_change_password`, `password_changed_at`) VALUES
('ADM001', 'System', 'Administrator', 'admin@university.edu', '$2y$10$KHzeZ4x47Os17QC99z1q5et41w1.StlyYQ2fQgQ8j5oYAHd4M106q', 'IT Department', 'System Administrator', NULL, '2025-09-18 14:31:44', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size_kb` int(11) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `document_id`, `file_path`, `file_type`, `file_size_kb`, `uploaded_at`) VALUES
(1, 1, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 04:47:30'),
(2, 2, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 04:47:31'),
(3, 3, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 05:01:09'),
(4, 4, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 05:01:10'),
(5, 5, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 06:43:42'),
(6, 6, '../assets/mock/sample.pdf', 'application/pdf', 12, '2025-09-21 14:05:48'),
(7, 7, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-21 14:14:02'),
(8, 8, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-21 14:25:02'),
(9, 9, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-21 14:46:59'),
(10, 10, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-22 02:52:11'),
(11, 11, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-22 03:29:03'),
(12, 12, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-22 03:29:12'),
(13, 13, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-22 05:05:14'),
(14, 14, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-22 05:15:45'),
(15, 15, '../assets/mock/sample2.pdf', 'application/pdf', 12, '2025-09-23 07:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` varchar(20) DEFAULT NULL,
  `user_role` enum('admin','employee','student','system') NOT NULL DEFAULT 'system',
  `action` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `target_id` varchar(50) DEFAULT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `severity` enum('INFO','WARNING','ERROR') NOT NULL DEFAULT 'INFO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `timestamp`, `user_id`, `user_role`, `action`, `category`, `details`, `target_id`, `target_type`, `ip_address`, `user_agent`, `severity`) VALUES
(1, '2025-09-21 14:14:09', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '4', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(2, '2025-09-21 14:37:16', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '1', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(3, '2025-09-21 14:43:49', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '5', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(4, '2025-09-21 14:43:53', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '3', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(5, '2025-09-21 14:43:57', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '2', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(6, '2025-09-21 22:13:57', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '6', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(7, '2025-09-21 22:24:56', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '7', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(8, '2025-09-22 09:56:49', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '9', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(9, '2025-09-22 11:03:53', 'EMP001', 'employee', 'DOCUMENT_REJECTED', 'Document Management', 'Document rejected by Maria Santos: Nothing', '8', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WARNING'),
(10, '2025-09-22 11:24:10', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '10', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(11, '2025-09-22 11:29:09', 'EMP001', 'employee', 'DOCUMENT_REJECTED', 'Document Management', 'Document rejected by Maria Santos: asdasd', '11', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WARNING'),
(12, '2025-09-22 11:34:07', 'EMP001', 'employee', 'DOCUMENT_REJECTED', 'Document Management', 'Document rejected by Maria Santos: ASas', '12', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WARNING'),
(13, '2025-09-23 15:36:02', 'EMP001', 'employee', 'DOCUMENT_REJECTED', 'Document Management', 'Document rejected by Maria Santos: asdasdasd', '15', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WARNING'),
(14, '2025-09-23 16:24:21', 'EMP001', 'employee', 'DOCUMENT_REJECTED', 'Document Management', 'Document rejected by Maria Santos: asdasd', '14', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'WARNING'),
(15, '2025-09-25 15:46:19', 'EMP001', 'employee', 'DOCUMENT_SIGNED', 'Document Management', 'Document signed by Maria Santos', '13', 'Document', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'INFO'),
(16, '2025-09-28 18:58:53', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO'),
(17, '2025-09-28 18:59:22', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO'),
(18, '2025-09-28 19:04:46', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO'),
(19, '2025-09-28 19:05:35', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO'),
(20, '2025-09-28 19:05:37', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO'),
(21, '2025-09-28 19:06:58', 'STU001', 'system', 'CREATE_DOCUMENT_VIEWED', 'Document Management', 'Viewed create document page', 'STU001', 'User', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 OPR/122.0.0.0', 'INFO');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `doc_type` enum('proposal','saf','facility','communication','material') NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('draft','submitted','in_review','approved','rejected','cancelled') NOT NULL DEFAULT 'submitted',
  `current_step` int(11) NOT NULL DEFAULT 1,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `student_id`, `doc_type`, `title`, `description`, `status`, `current_step`, `uploaded_at`, `updated_at`, `file_path`) VALUES
(1, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 04:47:30', '2025-09-21 06:37:16', NULL),
(2, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 04:47:31', '2025-09-21 06:43:57', NULL),
(3, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 05:01:09', '2025-09-21 06:43:53', NULL),
(4, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 05:01:10', '2025-09-21 06:14:09', NULL),
(5, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 06:43:42', '2025-09-21 06:43:49', NULL),
(6, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 14:05:48', '2025-09-21 14:13:57', NULL),
(7, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 14:14:02', '2025-09-21 14:24:56', NULL),
(8, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'rejected', 1, '2025-09-21 14:25:02', '2025-09-22 03:03:53', NULL),
(9, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-21 14:46:59', '2025-09-22 01:56:49', NULL),
(10, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-22 02:52:11', '2025-09-22 03:24:10', NULL),
(11, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'rejected', 1, '2025-09-22 03:29:03', '2025-09-22 03:29:09', NULL),
(12, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'rejected', 1, '2025-09-22 03:29:12', '2025-09-22 03:34:07', NULL),
(13, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'approved', 1, '2025-09-22 05:05:14', '2025-09-25 07:46:19', NULL),
(14, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'rejected', 1, '2025-09-22 05:15:45', '2025-09-23 08:24:21', NULL),
(15, 'STU101', 'proposal', 'Mock Research Proposal: Energy Efficiency', 'Auto-generated mock for testing PDF preview and e-signature placement.', 'rejected', 1, '2025-09-23 07:35:46', '2025-09-23 07:36:02', NULL),
(30, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 14:43:15', NULL, NULL),
(31, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 14:44:11', NULL, NULL),
(32, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 14:47:17', NULL, NULL),
(33, 'STU001', 'proposal', 'SAMPLE 1', 'SAMPLE 1', 'submitted', 1, '2025-09-27 14:53:23', NULL, NULL),
(34, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 15:58:34', NULL, NULL),
(35, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:00:44', NULL, NULL),
(36, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:20:20', NULL, NULL),
(37, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:21:15', NULL, NULL),
(38, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:29:26', NULL, NULL),
(39, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:32:23', NULL, NULL),
(40, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:32:58', NULL, NULL),
(41, 'STU001', 'proposal', '', '', 'submitted', 1, '2025-09-27 16:34:33', NULL, NULL),
(43, 'STU001', 'saf', 'Sample 1', '', 'submitted', 1, '2025-09-28 10:49:10', NULL, NULL),
(44, 'STU001', 'proposal', 'SAMPLE 1', 'SAMPLE 1', 'submitted', 1, '2025-09-28 10:50:33', NULL, NULL),
(45, 'STU001', 'saf', 'SAMPLE 1', '', 'submitted', 1, '2025-09-28 10:51:25', NULL, NULL),
(46, 'STU001', 'facility', 'Untitled', '', 'submitted', 1, '2025-09-28 10:52:58', NULL, NULL),
(47, 'STU001', 'communication', 'SAMPLE 1', '', 'submitted', 1, '2025-09-28 10:53:13', NULL, NULL),
(48, 'STU001', 'communication', 'SAMPLE 1', '', 'submitted', 1, '2025-09-28 10:54:00', NULL, NULL),
(49, 'STU001', 'communication', 'SAMPLE 1', '', 'submitted', 1, '2025-09-28 10:59:02', NULL, '../uploads/filled_doc_68d914f64f39f1.40787184.docx'),
(50, 'STU001', 'facility', 'Untitled', '', 'submitted', 1, '2025-09-28 11:00:28', NULL, NULL),
(51, 'STU001', 'facility', 'Untitled', '', 'submitted', 1, '2025-09-28 11:04:55', NULL, '../uploads/filled_doc_68d91657bde000.01372014.docx'),
(52, 'STU001', 'saf', 'SAMPLE 1', '', 'submitted', 1, '2025-09-28 11:06:04', NULL, '../uploads/filled_doc_68d9169c326cb2.14879273.docx');

-- --------------------------------------------------------

--
-- Table structure for table `document_notes`
--

CREATE TABLE `document_notes` (
  `id` bigint(20) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `author_id` varchar(20) NOT NULL,
  `author_role` enum('admin','employee','student') NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_signatures`
--

CREATE TABLE `document_signatures` (
  `id` bigint(20) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `step_id` bigint(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `status` enum('pending','signed','rejected') NOT NULL DEFAULT 'pending',
  `signed_at` datetime DEFAULT NULL,
  `signature_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_signatures`
--

INSERT INTO `document_signatures` (`id`, `document_id`, `step_id`, `employee_id`, `status`, `signed_at`, `signature_path`) VALUES
(1, 4, 4, 'EMP001', 'signed', '2025-09-21 14:14:09', NULL),
(2, 1, 1, 'EMP001', 'signed', '2025-09-21 14:37:16', NULL),
(3, 5, 5, 'EMP001', 'signed', '2025-09-21 14:43:49', NULL),
(4, 3, 3, 'EMP001', 'signed', '2025-09-21 14:43:53', NULL),
(5, 2, 2, 'EMP001', 'signed', '2025-09-21 14:43:57', NULL),
(6, 6, 6, 'EMP001', 'signed', '2025-09-21 22:13:57', NULL),
(7, 7, 7, 'EMP001', 'signed', '2025-09-21 22:24:56', NULL),
(8, 9, 9, 'EMP001', 'signed', '2025-09-22 09:56:49', '../assets/signatures/signature_doc9_empEMP001_1758506209.png'),
(9, 8, 8, 'EMP001', 'rejected', '2025-09-22 11:03:53', NULL),
(10, 10, 10, 'EMP001', 'signed', '2025-09-22 11:24:10', '../assets/signatures/signature_doc10_empEMP001_1758511450.png'),
(11, 11, 11, 'EMP001', 'rejected', '2025-09-22 11:29:09', NULL),
(12, 12, 12, 'EMP001', 'rejected', '2025-09-22 11:34:07', NULL),
(13, 15, 15, 'EMP001', 'rejected', '2025-09-23 15:36:02', NULL),
(14, 14, 14, 'EMP001', 'rejected', '2025-09-23 16:24:21', NULL),
(15, 13, 13, 'EMP001', 'signed', '2025-09-25 15:46:19', '../assets/signatures/signature_doc13_empEMP001_1758786379.png');

-- --------------------------------------------------------

--
-- Table structure for table `document_steps`
--

CREATE TABLE `document_steps` (
  `id` bigint(20) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `step_order` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `assigned_to_employee_id` varchar(20) DEFAULT NULL,
  `status` enum('pending','completed','rejected','skipped') NOT NULL DEFAULT 'pending',
  `acted_at` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `creates_event` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_steps`
--

INSERT INTO `document_steps` (`id`, `document_id`, `step_order`, `name`, `assigned_to_employee_id`, `status`, `acted_at`, `note`, `creates_event`) VALUES
(1, 1, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 14:37:16', '', 0),
(2, 2, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 14:43:57', '', 0),
(3, 3, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 14:43:53', '', 0),
(4, 4, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 14:14:09', '', 0),
(5, 5, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 14:43:49', '', 0),
(6, 6, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 22:13:57', '', 0),
(7, 7, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-21 22:24:56', '', 0),
(8, 8, 1, 'Initial Review', 'EMP001', 'rejected', '2025-09-22 11:03:53', 'Nothing', 0),
(9, 9, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-22 09:56:49', '', 0),
(10, 10, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-22 11:24:10', '', 0),
(11, 11, 1, 'Initial Review', 'EMP001', 'rejected', '2025-09-22 11:29:09', 'asdasd', 0),
(12, 12, 1, 'Initial Review', 'EMP001', 'rejected', '2025-09-22 11:34:07', 'ASas', 0),
(13, 13, 1, 'Initial Review', 'EMP001', 'completed', '2025-09-25 15:46:19', '', 0),
(14, 14, 1, 'Initial Review', 'EMP001', 'rejected', '2025-09-23 16:24:21', 'asdasd', 0),
(15, 15, 1, 'Initial Review', 'EMP001', 'rejected', '2025-09-23 15:36:02', 'asdasdasd', 0),
(18, 30, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(19, 31, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(20, 32, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(21, 33, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(22, 43, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(23, 45, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(24, 46, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(25, 50, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(26, 51, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0),
(27, 52, 1, 'Initial Review', 'EMP002', 'pending', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `office` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `must_change_password` tinyint(1) NOT NULL DEFAULT 1,
  `password_changed_at` datetime DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `email`, `password`, `office`, `position`, `phone`, `created_at`, `must_change_password`, `password_changed_at`, `department`) VALUES
('EMP001', 'Maria', 'Santos', 'maria.santos@university.edu', '$2y$10$QchKOSOLB4VbmZVJSIma5..oSAhSrpB7MU8bIjdTcm7uo1xj.XRIi', 'Administration Office', 'Dean', NULL, '2025-09-18 14:31:44', 1, NULL, NULL),
('EMP002', 'John', 'Lennon', 'jlennon@example.com', '$2y$10$3r.822nbCQTrGaYJ8e4ZFOQK8FHdNIjwwnlCjW8X1Tu3dIUihevQW', 'IT Department', 'Instructor', '+639123456789', '2025-09-19 04:14:31', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_by_role` enum('admin','employee') NOT NULL,
  `source_document_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `event_date`, `event_time`, `unit_id`, `created_by`, `created_by_role`, `source_document_id`, `created_at`, `updated_at`) VALUES
(1, 'TEST 1', 'TEST 1', '2025-09-22', '15:50:00', 4, 'EMP001', 'employee', NULL, '2025-09-20 04:54:05', '2025-09-20 08:03:50'),
(2, 'ASASDASD', 'asdas', '2025-09-23', '15:15:00', 14, 'EMP001', 'employee', NULL, '2025-09-22 05:13:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` varchar(10) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size_kb` int(11) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `downloads` int(11) DEFAULT 0,
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejected_by` varchar(50) DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `student_id`, `title`, `description`, `file_path`, `file_type`, `file_size_kb`, `uploaded_at`, `status`, `downloads`, `approved_by`, `approved_at`, `rejected_by`, `rejected_at`, `rejection_reason`) VALUES
('', 'STU001', 'JAM C12 -2.jpg', 'Uploaded publication material', '../uploads/pubmat_68d5199fc743c1.85498266.jpg', NULL, 2532, '2025-09-25 10:29:51', 'pending', 0, NULL, NULL, NULL, NULL, NULL),
('1', 'STU001', '8ac292568e600485018e6ab9f704006d.jpg', 'Uploaded publication material', '../uploads/pubmat_68d4fb7d3578b2.31971270.jpg', 'image/jpeg', 276, '2025-09-25 08:21:17', 'pending', 0, NULL, NULL, NULL, NULL, NULL),
('MAT002', 'STU001', 'Gemini_Generated_Image_o1kqjpo1kqjpo1kq.png', 'DODODO', '../uploads/pubmat_68d51ba2b823a2.99377586.png', NULL, 1219, '2025-09-25 10:38:26', 'pending', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `recipient_id` varchar(20) NOT NULL,
  `recipient_role` enum('admin','employee','student') NOT NULL,
  `type` enum('document','system','event') NOT NULL DEFAULT 'document',
  `title` varchar(200) NOT NULL,
  `message` text DEFAULT NULL,
  `related_document_id` bigint(20) DEFAULT NULL,
  `related_event_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `role` enum('admin','employee','student') NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `must_change_password` tinyint(1) NOT NULL DEFAULT 1,
  `password_changed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `email`, `password`, `department`, `position`, `phone`, `created_at`, `must_change_password`, `password_changed_at`) VALUES
('STU001', 'Juan', 'Dela Cruz', 'juan.delacruz@student.university.edu', '$2y$10$kTyBM/Y5qYsfG//XtGVQw.N8BJQ6pcmkYCh0qsTxziLmkgTQgrQiS', 'College of Engineering', 'Student', NULL, '2025-09-18 14:31:44', 1, NULL),
('STU002', 'Paul', 'McCartney', 'pmccartney@example.com', '$2y$10$rO0FM0XJdTeuQwK09z4fHeVLBKkShHiLcK4zcHDg0qbl0d0i4CEoO', 'College of Business', 'Student Council President', '09192345678', '2025-09-19 04:55:27', 1, NULL),
('STU101', 'Juan', 'Dela Cruz', 'mock.student101@university.edu', '$2y$10$eUTOdvtu77.5Ndhy6YBwqe19cCeIEgEdQ7NAh2f3tkZ1MZ8xDIKqy', 'College of Engineering', 'Student', NULL, '2025-09-21 04:47:30', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `type` enum('office','college') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `code`, `type`) VALUES
(1, 'Administration Office', 'ADMIN', 'office'),
(2, 'Academic Affairs', 'ACAD', 'office'),
(3, 'Student Affairs', 'STUD', 'office'),
(4, 'Finance Office', 'FIN', 'office'),
(5, 'HR Department', 'HR', 'office'),
(6, 'IT Department', 'IT', 'office'),
(7, 'Library', 'LIB', 'office'),
(8, 'Registrar', 'REG', 'office'),
(9, 'College of Engineering', 'COE', 'college'),
(10, 'College of Nursing', 'CON', 'college'),
(11, 'College of Business', 'COB', 'college'),
(12, 'College of Criminology', 'COC', 'college'),
(13, 'College of Computing and Information Sciences', 'CCIS', 'college'),
(14, 'College of Art and Social Sciences and Education', 'CASSE', 'college'),
(15, 'College of Hospitality and Tourism Management', 'CHTM', 'college')
(16, 'SPCF Miranda', 'MIRANDA', 'college');

-- --------------------------------------------------------

--
-- Table structure for table `user_signatures`
--

CREATE TABLE `user_signatures` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attachments_document` (`document_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_audit_ts` (`timestamp`),
  ADD KEY `idx_audit_user` (`user_role`,`user_id`),
  ADD KEY `idx_audit_cat` (`category`,`action`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documents_student` (`student_id`),
  ADD KEY `idx_documents_type_status` (`doc_type`,`status`);

--
-- Indexes for table `document_notes`
--
ALTER TABLE `document_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notes_document` (`document_id`),
  ADD KEY `idx_notes_author` (`author_role`,`author_id`);

--
-- Indexes for table `document_signatures`
--
ALTER TABLE `document_signatures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_doc_step_signer` (`document_id`,`step_id`,`employee_id`),
  ADD KEY `fk_sig_step` (`step_id`),
  ADD KEY `fk_sig_employee` (`employee_id`);

--
-- Indexes for table `document_steps`
--
ALTER TABLE `document_steps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_doc_step` (`document_id`,`step_order`),
  ADD KEY `fk_steps_assignee` (`assigned_to_employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_events_unit` (`unit_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_materials_status` (`status`),
  ADD KEY `idx_materials_student` (`student_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notif_document` (`related_document_id`),
  ADD KEY `fk_notif_event` (`related_event_id`),
  ADD KEY `idx_notif_recipient` (`recipient_role`,`recipient_id`,`is_read`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_pr_user` (`role`,`user_id`),
  ADD KEY `idx_pr_expires` (`expires_at`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_units_name_type` (`name`,`type`);

--
-- Indexes for table `user_signatures`
--
ALTER TABLE `user_signatures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_employee_signature` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `document_notes`
--
ALTER TABLE `document_notes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_signatures`
--
ALTER TABLE `document_signatures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `document_steps`
--
ALTER TABLE `document_steps`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_signatures`
--
ALTER TABLE `user_signatures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `fk_attachments_document` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_documents_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_notes`
--
ALTER TABLE `document_notes`
  ADD CONSTRAINT `fk_notes_document` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_signatures`
--
ALTER TABLE `document_signatures`
  ADD CONSTRAINT `fk_sig_document` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sig_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sig_step` FOREIGN KEY (`step_id`) REFERENCES `document_steps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_steps`
--
ALTER TABLE `document_steps`
  ADD CONSTRAINT `fk_steps_assignee` FOREIGN KEY (`assigned_to_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_steps_document` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_unit` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `fk_materials_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_document` FOREIGN KEY (`related_document_id`) REFERENCES `documents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_notif_event` FOREIGN KEY (`related_event_id`) REFERENCES `events` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_signatures`
--
ALTER TABLE `user_signatures`
  ADD CONSTRAINT `fk_user_sign_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
