-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: pelda_host:3306
-- Generation Time: Sep 27, 2021 at 04:02 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `userID` int NOT NULL,
  `stadt` varchar(50) NOT NULL,
  `strasse` varchar(50) NOT NULL,
  `plz` varchar(9) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `handy` varchar(20) NOT NULL,
  `hausnummer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auftrags`
--

CREATE TABLE `auftrags` (
  `id` int NOT NULL,
  `kundenID` int NOT NULL,
  `technikerID` int NOT NULL,
  `reparaturID` int NOT NULL,
  `herstellerID` int NOT NULL,
  `gerätType` varchar(50) NOT NULL,
  `reparaturArt` varchar(255) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `addresseID` int NOT NULL,
  `zeitraum` varchar(50) NOT NULL,
  `entsperr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hersteller`
--

CREATE TABLE `hersteller` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `isActive` tinyint NOT NULL,
  `logo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `hersteller`
--

INSERT INTO `hersteller` (`id`, `name`, `description`, `isActive`, `logo`) VALUES
(1, 'Apple', '', 1, '<img   src=\"/public/assets/apple.png\" alt=\"apple\" />'),
(2, 'Samsung', '', 1, '<img src=\"/public/assets/samsung.png\" alt=\"samsung\" />\r\n'),
(3, 'Huawei', '', 1, '<img src=\"/public/assets/huawei.png\" alt=\"bild huawei\" />'),
(4, 'Nokia', '', 1, '<img src=\"/public/assets/nokia.png\" alt=\"\" />'),
(5, 'LG', '', 1, '<img src=\"/public/assets/lg.png\" alt=\"\" />'),
(6, 'Google', '', 1, '<img src=\"/public/assets/google.png\" alt=\"\" />'),
(8, 'Sony', '', 1, '<img src=\"/public/assets/soy.png\" alt=\"\" />');

-- --------------------------------------------------------

--
-- Table structure for table `preise`
--

CREATE TABLE `preise` (
  `preiseID` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `preis` decimal(5,2) NOT NULL,
  `reparaturArt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `isActive` int NOT NULL,
  `herstellerID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `preise`
--

INSERT INTO `preise` (`preiseID`, `type`, `preis`, `reparaturArt`, `isActive`, `herstellerID`) VALUES
(10330, 'iPhone 12 Pro Max', '149.00', 'Backcover', 1, 1),
(10331, 'iPhone 12 Pro Max', '29.00', 'Fehleranalyse ', 1, 1),
(10332, 'iPhone 12 pro', '349.00', 'Display', 1, 1),
(10333, 'iPhone 12 pro', '99.00', 'Akku', 1, 1),
(10334, 'iPhone 12 pro', '139.00', 'Backcover', 1, 1),
(10335, 'iPhone 12 pro', '29.00', 'Fehleranalyse', 1, 1),
(10336, 'iPhone 12', '299.00', 'Display', 1, 1),
(10337, 'iPhone 12', '99.00', 'Akku', 1, 1),
(10338, 'iPhone 12', '149.00', 'Backcover', 1, 1),
(10339, 'iPhone 12', '29.00', 'Fehleranalyse', 1, 1),
(10340, 'iPhone 12 Mini', '269.00', 'Display ', 1, 1),
(10341, 'iPhone 12 Mini', '99.00', 'Akku', 1, 1),
(10342, 'iPhone 12 Mini', '149.00', 'Backcover ', 1, 1),
(10343, 'iPhone 12 Mini', '29.00', 'Fehleranalyse ', 1, 1),
(10347, 'iPhone SE 2020', '119.00', 'Display ', 1, 1),
(10348, 'iPhone SE 2020', '49.00', 'Akku ', 1, 1),
(10349, 'iPhone SE 2020', '99.00', 'Backcover ', 1, 1),
(10350, 'iPhone SE 2020', '29.00', 'Fehleranalyse', 1, 1),
(10351, 'iPhone SE 2020', '79.00', 'Mikrofon ', 1, 1),
(10352, 'iPhone SE 2020', '79.00', 'Ladeanschluss', 1, 1),
(10353, 'iPhone SE 2020', '69.00', 'Frontkamera ', 1, 1),
(10354, 'iPhone SE 2020', '89.00', 'Lautsprecher ', 1, 1),
(10355, 'iPhone SE 2020', '59.00', 'Homebutton ', 1, 1),
(10370, 'iPhone 11 Pro Max', '269.00', 'Display', 1, 1),
(10371, 'iPhone 11 Pro Max', '119.00', 'Akku', 1, 1),
(10372, 'iPhone 11 Pro Max', '129.00', 'Backcover', 1, 1),
(10373, 'iPhone 11 Pro Max', '29.00', 'Fehleranalyse', 1, 1),
(10374, 'iPhone 11 Pro Max', '129.00', 'Mikrofon', 1, 1),
(10375, 'iPhone 11 Pro Max', '129.00', 'Ladeanschluss', 1, 1),
(10376, 'iPhone 11 Pro Max', '129.00', 'Frontkamera', 1, 1),
(10377, 'iPhone 11 Pro Max', '129.00', 'Lautsprecher', 1, 1),
(10378, 'iPhone 11 Pro', '229.00', 'Display', 1, 1),
(10379, 'iPhone 11 Pro', '99.00', 'Akku', 1, 1),
(10380, 'iPhone 11 Pro', '99.00', 'Backcover', 1, 1),
(10381, 'iPhone 11 Pro', '29.00', 'Fehleranalyse', 1, 1),
(10382, 'iPhone 11 Pro', '119.00', 'Mikrofon', 1, 1),
(10383, 'iPhone 11 Pro', '119.00', 'Ladeanschluss', 1, 1),
(10384, 'iPhone 11 Pro', '119.00', 'Frontkamera', 1, 1),
(10385, 'iPhone 11 Pro', '119.00', 'Lautsprecher', 1, 1),
(10386, 'iPhone 11', '129.00', 'Display', 1, 1),
(10387, 'iPhone 11', '79.00', 'Akku', 1, 1),
(10388, 'iPhone 11', '99.00', 'Backcover', 1, 1),
(10389, 'iPhone 11', '29.00', 'Fehleranalyse', 1, 1),
(10390, 'iPhone 11', '79.00', 'Mikrofon', 1, 1),
(10391, 'iPhone 11', '79.00', 'Ladeanschluss', 1, 1),
(10392, 'iPhone 11', '79.00', 'Frontkamera', 1, 1),
(10393, 'iPhone 11', '79.00', 'Lautsprecher', 1, 1),
(10394, 'iPhone XR', '109.00', 'Display', 1, 1),
(10395, 'iPhone XR', '49.00', 'Akku', 1, 1),
(10396, 'iPhone XR', '99.00', 'Backcover', 1, 1),
(10397, 'iPhone XR', '29.00', 'Fehleranalyse', 1, 1),
(10398, 'iPhone XR', '79.00', 'Mikrofon', 1, 1),
(10399, 'iPhone XR', '79.00', 'Ladeanschluss', 1, 1),
(10400, 'iPhone XR', '69.00', 'Frontkamera', 1, 1),
(10401, 'iPhone XR', '79.00', 'Lautsprecher', 1, 1),
(10402, 'iPhone XR', '79.00', 'Kamera', 1, 1),
(10403, 'iPhone XS', '109.00', 'Display', 1, 1),
(10404, 'iPhone XS', '49.00', 'Akku', 1, 1),
(10405, 'iPhone XS', '99.00', 'Backcover', 1, 1),
(10406, 'iPhone XS', '29.00', 'Fehleranalyse', 1, 1),
(10407, 'iPhone XS', '79.00', 'Mikrofon', 1, 1),
(10408, 'iPhone XS', '79.00', 'Ladeanschluss', 1, 1),
(10409, 'iPhone XS', '69.00', 'Frontkamera', 1, 1),
(10410, 'iPhone XS', '89.00', 'Lautsprecher', 1, 1),
(10411, 'iPhone XS', '79.00', 'Kamera', 1, 1),
(10412, 'iPhone XS Max', '199.00', 'Display', 1, 1),
(10413, 'iPhone XS Max', '79.00', 'Akku', 1, 1),
(10414, 'iPhone XS Max', '99.00', 'Backcover', 1, 1),
(10415, 'iPhone XS Max', '29.00', 'Fehleranalyse', 1, 1),
(10416, 'iPhone XS Max', '89.00', 'Mikrofon', 1, 1),
(10417, 'iPhone XS Max', '89.00', 'Ladeanschluss', 1, 1),
(10418, 'iPhone XS Max', '79.00', 'Frontkamera', 1, 1),
(10419, 'iPhone XS Max', '89.00', 'Lautsprecher', 1, 1),
(10420, 'iPhone XS Max', '89.00', 'Kamera', 1, 1),
(10421, 'iPhone X', '109.00', 'Display', 1, 1),
(10422, 'iPhone X', '49.00', 'Akku', 1, 1),
(10423, 'iPhone X', '99.00', 'Backcover', 1, 1),
(10424, 'iPhone X', '29.00', 'Fehleranalyse', 1, 1),
(10425, 'iPhone X', '79.00', 'Mikrofon', 1, 1),
(10426, 'iPhone X', '79.00', 'Ladeanschluss', 1, 1),
(10427, 'iPhone X', '69.00', 'Frontkamera', 1, 1),
(10428, 'iPhone X', '89.00', 'Lautsprecher', 1, 1),
(10429, 'iPhone X', '79.00', 'Kamera', 1, 1),
(10430, 'iPhone 8 Plus', '99.00', 'Display', 1, 1),
(10431, 'iPhone 8 Plus', '49.00', 'Akku', 1, 1),
(10432, 'iPhone 8 Plus', '99.00', 'Backcover', 1, 1),
(10433, 'iPhone 8 Plus', '29.00', 'Fehleranalyse', 1, 1),
(10434, 'iPhone 8 Plus', '79.00', 'Mikrofon', 1, 1),
(10435, 'iPhone 8 Plus', '79.00', 'Ladeanschluss', 1, 1),
(10436, 'iPhone 8 Plus', '69.00', 'Frontkamera', 1, 1),
(10437, 'iPhone 8 Plus', '89.00', 'Lautsprecher', 1, 1),
(10438, 'iPhone 8 Plus', '59.00', 'Homebutten', 1, 1),
(10439, 'iPhone 8 Plus', '79.00', 'Kamera', 1, 1),
(10440, 'iPhone 8', '89.00', 'Display', 1, 1),
(10441, 'iPhone 8', '49.00', 'Akku', 1, 1),
(10442, 'iPhone 8', '79.00', 'Backcover', 1, 1),
(10443, 'iPhone 8', '29.00', 'Fehleranalyse', 1, 1),
(10444, 'iPhone 8', '69.00', 'Mikrofon', 1, 1),
(10445, 'iPhone 8', '69.00', 'Ladeanschluss', 1, 1),
(10446, 'iPhone 8', '69.00', 'Frontkamera', 1, 1),
(10447, 'iPhone 8', '69.00', 'Lautsprecher', 1, 1),
(10448, 'iPhone 8', '59.00', 'Homebutten', 1, 1),
(10449, 'iPhone 8', '69.00', 'Kamera', 1, 1),
(10450, 'iPhone 7 Plus', '89.00', 'Display', 1, 1),
(10451, 'iPhone 7 Plus', '49.00', 'Akku', 1, 1),
(10452, 'iPhone 7 Plus', '69.00', 'Kamera', 1, 1),
(10453, 'iPhone 7 Plus', '29.00', 'Fehleranalyse', 1, 1),
(10454, 'iPhone 7 Plus', '69.00', 'Mikrofon', 1, 1),
(10455, 'iPhone 7 Plus', '69.00', 'Ladeanschluss', 1, 1),
(10456, 'iPhone 7 Plus', '69.00', 'Frontkamera', 1, 1),
(10457, 'iPhone 7 Plus', '49.00', 'Lautsprecher', 1, 1),
(10458, 'iPhone 7 Plus', '59.00', 'Homebutten', 1, 1),
(10459, 'iPhone 7', '79.00', 'Display', 1, 1),
(10460, 'iPhone 7', '49.00', 'Akku', 1, 1),
(10461, 'iPhone 7', '49.00', 'Kamera', 1, 1),
(10462, 'iPhone 7', '29.00', 'Fehleranalyse', 1, 1),
(10463, 'iPhone 7', '49.00', 'Mikrofon', 1, 1),
(10464, 'iPhone 7', '49.00', 'Ladeanschluss', 1, 1),
(10465, 'iPhone 7', '49.00', 'Frontkamera', 1, 1),
(10466, 'iPhone 7', '49.00', 'Lautsprecher', 1, 1),
(10467, 'iPhone 7', '49.00', 'Homebutten', 1, 1),
(10468, 'iPhone 6s Plus', '79.00', 'Display', 1, 1),
(10469, 'iPhone 6s Plus', '49.00', 'Akku', 1, 1),
(10470, 'iPhone 6s Plus', '49.00', 'Kamera', 1, 1),
(10471, 'iPhone 6s Plus', '29.00', 'Fehleranalyse', 1, 1),
(10472, 'iPhone 6s Plus', '49.00', 'Mikrofon', 1, 1),
(10473, 'iPhone 6s Plus', '49.00', 'Ladeanschluss', 1, 1),
(10474, 'iPhone 6s Plus', '49.00', 'Frontkamera', 1, 1),
(10475, 'iPhone 6s Plus', '49.00', 'Lautsprecher', 1, 1),
(10476, 'iPhone 6s Plus', '49.00', 'Homebutten', 1, 1),
(10477, 'iPhone 6s', '69.00', 'Display', 1, 1),
(10478, 'iPhone 6s', '49.00', 'Akku', 1, 1),
(10479, 'iPhone 6s', '49.00', 'Kamera', 1, 1),
(10480, 'iPhone 6s', '29.00', 'Fehleranalyse', 1, 1),
(10481, 'iPhone 6s', '49.00', 'Mikrofon', 1, 1),
(10482, 'iPhone 6s', '49.00', 'Ladeanschluss', 1, 1),
(10483, 'iPhone 6s', '49.00', 'Frontkamera', 1, 1),
(10484, 'iPhone 6s', '49.00', 'Lautsprecher', 1, 1),
(10485, 'iPhone 6s', '49.00', 'Homebutten', 1, 1),
(10486, 'iPhone 6', '79.00', 'Display', 1, 1),
(10487, 'iPhone 6', '49.00', 'Akku', 1, 1),
(10488, 'iPhone 6', '49.00', 'Kamera', 1, 1),
(10489, 'iPhone 6', '29.00', 'Fehleranalyse', 1, 1),
(10490, 'iPhone 6', '49.00', 'Mikrofon', 1, 1),
(10491, 'iPhone 6', '49.00', 'Ladeanschluss', 1, 1),
(10492, 'iPhone 6', '49.00', 'Frontkamera', 1, 1),
(10493, 'iPhone 6', '49.00', 'Lautsprecher', 1, 1),
(10494, 'iPhone 6', '49.00', 'Homebutten', 1, 1),
(10495, 'iPhone SE', '79.00', 'Display', 1, 1),
(10496, 'iPhone SE', '49.00', 'Akku', 1, 1),
(10497, 'iPhone SE', '49.00', 'Kamera', 1, 1),
(10498, 'iPhone SE', '29.00', 'Fehleranalyse', 1, 1),
(10499, 'iPhone SE', '49.00', 'Mikrofon', 1, 1),
(10500, 'iPhone SE', '49.00', 'Ladeanschluss', 1, 1),
(10501, 'iPhone SE', '49.00', 'Frontkamera', 1, 1),
(10502, 'iPhone SE', '49.00', 'Lautsprecher', 1, 1),
(10503, 'iPhone SE', '49.00', 'Homebutton', 1, 1),
(10505, 'Sony Xperia 1', '299.00', 'Display Reparatur inkl.Rahmen', 1, 8),
(10506, 'Sony Xperia 1', '299.00', 'Display Reparatur inkl.Rahmen', 1, 8),
(10507, 'Sony Xperia 1', '299.00', 'Display Reparatur inkl.Rahmen', 1, 8),
(10508, 'Sony Xperia 1', '299.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10509, 'Sony Xperia 1', '69.00', 'USBPort  Reparatur', 1, 8),
(10510, 'Sony Xperia 1', '299.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10511, 'Sony Xperia 1', '69.00', 'USBPort  Reparatur', 1, 8),
(10512, 'Sony Xperia 1', '69.00', 'Austausch des Akkus', 1, 8),
(10513, 'Sony Xperia 1', '69.00', 'PowerTaste / VolumeTasten', 1, 8),
(10514, 'Sony Xperia 1', '59.00', 'Hörer / Lautsprecher', 1, 8),
(10515, 'Sony Xperia 1', '69.00', 'Mikrofon  Reparatur', 1, 8),
(10516, 'Sony Xperia 1', '59.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10518, 'Sony Xperia XZ2', '119.00', 'Display  Reparatur', 1, 8),
(10519, 'Sony Xperia XZ2', '79.00', 'USBPort  Reparatur', 1, 8),
(10520, 'Sony Xperia XZ2', '79.00', 'Austausch des Akkus', 1, 8),
(10521, 'Sony Xperia XZ2', '79.00', 'PowerTaste / VolumeTasten', 1, 8),
(10522, 'Sony Xperia XZ2', '79.00', 'Hörer / Lautsprecher', 1, 8),
(10523, 'Sony Xperia XZ2', '79.00', 'Mikrofon  Reparatur', 1, 8),
(10525, 'Sony Xperia XZ2 Compact', '119.00', 'Display  Reparatur', 1, 8),
(10526, 'Sony Xperia XZ2 Compact', '79.00', 'USBPort  Reparatur', 1, 8),
(10527, 'Sony Xperia XZ2 Compact', '79.00', 'Austausch des Akkus', 1, 8),
(10528, 'Sony Xperia XZ2 Compact', '79.00', 'PowerTaste / VolumeTasten', 1, 8),
(10529, 'Sony Xperia XZ2 Compact', '79.00', 'Hörer / Lautsprecher', 1, 8),
(10530, 'Sony Xperia XZ2 Compact', '79.00', 'Mikrofon  Reparatur', 1, 8),
(10532, 'Sony Xperia XZ', '109.00', 'Display  Reparatur', 1, 8),
(10533, 'Sony Xperia XZ1', '109.00', 'Display  Reparatur', 1, 8),
(10534, 'Sony Xperia XZ1 Compact', '99.00', 'Display  Reparatur', 1, 8),
(10535, 'Sony Xperia X', '149.00', 'Display  Reparatur', 1, 8),
(10536, 'Sony Xperia X', '39.00', 'USBPort Reparatur', 1, 8),
(10537, 'Sony Xperia X', '49.00', 'Austausch des Akkus', 1, 8),
(10538, 'Sony Xperia X', '39.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10540, 'Sony Xperia XZ3', '239.00', 'Display  Reparatur', 1, 8),
(10541, 'Sony Xperia XZ3', '69.00', 'USBPort  Reparatur', 1, 8),
(10542, 'Sony Xperia XZ3', '69.00', 'Austausch des Akkus', 1, 8),
(10543, 'Sony Xperia XZ3', '69.00', 'PowerTaste / VolumeTasten', 1, 8),
(10544, 'Sony Xperia XZ3', '69.00', 'Hörer / Lautsprecher', 1, 8),
(10545, 'Sony Xperia XZ3', '69.00', 'Mikrofon  Reparatur', 1, 8),
(10546, 'Sony Xperia XZ3', '69.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10548, 'Sony Xperia XA', '119.00', 'Display  Reparatur', 1, 8),
(10549, 'Sony Xperia XA', '39.00', 'USBPort  Reparatur', 1, 8),
(10550, 'Sony Xperia XA', '49.00', 'Austausch des Akkus', 1, 8),
(10551, 'Sony Xperia XA', '29.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10553, 'Sony Xperia XA1', '99.00', 'Display  Reparatur', 1, 8),
(10554, 'Sony Xperia XA1', '39.00', 'USBPort  Reparatur', 1, 8),
(10555, 'Sony Xperia XA1', '49.00', 'Austausch des Akkus', 1, 8),
(10556, 'Sony Xperia XA1', '49.00', 'PowerTaste / VolumeTasten', 1, 8),
(10557, 'Sony Xperia XA1', '39.00', 'Hörer / Lautsprecher', 1, 8),
(10558, 'Sony Xperia XA1', '39.00', 'Mikrofon  Reparatur', 1, 8),
(10560, 'Sony Xperia XA2', '119.00', 'Display  Reparatur', 1, 8),
(10561, 'Sony Xperia XA2', '39.00', 'USBPort  Reparatur', 1, 8),
(10562, 'Sony Xperia XA2', '49.00', 'Austausch des Akkus', 1, 8),
(10563, 'Sony Xperia XA2', '49.00', 'PowerTaste / VolumeTasten', 1, 8),
(10564, 'Sony Xperia XA2', '49.00', 'Hörer / Lautsprecher', 1, 8),
(10565, 'Sony Xperia XA2', '49.00', 'Mikrofon  Reparatur', 1, 8),
(10567, 'Sony Xperia Z5', '99.00', 'Display  Reparatur', 1, 8),
(10568, 'Sony Xperia Z5', '179.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10569, 'Sony Xperia Z5', '39.00', 'USBPort  Reparatur', 1, 8),
(10570, 'Sony Xperia Z5', '49.00', 'Austausch des Akkus', 1, 8),
(10571, 'Sony Xperia Z5', '59.00', 'PowerTaste / VolumeTasten', 1, 8),
(10572, 'Sony Xperia Z5', '49.00', 'Hörer / Lautsprecher', 1, 8),
(10573, 'Sony Xperia Z5', '49.00', 'Mikrofon  Reparatur', 1, 8),
(10574, 'Sony Xperia Z5', '39.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10576, 'Sony Xperia Z5 Compact', '129.00', 'Display  Reparatur', 1, 8),
(10577, 'Sony Xperia Z5 Compact', '49.00', 'USBPort  Reparatur', 1, 8),
(10578, 'Sony Xperia Z5 Compact', '59.00', 'Austausch des Akkus', 1, 8),
(10579, 'Sony Xperia Z5 Compact', '59.00', 'PowerTaste / VolumeTasten', 1, 8),
(10580, 'Sony Xperia Z5 Compact', '49.00', 'Hörer / Lautsprecher', 1, 8),
(10581, 'Sony Xperia Z5 Compact', '49.00', 'Mikrofon  Reparatur', 1, 8),
(10582, 'Sony Xperia Z5 Compact', '49.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10584, 'Sony Xperia Z3', '99.00', 'Display  Reparatur', 1, 8),
(10585, 'Sony Xperia Z3', '149.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10586, 'Sony Xperia Z3', '69.00', 'USBPort  Reparatur', 1, 8),
(10587, 'Sony Xperia Z3', '39.00', 'Austausch des Akkus', 1, 8),
(10588, 'Sony Xperia Z3', '49.00', 'PowerTaste / VolumeTasten', 1, 8),
(10589, 'Sony Xperia Z3', '49.00', 'Hörer / Lautsprecher', 1, 8),
(10590, 'Sony Xperia Z3', '49.00', 'Mikrofon  Reparatur', 1, 8),
(10591, 'Sony Xperia Z3', '49.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10593, 'Sony Xperia 5', '219.00', 'Display  Reparatur', 1, 8),
(10594, 'Sony Xperia 5', '69.00', 'USBPort  Reparatur', 1, 8),
(10595, 'Sony Xperia 5', '69.00', 'Austausch des Akkus', 1, 8),
(10596, 'Sony Xperia 5', '69.00', 'PowerTaste / VolumeTasten', 1, 8),
(10597, 'Sony Xperia 5', '59.00', 'Hörer / Lautsprecher', 1, 8),
(10598, 'Sony Xperia 5', '69.00', 'Mikrofon  Reparatur', 1, 8),
(10599, 'Sony Xperia 5', '59.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10601, 'Sony Xperia X Compact', '119.00', 'Display  Reparatur', 1, 8),
(10602, 'Sony Xperia X Compact', '39.00', 'USBPort Reparatur', 1, 8),
(10603, 'Sony Xperia X Compact', '49.00', 'Austausch des Akkus', 1, 8),
(10604, 'Sony Xperia X Compact', '39.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10606, 'Sony Xperia Z3 Compact', '129.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10607, 'Sony Xperia Z3 Compact', '59.00', 'USBPort  Reparatur', 1, 8),
(10608, 'Sony Xperia Z3 Compact', '49.00', 'Austausch des Akkus', 1, 8),
(10609, 'Sony Xperia Z3 Compact', '49.00', 'PowerTaste / VolumeTasten', 1, 8),
(10610, 'Sony Xperia Z3 Compact', '49.00', 'Hörer / Lautsprecher', 1, 8),
(10611, 'Sony Xperia Z3 Compact', '49.00', 'Mikrofon  Reparatur', 1, 8),
(10612, 'Sony Xperia Z3 Compact', '39.00', 'Austausch der Rückseite / Backcover', 1, 8),
(10614, 'Sony Xperia 10', '119.00', 'Display  Reparatur', 1, 8),
(10615, 'Sony Xperia 10 Plus', '119.00', 'Display  Reparatur', 1, 8),
(10616, 'Sony Xperia L3', '89.00', 'Display  Reparatur inkl. Rahmen', 1, 8),
(10617, 'Sony Xperia L3', '39.00', 'USBPort  Reparatur', 1, 8),
(10618, 'Sony Xperia L3', '49.00', 'Austausch des Akkus', 1, 8),
(10619, 'Sony Xperia L3', '39.00', 'PowerTaste / VolumeTasten', 1, 8),
(10620, 'Sony Xperia L3', '39.00', 'Hörer / Lautsprecher', 1, 8),
(10621, 'Sony Xperia L3', '39.00', 'Mikrofon  Reparatur', 1, 8),
(10622, 'Sony Xperia L3', '29.00', 'Austausch der Rückseite / Backcover', 1, 8),
(11410, 'Samsung Galaxy S21', '219.00', 'Display  Reparatur. inkl. Akku und Rahmen', 1, 2),
(11411, 'Samsung Galaxy S21', '69.00', 'Austausch des Akkus', 1, 2),
(11412, 'Samsung Galaxy S21', '39.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11413, 'Samsung Galaxy S21', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11415, 'Samsung Galaxy S20 FE', '129.00', 'Display  Reparatur. Original', 1, 2),
(11416, 'Samsung Galaxy S20 FE', '59.00', 'USBPort  Reparatur', 1, 2),
(11417, 'Samsung Galaxy S20 FE', '59.00', 'Austausch des Akkus', 1, 2),
(11418, 'Samsung Galaxy S21', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11419, 'Samsung Galaxy S20 FE', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11420, 'Samsung Galaxy S20 FE', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11421, 'Samsung Galaxy S20 FE', '39.00', 'Austausch des Kameraglases', 1, 2),
(11423, 'Samsung Galaxy S21', '79.00', 'USBPort  Reparatur', 1, 2),
(11424, 'Samsung Galaxy S20 Plus', '269.00', 'Display  Reparatur', 1, 2),
(11425, 'Samsung Galaxy S20 Plus', '69.00', 'Austausch des Akkus', 1, 2),
(11426, 'Samsung Galaxy S20 Plus', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11427, 'Samsung Galaxy S20 Plus', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11428, 'Samsung Galaxy S20 Plus', '29.00', 'Austausch des Kameraglases', 1, 2),
(11429, 'Samsung Galaxy S20 Plus', '69.00', 'Austausch der Glasrückseite', 1, 2),
(11431, 'Samsung Galaxy S20 Ultra', '279.00', 'Display  Reparatur', 1, 2),
(11432, 'Samsung Galaxy S20 Ultra', '59.00', 'USBPort  Reparatur', 1, 2),
(11433, 'Samsung Galaxy S20 Ultra', '59.00', 'Austausch des Akkus', 1, 2),
(11434, 'Samsung Galaxy S20 Ultra', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11435, 'Samsung Galaxy S20 Ultra', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11436, 'Samsung Galaxy S20 Ultra', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11437, 'Samsung Galaxy S21', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11438, 'Samsung Galaxy S10', '229.00', 'Display  Reparatur', 1, 2),
(11440, 'Samsung Galaxy S20 Plus', '59.00', 'USBPort  Reparatur', 1, 2),
(11441, 'Samsung Galaxy S20 FE', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11442, 'Samsung Galaxy S10', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11443, 'Samsung Galaxy S10', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11445, 'Samsung Galaxy S10', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11446, 'Samsung Galaxy S21 Ultra', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11447, 'Samsung Galaxy S21 Ultra', '319.00', 'Display  Reparatur. inkl. Akku und Rahmen', 1, 2),
(11448, 'Samsung Galaxy S21 Ultra', '69.00', 'Austausch des Akkus', 1, 2),
(11449, 'Samsung Galaxy S21 Ultra', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11450, 'Samsung Galaxy S21 Ultra', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11451, 'Samsung Galaxy S21 Ultra', '39.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11453, 'Samsung Galaxy S10e', '189.00', 'Display  Reparatur. Original', 1, 2),
(11454, 'Samsung Galaxy S10e', '49.00', 'Austausch des Akkus', 1, 2),
(11455, 'Samsung Galaxy S10', '49.00', 'Austausch des Akkus', 1, 2),
(11456, 'Samsung Galaxy S10e', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11457, 'Samsung Galaxy S10e', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11458, 'Samsung Galaxy S10e', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11460, 'Samsung Galaxy S10 Lite', '169.00', 'Display  Reparatur. Original', 1, 2),
(11461, 'Samsung Galaxy S10 Lite', '49.00', 'USBPort  Reparatur inkl. Mikrofon', 1, 2),
(11462, 'Samsung Galaxy S10 Lite', '49.00', 'Austausch des Akkus', 1, 2),
(11463, 'Samsung Galaxy S10 Lite', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11464, 'Samsung Galaxy S10e', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11465, 'Samsung Galaxy S10 Lite', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11466, 'Samsung Galaxy S21 Ultra', '79.00', 'USBPort  Reparatur', 1, 2),
(11467, 'Samsung Galaxy S10+', '259.00', 'Display  Reparatur', 1, 2),
(11469, 'Samsung Galaxy S10+', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11470, 'Samsung Galaxy S10+', '49.00', 'Austausch des Akkus', 1, 2),
(11471, 'Samsung Galaxy S10+', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11472, 'Samsung Galaxy S10+', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11473, 'Samsung Galaxy S10+', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11475, 'Samsung Galaxy S9 Plus', '229.00', 'Display  Reparatur. Original', 1, 2),
(11476, 'Samsung Galaxy S9 Plus', '49.00', 'USBPort  Reparatur', 1, 2),
(11477, 'Samsung Galaxy S10', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11478, 'Samsung Galaxy S9 Plus', '49.00', 'Austausch des Akkus', 1, 2),
(11479, 'Samsung Galaxy S9 Plus', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11480, 'Samsung Galaxy S10 Lite', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11481, 'Samsung Galaxy S9 Plus', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11482, 'Samsung Galaxy S8', '189.00', 'Display  Reparatur. Original', 1, 2),
(11484, 'Samsung Galaxy S8', '49.00', 'USBPort  Reparatur', 1, 2),
(11485, 'Samsung Galaxy S8', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11486, 'Samsung Galaxy S8', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11487, 'Samsung Galaxy S8', '49.00', 'Austausch des Akkus', 1, 2),
(11488, 'Samsung Galaxy S9 Plus', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11489, 'Samsung Galaxy S8', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11491, 'Samsung Galaxy S8 Plus', '189.00', 'Display  Reparatur. Original', 1, 2),
(11492, 'Samsung Galaxy S8 Plus', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11493, 'Samsung Galaxy S8 Plus', '49.00', 'USBPort  Reparatur', 1, 2),
(11494, 'Samsung Galaxy S8 Plus', '49.00', 'Austausch des Akkus', 1, 2),
(11495, 'Samsung Galaxy S8 Plus', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11496, 'Samsung Galaxy S8 Plus', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11498, 'Samsung Galaxy S8 Plus', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11499, 'Samsung Galaxy S7 Edge', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11500, 'Samsung Galaxy S7 Edge', '189.00', 'Display  Reparatur', 1, 2),
(11501, 'Samsung Galaxy S7 Edge', '49.00', 'Austausch des Akkus', 1, 2),
(11502, 'Samsung Galaxy S7 Edge', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11503, 'Samsung Galaxy S7 Edge', '19.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11504, 'Samsung Galaxy S9 Plus', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11505, 'Samsung Galaxy S20', '239.00', 'Display  Reparatur. Original', 1, 2),
(11506, 'Samsung Galaxy S20', '79.00', 'USBPort  Reparatur', 1, 2),
(11507, 'Samsung Galaxy S20', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11508, 'Samsung Galaxy S20', '69.00', 'Austausch des Akkus', 1, 2),
(11509, 'Samsung Galaxy S20', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11510, 'Samsung Galaxy S20', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11511, 'Samsung Galaxy S10 Lite', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11513, 'Samsung Galaxy A12', '79.00', 'Display  Reparatur inkl. Rahmen und Akku', 1, 2),
(11514, 'Samsung Galaxy A22', '79.00', 'Display  Reparatur inkl. Rahmen', 1, 2),
(11515, 'Samsung Galaxy A32', '99.00', 'Display  Reparatur inkl. Rahmen und Akku', 1, 2),
(11516, 'Samsung Galaxy A32 5G', '99.00', 'Display  Reparatur inkl. Rahmen', 1, 2),
(11517, 'Samsung Galaxy A42', '89.00', 'Display  Reparatur inkl. Rahmen', 1, 2),
(11518, 'Samsung Galaxy A12 / A22 / A32 / A42', '39.00', 'USBPort  Reparatur', 1, 2),
(11519, 'Samsung Galaxy A12 / A22 / A32 / A42', '39.00', 'Austausch des Akkus', 1, 2),
(11520, 'Samsung Galaxy A12 / A22 / A32 / A42', '29.00', 'PowerTaste / VolumeTasten', 1, 2),
(11521, 'Samsung Galaxy A12 / A22 / A32 / A42', '39.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11522, 'Samsung Galaxy A12 / A22 / A32 / A42', '39.00', 'Austausch der Rückseite', 1, 2),
(11523, 'Samsung Galaxy A12 / A22 / A32 / A42', '29.00', 'Austausch des Kameraglases', 1, 2),
(11525, 'Samsung Galaxy A52', '149.00', 'Display  Reparatur inkl. Rahmen und Akku', 1, 2),
(11526, 'Samsung Galaxy A72', '109.00', 'Display  Reparatur inkl. Rahmen und Akku', 1, 2),
(11527, 'Samsung Galaxy A52 / A72', '39.00', 'Austausch des Akkus', 1, 2),
(11528, 'Samsung Galaxy A52 / A72', '39.00', 'USBPort  Reparatur', 1, 2),
(11529, 'Samsung Galaxy A52 / A72', '29.00', 'PowerTaste / VolumeTasten', 1, 2),
(11530, 'Samsung Galaxy S20', '39.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11531, 'Samsung Galaxy A52 / A72', '39.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11532, 'Samsung Galaxy A52 / A72', '29.00', 'Austausch des Kameraglases', 1, 2),
(11534, 'Samsung Galaxy A31 / A41', '99.00', 'Display  Reparatur', 1, 2),
(11535, 'Samsung Galaxy A51 / A71', '119.00', 'Display  Reparatur', 1, 2),
(11536, 'Samsung Galaxy A31 / A41 / A51 / A71', '39.00', 'Austausch des Akkus', 1, 2),
(11537, 'Samsung Galaxy A31 / A41 / A51 / A71', '39.00', 'USBPort  Reparatur', 1, 2),
(11538, 'Samsung Galaxy A31 / A41 / A51 / A71', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11539, 'Samsung Galaxy A31 / A41 / A51 / A71', '39.00', 'Austausch der Rückseite', 1, 2),
(11540, 'Samsung Galaxy A31 / A41 / A51 / A71', '39.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11541, 'Samsung Galaxy A31 / A41 / A51 / A71', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11543, 'Samsung Galaxy A30 / A40 / A50', '39.00', 'USBPort  Reparatur', 1, 2),
(11544, 'Samsung Galaxy A30 / A40 / A50', '124.00', 'KOMBIANGEBOT: Display  Reparatur inkl. neuem Akku', 1, 2),
(11545, 'Samsung Galaxy A30 / A40 / A50', '99.00', 'Display  Reparatur', 1, 2),
(11546, 'Samsung Galaxy A30 / A40 / A50', '39.00', 'Austausch des Akkus', 1, 2),
(11547, 'Samsung Galaxy A30 / A40 / A50', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11548, 'Samsung Galaxy A30 / A40 / A50', '39.00', 'Austausch der Rückseite', 1, 2),
(11549, 'Samsung Galaxy A30 / A40 / A50', '39.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11550, 'Samsung Galaxy A30 / A40 / A50', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11551, 'Samsung Galaxy S8', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11554, 'Samsung Galaxy A52 / A72', '39.00', 'Austausch der Rückseite', 1, 2),
(11555, 'Samsung Galaxy A70 / A80', '49.00', 'USBPort  Reparatur', 1, 2),
(11556, 'Samsung Galaxy A70 / A80', '39.00', 'Austausch des Akkus', 1, 2),
(11557, 'Samsung Galaxy A70 / A80', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11558, 'Samsung Galaxy A70 / A80', '39.00', 'Austausch der Rückseite', 1, 2),
(11559, 'Samsung Galaxy A70 / A80', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11560, 'Samsung Galaxy A70 / A80', '49.00', 'PowerTaste / VolumeTasten', 1, 2),
(11562, 'Samsung Galaxy A3 (2017) SMA320', '109.00', 'KOMBIANGEBOT: Display  Reparatur inkl. neuem Akku', 1, 2),
(11563, 'Samsung Galaxy A3 (2017) SMA320', '29.00', 'Austausch der Glasrückseite', 1, 2),
(11564, 'Samsung Galaxy A3 (2017) SMA320', '39.00', 'Austausch des Akkus', 1, 2),
(11565, 'Samsung Galaxy A3 (2017) SMA320', '19.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11566, 'Samsung Galaxy A5 (2017) SMA520', '129.00', 'KOMBIANGEBOT: Display  Reparatur inkl. neuem Akku', 1, 2),
(11567, 'Samsung Galaxy A3 (2017) SMA320', '89.00', 'Display  Reparatur', 1, 2),
(11568, 'Samsung Galaxy A5 (2017) SMA520', '109.00', 'Display  Reparatur', 1, 2),
(11569, 'Samsung Galaxy A5 (2017) SMA520', '39.00', 'Austausch des Akkus', 1, 2),
(11570, 'Samsung Galaxy A5 (2017) SMA520', '39.00', 'Austausch der Glasrückseite', 1, 2),
(11571, 'Samsung Galaxy A5 (2017) SMA520', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11573, 'Samsung Galaxy A6 (2018) SMA600', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11574, 'Samsung Galaxy A6+ (2018) SMA605', '99.00', 'Display  Reparatur', 1, 2),
(11575, 'Samsung Galaxy A7 (2018) SMA750', '89.00', 'Display  Reparatur', 1, 2),
(11576, 'Samsung Galaxy A7 (2018) SMA750', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11577, 'Samsung Galaxy A7 (2018) SMA750', '39.00', 'Austausch des Akkus', 1, 2),
(11578, 'Samsung Galaxy A7 (2018) SMA750', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11579, 'Samsung Galaxy A8 (2018) SMA530', '109.00', 'Display  Reparatur', 1, 2),
(11580, 'Samsung Galaxy A8 (2018) SMA530', '49.00', 'Austausch des Akkus', 1, 2),
(11581, 'Samsung Galaxy A8 (2018) SMA530', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11583, 'Samsung Galaxy S9', '219.00', 'Display  Reparatur. Original', 1, 2),
(11584, 'Samsung Galaxy A8 (2018) SMA530', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11585, 'Samsung Galaxy S9', '49.00', 'Austausch des Akkus', 1, 2),
(11586, 'Samsung Galaxy S9', '49.00', 'USBPort  Reparatur', 1, 2),
(11587, 'Samsung Galaxy S9', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11588, 'Samsung Galaxy S9', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11589, 'Samsung Galaxy S9', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11590, 'Samsung Galaxy S9', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11592, 'Samsung Galaxy J6 SMJ600 (2018)', '79.00', 'Display  Reparatur', 1, 2),
(11593, 'Samsung Galaxy J6 SMJ600 (2018)', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11595, 'Samsung Galaxy M31s', '99.00', 'Display  Reparatur', 1, 2),
(11596, 'Samsung Galaxy M31', '89.00', 'Display  Reparatur', 1, 2),
(11597, 'Samsung Galaxy M31 / M31s / M51', '39.00', 'Austausch des Akkus', 1, 2),
(11598, 'Samsung Galaxy M51', '119.00', 'Display  Reparatur', 1, 2),
(11599, 'Samsung Galaxy M31 / M31s / M51', '39.00', 'USBPort  Reparatur', 1, 2),
(11600, 'Samsung Galaxy M31 / M31s / M51', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11601, 'Samsung Galaxy M31 / M31s / M51', '39.00', 'Austausch der Rückseite', 1, 2),
(11602, 'Samsung Galaxy M31 / M31s / M51', '39.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11603, 'Samsung Galaxy M31 / M31s / M51', '29.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11605, 'Samsung Galaxy Note 20', '199.00', 'Display  Reparatur', 1, 2),
(11606, 'Samsung Galaxy Note 20', '59.00', 'Austausch des Akkus', 1, 2),
(11607, 'Samsung Galaxy Note 20', '69.00', 'USBPort  Reparatur', 1, 2),
(11608, 'Samsung Galaxy Note 20', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11609, 'Samsung Galaxy Note 20', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11610, 'Samsung Galaxy A6 (2018) SMA600', '79.00', 'Display  Reparatur', 1, 2),
(11611, 'Samsung Galaxy Note 20 Ultra', '299.00', 'Display  Reparatur', 1, 2),
(11612, 'Samsung Galaxy A70 / A80', '119.00', 'Display  Reparatur', 1, 2),
(11613, 'Samsung Galaxy Note 20 Ultra', '69.00', 'USBPort  Reparatur', 1, 2),
(11614, 'Samsung Galaxy Note 20 Ultra', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11615, 'Samsung Galaxy Note 20 Ultra', '69.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11617, 'Samsung Galaxy Note 20 Ultra', '69.00', 'Austausch der Glasrückseite', 1, 2),
(11618, 'Samsung Galaxy Note 10 SMN970', '59.00', 'Austausch des Akkus', 1, 2),
(11619, 'Samsung Galaxy Note 10 SMN970', '249.00', 'Display  Reparatur', 1, 2),
(11620, 'Samsung Galaxy Note 10 SMN970', '59.00', 'USBPort  Reparatur', 1, 2),
(11621, 'Samsung Galaxy Note 10 SMN970', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11622, 'Samsung Galaxy Note 10 SMN970', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11623, 'Samsung Galaxy Note 10 SMN970', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11624, 'Samsung Galaxy Note 10 Plus SMN975', '59.00', 'Austausch des Akkus', 1, 2),
(11625, 'Samsung Galaxy Note 10 Plus SMN975', '279.00', 'Display  Reparatur', 1, 2),
(11626, 'Samsung Galaxy Note 10 Plus SMN975', '69.00', 'USBPort  Reparatur', 1, 2),
(11627, 'Samsung Galaxy Note 10 Plus SMN975', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11628, 'Samsung Galaxy Note 10 Plus SMN975', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11630, 'Samsung Galaxy A6+ (2018) SMA605', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11631, 'Samsung Galaxy Note 8 SMN950', '209.00', 'Display  Reparatur', 1, 2),
(11632, 'Samsung Galaxy Note 8 SMN950', '49.00', 'USBPort  Reparatur', 1, 2),
(11633, 'Samsung Galaxy Note 8 SMN950', '49.00', 'Austausch des Akkus', 1, 2),
(11634, 'Samsung Galaxy Note 8 SMN950', '39.00', 'PowerTaste / VolumeTasten', 1, 2),
(11635, 'Samsung Galaxy Note 8 SMN950', '49.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11636, 'Samsung Galaxy Note 8 SMN950', '39.00', 'Austausch der Glasrückseite', 1, 2),
(11637, 'Samsung Galaxy Note 8 SMN950', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11639, 'Samsung Galaxy Note 9 SMN960', '249.00', 'Display  Reparatur', 1, 2),
(11640, 'Samsung Galaxy Note 9 SMN960', '59.00', 'Austausch des Akkus', 1, 2),
(11641, 'Samsung Galaxy Note 9 SMN960', '59.00', 'USBPort  Reparatur', 1, 2),
(11642, 'Samsung Galaxy Note 9 SMN960', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11643, 'Samsung Galaxy Note 9 SMN960', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11644, 'Samsung Galaxy Note 9 SMN960', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11645, 'Samsung Galaxy Note 9 SMN960', '29.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11647, 'Samsung Galaxy J3 SMJ330 (2017)', '69.00', 'Display  Reparatur', 1, 2),
(11648, 'Samsung Galaxy J3 SMJ330 (2017)', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11649, 'Samsung Galaxy J5 SMJ530 (2017)', '79.00', 'Display  Reparatur', 1, 2),
(11650, 'Samsung Galaxy J5 SMJ530 (2017)', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11651, 'Samsung Galaxy J7 SMJ730 (2017)', '99.00', 'Display  Reparatur', 1, 2),
(11652, 'Samsung Galaxy J7 SMJ730 (2017)', '19.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11653, 'Samsung Galaxy S7', '119.00', 'Display  Reparatur', 1, 2),
(11655, 'Samsung Galaxy S7', '39.00', 'Austausch des Akkus', 1, 2),
(11656, 'Samsung Galaxy S7', '144.00', 'KOMBIANGEBOT: Display  Reparatur inkl. neuem Akku', 1, 2),
(11657, 'Samsung Galaxy S7', '29.00', 'PowerTaste / VolumeTasten', 1, 2),
(11658, 'Samsung Galaxy S7', '49.00', 'Austausch der Glasrückseite', 1, 2),
(11659, 'Samsung Galaxy S21 Plus', '219.00', 'Display  Reparatur. inkl. Akku und Rahmen', 1, 2),
(11661, 'Samsung Galaxy S7', '19.00', 'Austausch des Kameraglases (ohne Rahmen)', 1, 2),
(11662, 'Samsung Galaxy S21 Plus', '79.00', 'USBPort  Reparatur', 1, 2),
(11663, 'Samsung Galaxy Note 20', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11664, 'Samsung Galaxy S21 Plus', '59.00', 'Austausch der Glasrückseite', 1, 2),
(11665, 'Samsung Galaxy S21 Plus', '59.00', 'Hörer / Lautsprecher / Mikrofon', 1, 2),
(11666, 'Samsung Galaxy S21 Plus', '59.00', 'PowerTaste / VolumeTasten', 1, 2),
(11667, 'Samsung Galaxy S21 Plus', '39.00', 'Austausch der Kameralinse (ohne Rahmen)', 1, 2),
(11669, 'Samsung Galaxy S21 Plus', '69.00', 'Austausch des Akkus', 1, 2),
(11670, 'Samsung Galaxy Note 20 Ultra', '59.00', 'Austausch des Akkus', 1, 2),
(11671, 'Samsung Galaxy Note 10 Plus SMN975', '59.00', 'Austausch der Glasrückseite', 1, 2),
(20656, 'iPhone 12 Pro Max', '99.00', 'Akku ', 1, 1),
(113598, 'iPhone 12 Pro Max', '399.00', 'Display ', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblname`
--

CREATE TABLE `tblname` (
  `ID` int DEFAULT NULL,
  `IMAGE` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblname`
--

INSERT INTO `tblname` (`ID`, `IMAGE`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `isActive` int NOT NULL,
  `herstellerID` int NOT NULL,
  `minPreis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `type`, `isActive`, `herstellerID`, `minPreis`) VALUES
(1, 'iPhone 12 Pro Max', 1, 1, 29),
(2, 'iPhone 12 pro', 1, 1, 29),
(3, 'iPhone 12', 1, 1, 29),
(4, 'iPhone 12 Mini', 1, 1, 29),
(5, 'iPhone SE 2020', 1, 1, 29),
(6, 'iPhone 11 Pro Max', 1, 1, 29),
(7, 'iPhone 11 Pro', 1, 1, 29),
(8, 'iPhone 11', 1, 1, 29),
(9, 'iPhone XR', 1, 1, 29),
(10, 'iPhone XS', 1, 1, 29),
(11, 'iPhone XS Max', 1, 1, 29),
(12, 'iPhone X', 1, 1, 29),
(13, 'iPhone 8 Plus', 1, 1, 29),
(14, 'iPhone 8', 1, 1, 29),
(15, 'iPhone 7 Plus', 1, 1, 29),
(16, 'iPhone 7', 1, 1, 29),
(17, 'iPhone 6s Plus', 1, 1, 29),
(18, 'iPhone 6s', 1, 1, 29),
(19, 'iPhone 6', 1, 1, 29),
(20, 'iPhone SE', 1, 1, 29),
(146, 'Samsung Galaxy S21', 1, 2, 29),
(147, 'Samsung Galaxy S20 FE', 1, 2, 29),
(148, 'Samsung Galaxy S20 Plus', 1, 2, 29),
(149, 'Samsung Galaxy S20 Ultra', 1, 2, 29),
(150, 'Samsung Galaxy S10', 1, 2, 29),
(151, 'Samsung Galaxy S21 Ultra', 1, 2, 29),
(152, 'Samsung Galaxy S10e', 1, 2, 29),
(153, 'Samsung Galaxy S10 Lite', 1, 2, 29),
(154, 'Samsung Galaxy S10+', 1, 2, 29),
(155, 'Samsung Galaxy S9 Plus', 1, 2, 29),
(156, 'Samsung Galaxy S8', 1, 2, 29),
(157, 'Samsung Galaxy S8 Plus', 1, 2, 29),
(158, 'Samsung Galaxy S7 Edge', 1, 2, 29),
(159, 'Samsung Galaxy S20', 1, 2, 29),
(160, 'Samsung Galaxy A12', 1, 2, 29),
(161, 'Samsung Galaxy A22', 1, 2, 29),
(162, 'Samsung Galaxy A32', 1, 2, 29),
(163, 'Samsung Galaxy A32 5G', 1, 2, 29),
(164, 'Samsung Galaxy A42', 1, 2, 29),
(165, 'Samsung Galaxy A12 / A22 / A32 / A42', 1, 2, 29),
(166, 'Samsung Galaxy A52', 1, 2, 29),
(167, 'Samsung Galaxy A72', 1, 2, 29),
(168, 'Samsung Galaxy A52 / A72', 1, 2, 29),
(169, 'Samsung Galaxy A31 / A41', 1, 2, 29),
(170, 'Samsung Galaxy A51 / A71', 1, 2, 29),
(171, 'Samsung Galaxy A31 / A41 / A51 / A71', 1, 2, 29),
(172, 'Samsung Galaxy A30 / A40 / A50', 1, 2, 29),
(173, 'Samsung Galaxy A70 / A80', 1, 2, 29),
(174, 'Samsung Galaxy A3 (2017) SMA320', 1, 2, 29),
(175, 'Samsung Galaxy A5 (2017) SMA520', 1, 2, 29),
(176, 'Samsung Galaxy A6 (2018) SMA600', 1, 2, 29),
(177, 'Samsung Galaxy A6+ (2018) SMA605', 1, 2, 29),
(178, 'Samsung Galaxy A7 (2018) SMA750', 1, 2, 29),
(179, 'Samsung Galaxy A8 (2018) SMA530', 1, 2, 29),
(180, 'Samsung Galaxy S9', 1, 2, 29),
(181, 'Samsung Galaxy J6 SMJ600 (2018)', 1, 2, 29),
(182, 'Samsung Galaxy M31s', 1, 2, 29),
(183, 'Samsung Galaxy M31', 1, 2, 29),
(184, 'Samsung Galaxy M31 / M31s / M51', 1, 2, 29),
(185, 'Samsung Galaxy M51', 1, 2, 29),
(186, 'Samsung Galaxy Note 20', 1, 2, 29),
(187, 'Samsung Galaxy Note 20 Ultra', 1, 2, 29),
(188, 'Samsung Galaxy Note 10 SMN970', 1, 2, 29),
(189, 'Samsung Galaxy Note 10 Plus SMN975', 1, 2, 29),
(190, 'Samsung Galaxy Note 8 SMN950', 1, 2, 29),
(191, 'Samsung Galaxy Note 9 SMN960', 1, 2, 29),
(192, 'Samsung Galaxy J3 SMJ330 (2017)', 1, 2, 29),
(193, 'Samsung Galaxy J5 SMJ530 (2017)', 1, 2, 29),
(194, 'Samsung Galaxy J7 SMJ730 (2017)', 1, 2, 29),
(195, 'Samsung Galaxy S7', 1, 2, 29),
(196, 'Samsung Galaxy S21 Plus', 1, 2, 29);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `isActive` tinyint NOT NULL,
  `isTechniker` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `timestamp`, `isActive`, `isTechniker`) VALUES
(5, 'test@test.de', '$2y$10$ZJWZGy3aU3qapSSd7J88ROPIS9IxnxhY78ypDHLQYiT0euIexviue', 1632567049, 1, NULL),
(6, 'zsuzsi@zsuzsi.de', '$2y$10$/3yUYsf5xVgHrPadVmTQJuBfINDiCaA3zqWS8fJiDQxTAodTWJG6y', 1632572175, 1, NULL),
(37, 'lola@lola.de', '$2y$10$7ZpNtsP.ie3vdHt2MIVrq.YCLd6C7T5RRKp1h6hcjVlamQK6ZtT7e', 1632603327, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hersteller`
--
ALTER TABLE `hersteller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preise`
--
ALTER TABLE `preise`
  ADD PRIMARY KEY (`preiseID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hersteller`
--
ALTER TABLE `hersteller`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `preise`
--
ALTER TABLE `preise`
  MODIFY `preiseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113599;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
