-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 01:47 AM
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
-- Database: `mh_office`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BN1BAbGWLH3ERMcoNvhRuPmazM0jzhnu0uD0bSFo', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic2VqMWc0REhyalR1c3J1NVJTZTBxbzZJdjdPMGwzV2x6TGp4RU5ITiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9hbm5vdW5jZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1721087243);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_animal_bite_care`
--

CREATE TABLE `tbl_animal_bite_care` (
  `animal_biteID` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `med_history` text DEFAULT NULL,
  `bleeding` varchar(20) NOT NULL,
  `cpi_month` varchar(20) DEFAULT NULL,
  `cpi_year` int(11) DEFAULT NULL,
  `animal_type` varchar(255) DEFAULT NULL,
  `date_bite` date DEFAULT NULL,
  `Place` varchar(255) DEFAULT NULL,
  `Type_bite` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `pet_vaccinated` varchar(255) DEFAULT NULL,
  `animal_status` varchar(255) DEFAULT NULL,
  `site_exposure` varchar(255) DEFAULT NULL,
  `wound` varchar(20) DEFAULT NULL,
  `washed` varchar(20) DEFAULT NULL,
  `soap` varchar(20) DEFAULT NULL,
  `Tandok` varchar(20) DEFAULT NULL,
  `Applied` varchar(20) DEFAULT NULL,
  `Tetanus` varchar(20) DEFAULT NULL,
  `vac_date` date DEFAULT NULL,
  `vaccine` varchar(255) DEFAULT NULL,
  `category_exposure` varchar(255) DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_animal_bite_vaccination`
--

CREATE TABLE `tbl_animal_bite_vaccination` (
  `animal_bite_vacID` int(11) NOT NULL,
  `vaccination_name` varchar(100) NOT NULL,
  `vaccination_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `dose_number` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_announcements`
--

CREATE TABLE `tbl_announcements` (
  `announceID` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(150) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_announcements`
--

INSERT INTO `tbl_announcements` (`announceID`, `date`, `title`, `details`, `created_at`, `updated_at`) VALUES
(1, '2024-07-16', 'New Operating Hours', 'The health center will now be open from 8:00 AM to 6:00 PM, Monday to Friday.', '2024-07-15 23:34:48', '2024-07-15 23:34:48'),
(2, '2024-07-15', 'New Staff Announcement', 'We are pleased to welcome Dr. Jane Doe to our team.', '2024-07-15 23:40:11', '2024-07-15 23:40:11'),
(3, '2024-07-14', 'Holiday Schedule Update', 'Please note that the health center will be closed on July 17th for a public holiday.', '2024-07-15 23:40:11', '2024-07-15 23:40:11'),
(4, '2024-07-10', 'COVID-19 Vaccination Drive', 'Join us for our community COVID-19 vaccination drive this weekend.', '2024-07-15 23:40:11', '2024-07-15 23:40:11'),
(5, '2024-07-05', 'Telemedicine Services Launch', 'Introducing our new telemedicine services for patient consultations.', '2024-07-15 23:40:11', '2024-07-15 23:40:11'),
(6, '2024-06-30', 'Health Awareness Campaign', 'Join us in spreading awareness about mental health this month.', '2024-07-15 23:40:11', '2024-07-15 23:40:11'),
(7, '2024-07-17', 'Test', 'We are pleased to welcome Dr. Jane Doe to our team.', '2024-07-15 23:41:39', '2024-07-15 23:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointments`
--

CREATE TABLE `tbl_appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_birthing_details`
--

CREATE TABLE `tbl_birthing_details` (
  `birthID` int(11) NOT NULL,
  `admission` datetime NOT NULL,
  `discharge` datetime NOT NULL,
  `admitting_diagnosis` varchar(255) NOT NULL,
  `final_diagnosis` varchar(255) NOT NULL,
  `procedure_done` varchar(100) NOT NULL,
  `disposition` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `midwife` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_birth_info`
--

CREATE TABLE `tbl_birth_info` (
  `birthInfoID` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `lmp` varchar(20) DEFAULT NULL,
  `edc` varchar(20) DEFAULT NULL,
  `aog` varchar(20) DEFAULT NULL,
  `G` varchar(20) DEFAULT NULL,
  `P` varchar(20) DEFAULT NULL,
  `1` varchar(20) DEFAULT NULL,
  `2` varchar(20) DEFAULT NULL,
  `3` varchar(20) DEFAULT NULL,
  `4` varchar(20) DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `pr` varchar(20) DEFAULT NULL,
  `rr` varchar(20) DEFAULT NULL,
  `T` varchar(20) DEFAULT NULL,
  `fhb` varchar(20) DEFAULT NULL,
  `loc` varchar(255) DEFAULT NULL,
  `presentation` varchar(100) DEFAULT NULL,
  `vaginal_discharge` varchar(100) DEFAULT NULL,
  `midwife` varchar(255) DEFAULT NULL,
  `physical_exam_id` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_certificate_log`
--

CREATE TABLE `tbl_certificate_log` (
  `log_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `generated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_certificate_log`
--

INSERT INTO `tbl_certificate_log` (`log_id`, `patient_id`, `generated_at`) VALUES
(7, 10, '2024-06-18 16:36:42'),
(8, 12, '2024-06-18 18:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checkup`
--

CREATE TABLE `tbl_checkup` (
  `checkupID` int(11) NOT NULL,
  `admitted` datetime NOT NULL,
  `history` varchar(50) NOT NULL,
  `per_pas_med` varchar(255) NOT NULL,
  `pertinent_signs` varchar(255) NOT NULL,
  `gen_survey` varchar(255) NOT NULL,
  `heent` varchar(255) NOT NULL,
  `chest` varchar(255) NOT NULL,
  `CSV` varchar(255) NOT NULL,
  `abdomen` varchar(255) NOT NULL,
  `GU` varchar(255) NOT NULL,
  `skin_extremeties` varchar(255) NOT NULL,
  `neuro_exam` varchar(255) NOT NULL,
  `disability` varchar(50) NOT NULL,
  `disability_type` varchar(50) NOT NULL,
  `doctor_order` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_checkup`
--

INSERT INTO `tbl_checkup` (`checkupID`, `admitted`, `history`, `per_pas_med`, `pertinent_signs`, `gen_survey`, `heent`, `chest`, `CSV`, `abdomen`, `GU`, `skin_extremeties`, `neuro_exam`, `disability`, `disability_type`, `doctor_order`, `patient_id`) VALUES
(40, '2024-06-18 17:44:00', 'none', 'none', '[\"Headache\",\"\"]', '', '[\"\"]', '[\"\"]', '[\"\"]', '[\"\"]', '[\"\"]', '[\"\"]', '[\"\"]', 'no', '', 'must give medication asap', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaints`
--

CREATE TABLE `tbl_complaints` (
  `complaintID` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `Chief_Complaint` varchar(255) NOT NULL,
  `Remarks` varchar(255) NOT NULL,
  `bp` varchar(20) NOT NULL,
  `hr` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `rr` varchar(20) NOT NULL,
  `temp` varchar(20) NOT NULL,
  `Height` varchar(20) NOT NULL,
  `Nature_Visit` varchar(100) NOT NULL,
  `consultation_purpose` varchar(100) NOT NULL,
  `refferred` varchar(100) NOT NULL,
  `reason_ref` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaints`
--

INSERT INTO `tbl_complaints` (`complaintID`, `patient_id`, `Chief_Complaint`, `Remarks`, `bp`, `hr`, `weight`, `rr`, `temp`, `Height`, `Nature_Visit`, `consultation_purpose`, `refferred`, `reason_ref`, `status`, `date`) VALUES
(16, 12, 'severe headache', 'severe headache that started 2 days ago', '110 / 70_', '90', '55kg', '16', '38°C', '165cm', 'New admission', 'Checkup', 'ellen', 'manganakayssevere headache', 'Done', '2024-06-18 17:37:33'),
(17, 12, 'head ache', 'severe headache that started 2 days ago', '120 / 80_', '20', '55kg', '16', '38°C', '165cm', 'Follow-up visit', 'Checkup', 'guihara', 'head ache', 'Pending', '2024-06-18 17:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_schedule`
--

CREATE TABLE `tbl_doctor_schedule` (
  `doc_scheduleID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `day_of_week` varchar(15) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_doctor_schedule`
--

INSERT INTO `tbl_doctor_schedule` (`doc_scheduleID`, `userID`, `day_of_week`, `start_time`, `end_time`, `is_available`) VALUES
(2, 9, 'May 11, 2024', '10:00:00', '14:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_family`
--

CREATE TABLE `tbl_family` (
  `famID` int(11) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `purok` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_family`
--

INSERT INTO `tbl_family` (`famID`, `brgy`, `purok`, `province`) VALUES
(15, 'Sampao', 'Pagkaka', 'Sultan Kudarat'),
(16, 'Palavilla', 'Dsadasd', 'South Cotabato');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_immunization_records`
--

CREATE TABLE `tbl_immunization_records` (
  `immunID` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `vaccine` varchar(255) NOT NULL,
  `immunization_date` date DEFAULT NULL,
  `immunization_next_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_immunization_types`
--

CREATE TABLE `tbl_immunization_types` (
  `immun_typeID` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `age_group` varchar(20) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_medicines`
--

CREATE TABLE `tbl_medicines` (
  `medicineID` int(11) NOT NULL,
  `medicine_name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `manuf_date` date NOT NULL,
  `ex_date` date DEFAULT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_medicines`
--

INSERT INTO `tbl_medicines` (`medicineID`, `medicine_name`, `description`, `supplier`, `category`, `manuf_date`, `ex_date`, `manufacturer`, `brand`, `date_added`) VALUES
(7, 'Paracetamol', 'Paracetamolparacetamol', 'Unilab', 'Antibiotics', '2024-01-04', '2027-08-04', 'Unilab', 'Unilab', '2024-04-15 15:25:42'),
(8, 'Amoxicillin', 'Amoxicillin', 'Amoxicillin', 'Anticoagulants', '2024-09-04', '2029-05-04', 'Amoxicillin', 'Amoxicillin', '2024-04-15 15:29:35'),
(9, 'Ativan', 'Ativan', 'Ativan', 'Bronchodilators', '2024-05-16', '2029-06-04', 'Ativan', 'Ativan', '2024-04-15 15:36:43'),
(10, 'Azithromycin', 'Azit', 'Azithromycin', 'Analgesics', '2024-01-04', '2029-05-04', 'Azithromycin', 'Azithromycin', '2024-04-15 15:46:48'),
(11, 'Bio-flu', 'Fd', 'Fdsaf', 'Analgesics', '2024-06-01', '2025-03-04', 'Tes', 'Test', '2024-04-29 08:55:48'),
(12, 'Boi-gesic', 'Boi-gesic', 'Boi-gesic', 'Antibiotics', '2024-03-05', '2029-02-05', 'boi-gesic', 'boi-gesic', '2024-05-03 08:52:24'),
(13, 'Rabies Vaccine', 'An Active Immunizing Agent Used To Prevent Infection Caused By The Rabies Virus', 'Imovax Rabies', 'Vaccines', '2024-05-01', '2030-07-05', 'Merative, Micromedex®', 'Us Brand Name', '2024-05-14 09:59:37'),
(14, 'BGC Vaccine', 'Bcg Vaccine', 'Bcg Vaccine', 'Vaccines', '2024-05-16', '2024-05-16', 'Bcg Vaccine', 'Bcg Vaccine', '2024-05-16 16:11:45'),
(15, 'Hepatitis B Vaccine', 'Hepatitis B Vaccine', 'Hepatitis B Vaccine', 'Vaccines', '2024-05-01', '2027-05-12', 'Hepatitis B Vaccine', 'Hepatitis B Vaccine', '2024-05-16 16:19:00'),
(16, 'Pentavalent Vaccine', '(dpt-hep B-hib)', 'Pentavalent Vaccine', 'Vaccines', '2024-08-05', '2027-05-05', 'Pentavalent Vaccine', 'Pentavalent Vaccine', '2024-05-16 16:19:23'),
(17, 'Oral Polio Vaccine (opv)', 'Oral Polio Vaccine (opv)', 'Oral Polio Vaccine (opv)', 'Vaccines', '2024-09-05', '2030-02-08', 'Oral Polio Vaccine (opv)', 'Oral Polio Vaccine (opv)', '2024-05-16 16:19:41'),
(18, 'Inactivated Polio Vaccine (ipv)', 'Inactivated Polio Vaccine (ipv)', 'Inactivated Polio Vaccine (ipv)', 'Vaccines', '2024-05-01', '2024-05-22', 'Inactivated Polio Vaccine (IPV)', 'Inactivated Polio Vaccine (IPV)', '2024-05-16 16:19:52'),
(19, 'Pneumococcal Conjugate Vaccine (pcv)', 'Pneumococcal', 'Pneumococcal', 'Vaccines', '2024-10-22', '2032-03-18', 'Pneumococcal', 'Pneumococcal', '2024-05-16 16:20:08'),
(25, 'Cefdinir', 'Cefdinir', 'Cefdinir', 'Antidepressants', '2024-12-06', '2030-01-06', 'Cefdinir', 'Cefdinir', '2024-06-18 12:28:55'),
(28, 'Lorapiden', 'For Allergic Reaction', 'Med Phar', 'Vaccines', '2024-08-15', '2025-02-13', 'Med Phar', 'Claritin', '2024-06-18 17:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_medicine_details`
--

CREATE TABLE `tbl_medicine_details` (
  `med_detailsID` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `packing` varchar(60) NOT NULL,
  `qt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_medicine_details`
--

INSERT INTO `tbl_medicine_details` (`med_detailsID`, `medicine_id`, `packing`, `qt`) VALUES
(19, 8, 'ml', '163'),
(20, 7, 'mg', '56'),
(21, 9, 'tablet', '58'),
(22, 12, 'ml', '81'),
(23, 13, 'injectable', '84'),
(24, 11, 'tablet', '70'),
(25, 18, 'injectable', '100'),
(26, 15, 'injectable', '100'),
(27, 17, 'syrup', '95'),
(28, 14, 'injectable', '94'),
(29, 16, 'injectable', '100'),
(30, 10, 'injectable', '100'),
(31, 19, 'injectable', '101'),
(32, 25, 'ML', '89'),
(33, 27, 'tablet', '100'),
(34, 28, 'mg', '100');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_membership_info`
--

CREATE TABLE `tbl_membership_info` (
  `membershipID` int(11) NOT NULL,
  `phil_mem` varchar(50) NOT NULL,
  `philhealth_no` varchar(255) NOT NULL,
  `phil_membership` varchar(100) NOT NULL,
  `ps_mem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_membership_info`
--

INSERT INTO `tbl_membership_info` (`membershipID`, `phil_mem`, `philhealth_no`, `phil_membership`, `ps_mem`) VALUES
(13, 'Yes', '06-246989-65', 'Member', '[\"4PS\",\"LGU\"]'),
(14, 'No', '', '', '[\"NHTS\",\"LGU\"]');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patients`
--

CREATE TABLE `tbl_patients` (
  `patientID` int(11) NOT NULL,
  `family_address` int(11) NOT NULL,
  `Membership_Info` int(11) NOT NULL,
  `household_no` varchar(255) NOT NULL,
  `patient_name` varchar(60) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `father_guardian_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `cnic` varchar(17) NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `age` varchar(20) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `ed_at` varchar(100) NOT NULL,
  `emp_stat` varchar(100) NOT NULL,
  `Nationality` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_patients`
--

INSERT INTO `tbl_patients` (`patientID`, `family_address`, `Membership_Info`, `household_no`, `patient_name`, `middle_name`, `last_name`, `suffix`, `father_guardian_name`, `mother_name`, `cnic`, `date_of_birth`, `age`, `phone_number`, `gender`, `civil_status`, `blood_type`, `ed_at`, `emp_stat`, `Nationality`, `reg_date`, `userID`) VALUES
(12, 15, 13, '9107055', 'Emma', 'U.', 'Datuwata', '', 'Janesha', 'Jonathana', '0000000001', '2005-08-17', '18 years', '+63965623232', 'Female', 'Single', 'O-', 'High School', 'test', 'Filipino', '2024-06-18 17:36:09', 2),
(13, 16, 14, '9107056', 'Joven', 'V', 'Rey', '', 'JaneshD', 'Fsda', '0000000013', '1992-04-29', '32 Years', '+63123213212', 'Male', 'Separated', 'B+', 'Elementary', 'LUPIN', 'Asian', '2024-06-28 14:56:25', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_medication_history`
--

CREATE TABLE `tbl_patient_medication_history` (
  `patient_med_historyID` int(11) NOT NULL,
  `patient_visit_id` int(11) NOT NULL,
  `medicine_details_id` int(11) NOT NULL,
  `con_type` varchar(30) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  `schedule_dosage` varchar(100) NOT NULL,
  `mg_ml` varchar(20) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `time_frame` varchar(100) NOT NULL,
  `advice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_patient_medication_history`
--

INSERT INTO `tbl_patient_medication_history` (`patient_med_historyID`, `patient_visit_id`, `medicine_details_id`, `con_type`, `quantity`, `dosage`, `schedule_dosage`, `mg_ml`, `duration`, `time_frame`, `advice`) VALUES
(27, 46, 25, 'Oral(p/o)', '1', 'schedule dose', 'After Meal', '125 mg', 'Twice a day', '7 (Day)', 'with or without food'),
(28, 47, 25, 'Oral(p/o)', '10', 'schedule dose', 'Before Meal', '120 mg', 'Twice a day', '7 (Day)', 'take w/o food'),
(29, 47, 12, 'Oral(p/o)', '10', 'as needed', '', '500 mg', 'Every 4 hours', '3 (Day)', 'take w/o food');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient_visits`
--

CREATE TABLE `tbl_patient_visits` (
  `patient_visitID` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  `next_visit_date` date DEFAULT NULL,
  `disease` varchar(255) NOT NULL,
  `recom` text NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_patient_visits`
--

INSERT INTO `tbl_patient_visits` (`patient_visitID`, `visit_date`, `next_visit_date`, `disease`, `recom`, `patient_id`, `doctor_id`) VALUES
(46, '2024-06-18', '2024-06-27', 'UTI', '7 days rest', 10, 9),
(47, '2024-06-18', '2024-06-25', 'headache', 'give plenty of fluids and rest', 12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personnel`
--

CREATE TABLE `tbl_personnel` (
  `personnel_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_personnel`
--

INSERT INTO `tbl_personnel` (`personnel_id`, `first_name`, `middlename`, `lastname`, `contact`, `email`, `address`) VALUES
(1, 'admin', 'M.', 'admin', 'Koronadal City', 'admin@gmail.com', '+639645563132'),
(2, 'Bhwbarangay', '', 'Bhw1', '+634134646546', 'admin123@gmail.com', '+632131231237'),
(7, 'Rhu', 'R', 'Rhu', 'Koronadal City , South Cotabato', 'RHU@gmail.com', '+631232131321'),
(8, 'Elleen', '', 'Tunguia', '+634744477477', 'elleen@gmail.com', 'Koronadal City , South Cotabato'),
(9, 'Wiljun', '', 'Pangarintao', '09653231547', 'doctor@gmail.com', 'koronadal city'),
(10, '1', '131', '11', '1', '1@gmail.com', '+632989656323'),
(12, 'Physician', 'P', 'Physician', 'koronadal city', 'Physician@gmail.com', '+639232131312');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_physical_exam`
--

CREATE TABLE `tbl_physical_exam` (
  `physical_exam_id` int(11) NOT NULL,
  `head_neck` varchar(255) DEFAULT NULL,
  `chest` varchar(255) DEFAULT NULL,
  `heart` varchar(255) DEFAULT NULL,
  `abdomen` varchar(255) DEFAULT NULL,
  `extremities` varchar(255) DEFAULT NULL,
  `vulva` varchar(255) DEFAULT NULL,
  `vagina` varchar(255) DEFAULT NULL,
  `cervix` varchar(255) DEFAULT NULL,
  `uterus` varchar(255) DEFAULT NULL,
  `bow` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_physical_exam`
--

INSERT INTO `tbl_physical_exam` (`physical_exam_id`, `head_neck`, `chest`, `heart`, `abdomen`, `extremities`, `vulva`, `vagina`, `cervix`, `uterus`, `bow`) VALUES
(1, '1', '1', '1', '1', '1', '1', '1', '1', '1', 'fsdafsad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position`
--

CREATE TABLE `tbl_position` (
  `position_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `PositionName` varchar(100) NOT NULL,
  `Specialty` varchar(100) NOT NULL,
  `ProfessionalType` varchar(100) NOT NULL,
  `LicenseNo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`position_id`, `personnel_id`, `PositionName`, `Specialty`, `ProfessionalType`, `LicenseNo`) VALUES
(1, 1, '', '', '', ''),
(2, 2, '', '', '', ''),
(7, 7, '', '', '', ''),
(8, 8, '', '', '', ''),
(9, 9, 'Registereddoctor', 'Cardiology', 'MD, FPSMS', '106268'),
(10, 10, '1', '1', '1', '1'),
(11, 11, '', '', '', ''),
(12, 12, 'Physician', 'Physician', 'Physician', '09523215'),
(13, 13, 'dsa', 'dsa', 'dsa', 'dsa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prenatal`
--

CREATE TABLE `tbl_prenatal` (
  `prenatalID` int(11) NOT NULL,
  `date` date NOT NULL,
  `chief_complaint` varchar(100) NOT NULL,
  `attending_physician` int(11) NOT NULL,
  `lmp` varchar(20) NOT NULL,
  `ga_by_lmp` varchar(20) NOT NULL,
  `edc_by_lmp` varchar(20) NOT NULL,
  `fhr` varchar(20) NOT NULL,
  `ga_by_sonar` varchar(20) NOT NULL,
  `edc_by_utz` varchar(20) NOT NULL,
  `pregnancy_age` varchar(20) NOT NULL,
  `biparietal_diameter` varchar(20) NOT NULL,
  `biparietal_eq` varchar(20) NOT NULL,
  `head_circumference` varchar(20) NOT NULL,
  `head_circumference_eq` varchar(20) NOT NULL,
  `abdominal_circumference` varchar(20) NOT NULL,
  `abdominal_circumference_eq` varchar(20) NOT NULL,
  `femoral_length` varchar(20) NOT NULL,
  `femoral_length_eq` varchar(20) NOT NULL,
  `crown_rump_length` varchar(20) NOT NULL,
  `crown_rump_length_eq` varchar(20) NOT NULL,
  `mean_gest_sac_diameter` varchar(20) NOT NULL,
  `mean_gest_sac_diameter_eq` varchar(20) NOT NULL,
  `average_fetal_weight` varchar(20) NOT NULL,
  `gestation` varchar(20) DEFAULT NULL,
  `presentation_lie` varchar(20) DEFAULT NULL,
  `amniotic_fluid` varchar(20) DEFAULT NULL,
  `placenta_location` varchar(20) DEFAULT NULL,
  `previa` varchar(20) DEFAULT NULL,
  `placenta_grade` varchar(20) DEFAULT NULL,
  `fetal_activity` varchar(20) DEFAULT NULL,
  `comments` varchar(100) NOT NULL,
  `radiologist` varchar(30) NOT NULL,
  `patient_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_referrals_log`
--

CREATE TABLE `tbl_referrals_log` (
  `referral_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `referral_date` date NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_referrals_log`
--

INSERT INTO `tbl_referrals_log` (`referral_id`, `patient_id`, `referral_date`, `userID`) VALUES
(21, 10, '2024-06-18', 8),
(22, 11, '2024-06-18', 2),
(23, 10, '2024-06-18', 7),
(24, 12, '2024-06-18', 2),
(25, 12, '2024-06-18', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userID` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `UserType` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `profile_picture` varchar(40) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `userpageID` int(11) DEFAULT NULL,
  `reg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userID`, `user_name`, `UserType`, `password`, `status`, `profile_picture`, `personnel_id`, `position_id`, `userpageID`, `reg`) VALUES
(1, 'admin', 'admin', '$2y$12$yUUEszLP9VBVjbSB/tKIlezn6PLsERVN4cBQsPJJJUOC2HsdTekOi', 'active', '1656551981avatar.png', 1, 1, 0, '2024-04-24 16:39:15'),
(2, 'bhw1123', 'BHW', '$2y$12$GJdo2UIQFPpTXFNkgAnwcu/cLbY/hIKbGSpz1627utlfQhUGRdMJ.', 'active', '1720399721.jpg', 2, 2, 1, '2024-04-24 17:04:41'),
(7, 'RHU', 'RHU', '$2y$10$yXSDUDgLAlPCbHsRb5UMq.YC3i9zK1EhZqMiDHe1CTUiFB5ZKESOS', 'active', '1720577233.jpeg', 7, 7, 0, '2024-05-02 10:55:03'),
(8, 'Elleen', 'BHW', '$2y$10$wjnQqSmfKZF1OQ9VzHIWvO0bl.DfKDBmwOAH2yaEp9n4rV5i4yCda', 'active', '1720576557.jpg', 8, 8, 2, '2024-05-02 13:15:38'),
(9, 'doctor', 'Doctor', '$argon2id$v=19$m=65536,t=4,p=1$ZjhPL2swYjFrclFxV2pocw$E/KejAhO9JwY4S6Bctnn+bd8IJLF/r31i6Ch/8a8IZg', 'Active', 'doctor.jpg', 9, 9, 0, '2024-05-07 15:01:44'),
(12, 'Physician', 'BHW', '$2y$10$3LR4wbi/npqY6txYib/AGO1CWRQZnOfTX2BQT8H72Zn8980vPNddu', 'active', '1720577216.jpg', 12, 12, 0, '2024-05-29 11:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_log`
--

CREATE TABLE `tbl_user_log` (
  `logID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_ip` binary(16) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_log`
--

INSERT INTO `tbl_user_log` (`logID`, `userID`, `username`, `user_ip`, `login_time`, `logout`, `status`) VALUES
(11, 1, 'admin', 0x3132372e302e302e3100000000000000, '2024-07-09 18:15:38', '2024-07-10 02:15:55', 1),
(12, 1, 'admin', 0x3132372e302e302e3100000000000000, '2024-07-09 18:16:25', NULL, 1),
(13, 1, 'admin', 0x3a3a3100000000000000000000000000, '2024-07-15 22:57:31', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_page`
--

CREATE TABLE `tbl_user_page` (
  `userpageID` int(11) NOT NULL,
  `home_img` varchar(100) NOT NULL,
  `sidebar` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_page`
--

INSERT INTO `tbl_user_page` (`userpageID`, `home_img`, `sidebar`, `userID`) VALUES
(1, 'photo1718591656 (2).jpeg', 'BRGY. PALABILLA', 2),
(2, 'photo1718591656 (3).jpeg', 'BRGY. AVACEÑA', 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tbl_animal_bite_care`
--
ALTER TABLE `tbl_animal_bite_care`
  ADD PRIMARY KEY (`animal_biteID`);

--
-- Indexes for table `tbl_animal_bite_vaccination`
--
ALTER TABLE `tbl_animal_bite_vaccination`
  ADD PRIMARY KEY (`animal_bite_vacID`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_announcements`
--
ALTER TABLE `tbl_announcements`
  ADD PRIMARY KEY (`announceID`);

--
-- Indexes for table `tbl_appointments`
--
ALTER TABLE `tbl_appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `tbl_birthing_details`
--
ALTER TABLE `tbl_birthing_details`
  ADD PRIMARY KEY (`birthID`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_birth_info`
--
ALTER TABLE `tbl_birth_info`
  ADD PRIMARY KEY (`birthInfoID`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `physical_exam_id` (`physical_exam_id`);

--
-- Indexes for table `tbl_certificate_log`
--
ALTER TABLE `tbl_certificate_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_checkup`
--
ALTER TABLE `tbl_checkup`
  ADD PRIMARY KEY (`checkupID`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  ADD PRIMARY KEY (`complaintID`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_doctor_schedule`
--
ALTER TABLE `tbl_doctor_schedule`
  ADD PRIMARY KEY (`doc_scheduleID`),
  ADD KEY `doctor_id` (`userID`);

--
-- Indexes for table `tbl_family`
--
ALTER TABLE `tbl_family`
  ADD PRIMARY KEY (`famID`);

--
-- Indexes for table `tbl_immunization_records`
--
ALTER TABLE `tbl_immunization_records`
  ADD PRIMARY KEY (`immunID`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_immunization_types`
--
ALTER TABLE `tbl_immunization_types`
  ADD PRIMARY KEY (`immun_typeID`);

--
-- Indexes for table `tbl_medicines`
--
ALTER TABLE `tbl_medicines`
  ADD PRIMARY KEY (`medicineID`);

--
-- Indexes for table `tbl_medicine_details`
--
ALTER TABLE `tbl_medicine_details`
  ADD PRIMARY KEY (`med_detailsID`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `tbl_membership_info`
--
ALTER TABLE `tbl_membership_info`
  ADD PRIMARY KEY (`membershipID`);

--
-- Indexes for table `tbl_patients`
--
ALTER TABLE `tbl_patients`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `Membership_Info` (`Membership_Info`),
  ADD KEY `family_no` (`family_address`);

--
-- Indexes for table `tbl_patient_medication_history`
--
ALTER TABLE `tbl_patient_medication_history`
  ADD PRIMARY KEY (`patient_med_historyID`),
  ADD KEY `patient_visit_id` (`patient_visit_id`),
  ADD KEY `medicine_details_id` (`medicine_details_id`);

--
-- Indexes for table `tbl_patient_visits`
--
ALTER TABLE `tbl_patient_visits`
  ADD PRIMARY KEY (`patient_visitID`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `tbl_personnel`
--
ALTER TABLE `tbl_personnel`
  ADD PRIMARY KEY (`personnel_id`);

--
-- Indexes for table `tbl_physical_exam`
--
ALTER TABLE `tbl_physical_exam`
  ADD PRIMARY KEY (`physical_exam_id`);

--
-- Indexes for table `tbl_position`
--
ALTER TABLE `tbl_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `tbl_prenatal`
--
ALTER TABLE `tbl_prenatal`
  ADD PRIMARY KEY (`prenatalID`);

--
-- Indexes for table `tbl_referrals_log`
--
ALTER TABLE `tbl_referrals_log`
  ADD PRIMARY KEY (`referral_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `personnel_id` (`personnel_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `tbl_user_log`
--
ALTER TABLE `tbl_user_log`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `tbl_user_log_ibfk_1` (`userID`);

--
-- Indexes for table `tbl_user_page`
--
ALTER TABLE `tbl_user_page`
  ADD PRIMARY KEY (`userpageID`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_animal_bite_care`
--
ALTER TABLE `tbl_animal_bite_care`
  MODIFY `animal_biteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_animal_bite_vaccination`
--
ALTER TABLE `tbl_animal_bite_vaccination`
  MODIFY `animal_bite_vacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_announcements`
--
ALTER TABLE `tbl_announcements`
  MODIFY `announceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_appointments`
--
ALTER TABLE `tbl_appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_birthing_details`
--
ALTER TABLE `tbl_birthing_details`
  MODIFY `birthID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_birth_info`
--
ALTER TABLE `tbl_birth_info`
  MODIFY `birthInfoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_certificate_log`
--
ALTER TABLE `tbl_certificate_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_checkup`
--
ALTER TABLE `tbl_checkup`
  MODIFY `checkupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_family`
--
ALTER TABLE `tbl_family`
  MODIFY `famID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_immunization_records`
--
ALTER TABLE `tbl_immunization_records`
  MODIFY `immunID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_immunization_types`
--
ALTER TABLE `tbl_immunization_types`
  MODIFY `immun_typeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_medicines`
--
ALTER TABLE `tbl_medicines`
  MODIFY `medicineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_medicine_details`
--
ALTER TABLE `tbl_medicine_details`
  MODIFY `med_detailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_membership_info`
--
ALTER TABLE `tbl_membership_info`
  MODIFY `membershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_patients`
--
ALTER TABLE `tbl_patients`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_patient_medication_history`
--
ALTER TABLE `tbl_patient_medication_history`
  MODIFY `patient_med_historyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_patient_visits`
--
ALTER TABLE `tbl_patient_visits`
  MODIFY `patient_visitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_personnel`
--
ALTER TABLE `tbl_personnel`
  MODIFY `personnel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_physical_exam`
--
ALTER TABLE `tbl_physical_exam`
  MODIFY `physical_exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_position`
--
ALTER TABLE `tbl_position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_prenatal`
--
ALTER TABLE `tbl_prenatal`
  MODIFY `prenatalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_referrals_log`
--
ALTER TABLE `tbl_referrals_log`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_user_log`
--
ALTER TABLE `tbl_user_log`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_user_page`
--
ALTER TABLE `tbl_user_page`
  MODIFY `userpageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_patients`
--
ALTER TABLE `tbl_patients`
  ADD CONSTRAINT `tbl_patients_ibfk_1` FOREIGN KEY (`family_address`) REFERENCES `tbl_family` (`famID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_patients_ibfk_2` FOREIGN KEY (`Membership_Info`) REFERENCES `tbl_membership_info` (`membershipID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `tbl_personnel` (`personnel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_users_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `tbl_position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
