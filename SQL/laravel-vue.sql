-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2022 at 11:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hatedpokemons`
--

CREATE TABLE `hatedpokemons` (
  `id` int(255) NOT NULL,
  `pokemon_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hatedpokemons`
--

INSERT INTO `hatedpokemons` (`id`, `pokemon_id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 10, 'caterpie', 1, '2022-04-03 18:46:26.000000', '2022-04-03 18:46:26.000000'),
(12, 15, 'beedrill', 1, '2022-04-04 08:18:04.000000', '2022-04-04 08:18:04.000000'),
(14, 2, 'ivysaur', 1, '2022-04-04 08:21:41.000000', '2022-04-04 08:21:41.000000'),
(15, 10, 'caterpie', 2, '2022-04-04 09:29:21.000000', '2022-04-04 09:29:21.000000');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(4, 'Eat the coffee', 1, '2022-04-02 20:39:17', '2022-03-04 23:55:37', '2022-04-02 20:39:17'),
(5, 'Tugpa na', 1, '2022-04-02 20:39:16', '2022-03-04 23:57:10', '2022-04-02 20:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `likedpokemons`
--

CREATE TABLE `likedpokemons` (
  `id` int(255) NOT NULL,
  `pokemon_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likedpokemons`
--

INSERT INTO `likedpokemons` (`id`, `pokemon_id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'bulbasaur', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 4, 'charmander', 1, '2022-04-03 05:37:21.000000', '2022-04-03 05:37:21.000000'),
(8, 16, 'pidgey', 1, '2022-04-03 06:02:41.000000', '2022-04-03 06:02:41.000000'),
(10, 7, 'squirtle', 1, '2022-04-03 18:36:59.000000', '2022-04-03 18:36:59.000000'),
(14, 13, 'weedle', 1, '2022-04-03 18:44:03.000000', '2022-04-03 18:44:03.000000'),
(15, 9, 'blastoise', 1, '2022-04-03 18:49:15.000000', '2022-04-03 18:49:15.000000'),
(16, 14, 'kakuna', 1, '2022-04-03 18:51:15.000000', '2022-04-03 18:51:15.000000'),
(17, 11, 'metapod', 1, '2022-04-03 18:52:11.000000', '2022-04-03 18:52:11.000000'),
(22, 18, 'pidgeot', 1, '2022-04-03 19:12:16.000000', '2022-04-03 19:12:16.000000'),
(23, 3, 'venusaur', 1, '2022-04-04 07:12:09.000000', '2022-04-04 07:12:09.000000'),
(25, 12, 'butterfree', 2, '2022-04-04 09:08:28.000000', '2022-04-04 09:08:28.000000'),
(26, 1, 'bulbasaur', 6, '2022-04-04 21:07:50.000000', '2022-04-04 21:07:50.000000'),
(27, 7, 'squirtle', 6, '2022-04-04 21:08:03.000000', '2022-04-04 21:08:03.000000'),
(28, 4, 'charmander', 6, '2022-04-04 21:08:11.000000', '2022-04-04 21:08:11.000000'),
(29, 25, 'pikachu', 6, '2022-04-04 21:08:16.000000', '2022-04-04 21:08:16.000000'),
(30, 3, 'venusaur', 6, '2022-04-04 23:24:02.000000', '2022-04-04 23:24:02.000000');

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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_05_033710_create_items_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `bdate` date NOT NULL,
  `sex` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `user_id`, `fname`, `lname`, `bdate`, `sex`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ryan Arcel S.', 'Galendez', '1992-09-11', 'Male', 'Single', '2022-04-03 01:29:07.000000', '2022-04-03 19:55:35.000000'),
(2, 2, 'Ivy Rose', 'Luntad', '1993-12-09', 'Female', 'Single', '2022-04-02 17:44:58.000000', '2022-04-04 20:51:21.000000'),
(10, 6, 'Kobe', 'Bryant', '2022-04-14', 'Male', 'Single', '2022-04-04 21:30:44.000000', '2022-04-04 21:30:44.000000'),
(11, 8, 'Ash', 'Tray', '2022-04-28', 'Male', 'Single', '2022-04-05 00:47:59.000000', '2022-04-05 00:47:59.000000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ryanarcel', 'ryanargee2@gmail.com', '2022-04-01 01:30:01', '$2y$10$eIi5bpB.aYgPeBURfXkSTe9LRZwSbbdTnG4tcda1HONGocAnm2k62', 'abcde12345', '2022-04-03 01:39:12', NULL),
(2, 'ivyrose', 'ivy@rose.com', '2022-04-01 01:30:01', '$2y$10$42KIPiKeeQHJ3JY.b1Fhd.KO0Pn4nGbBq9ht8Tw7JtIVcGtXncpui', 'abcde12345', '2022-04-03 01:39:12', NULL),
(3, 'Sing', 'sing@cat.com', NULL, '$2y$10$ulstYiBSlCb5oofzfXCbeuDihyJPozpuDK6NASmKKmihklUVAbY6m', NULL, '2022-04-03 22:00:33', '2022-04-03 22:00:33'),
(4, 'Tong2', 'tong@cat.com', NULL, '$2y$10$L0BXgmwntZ3duLOVN4CZ0eItDnUA4BvIsIFqNT0uUYPVaNHJEfbj.', NULL, '2022-04-03 22:02:59', '2022-04-03 22:02:59'),
(5, 'joserizal', 'jose@rizal.com', NULL, '$2y$10$xtaiXx5pj2S9zrP9WXLEYeLWbTfMSHpyn9/k/vnmz/5R6kfmg/rVq', NULL, '2022-04-04 00:17:54', '2022-04-04 00:17:54'),
(6, 'kobe', 'kobe@bryant.com', NULL, '$2y$10$BBgG.VEdccYY.wOD4M6gS.kFDLKuerxsiY5YgDbsy08prHiWlKIby', NULL, '2022-04-04 00:21:36', '2022-04-04 00:21:36'),
(7, 'chong', 'chong@test.com', NULL, '$2y$10$fAFazEudaw7pvvTJhT4P0uHUygWdUQdBB1S5UXoCeKN0J.4T/8kGm', NULL, '2022-04-04 08:17:10', '2022-04-04 08:17:10'),
(8, 'ash', 'ash@pokemon.com', NULL, '$2y$10$niGk7VeW6pObk4Izu5u9AOuAIA5DLnm2W7ALgbGZkgE0eRN/GasGK', NULL, '2022-04-05 00:26:36', '2022-04-05 00:26:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hatedpokemons`
--
ALTER TABLE `hatedpokemons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likedpokemons`
--
ALTER TABLE `likedpokemons`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `hatedpokemons`
--
ALTER TABLE `hatedpokemons`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likedpokemons`
--
ALTER TABLE `likedpokemons`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
